package com.tuc.capacity.web;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tuc.capacity.service.RosterService;

@RequestMapping("/roster/**")
@Controller
public class RosterController {

    private RosterService rosterSvc = new RosterService();

	@RequestMapping(method = RequestMethod.POST, value = "{id}")
    public void post(@PathVariable Long id, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
    }

    @RequestMapping
    public String index() {
        return "roster/index";
    }

    @RequestMapping(params = "form", produces = "text/html")
    public String uploadForm(Model uiModel) {
    	
        return "roster/upload";
    }

    @RequestMapping(method=RequestMethod.POST)
    public String upload(@RequestParam("file") MultipartFile file) {
    	String name = null;
        if (!file.isEmpty()) {
            try {
                InputStream xlFile = file.getInputStream();
                name = file.getOriginalFilename();
                Workbook workbook = null;
                boolean xssf = name.toLowerCase().endsWith("xlsx");
                //Create Workbook instance holding reference to .xlsx file
                if (xssf) {
                    workbook = new XSSFWorkbook(xlFile);
                } else {
                	workbook = new HSSFWorkbook(xlFile);
                }

                //Get first/desired sheet from the workbook
                Sheet sheet = workbook.getSheet("roster");

                //Iterate through each rows one by one
                Iterator<Row> rowIterator = sheet.iterator();
                
                // Skip header - first 5 rows
                int i = 0;
                while (rowIterator.hasNext())
                {
                	rowIterator.next();
                	if (++i >= 5) break;
                }
                
                if (i < 5) {
                	// TODO - return error message
                	return "roster/index";
                }
                
                FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
                
                while (rowIterator.hasNext())
                {
                    Row row = rowIterator.next();
                    //For each row, iterate through all the columns
                    Iterator<Cell> cellIterator = row.cellIterator();
                    List<String> rowData = new ArrayList<String>();
                    while (cellIterator.hasNext())
                    {
                        Cell cell = cellIterator.next();
                        switch (evaluator.evaluateInCell(cell).getCellType())
                        {
                            case Cell.CELL_TYPE_NUMERIC:
                            	rowData.add(String.valueOf(cell.getNumericCellValue()));
                                break;
                            case Cell.CELL_TYPE_STRING:
                            	rowData.add(cell.getStringCellValue());
                                break;
                            default:
                            	rowData.add("");
                        }
                    }
                    rosterSvc.addRecord(rowData);
                }
                xlFile.close();
            } catch (Exception e) {
                // return "You failed to upload " + name + " => " + e.getMessage();
            	e.printStackTrace();
            }
        } else {
            // return "You failed to upload " + name + " because the file was empty.";
        }
    	return "roster/index";
    }
}
