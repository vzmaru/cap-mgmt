// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.tuc.capacity.web;

import com.tuc.capacity.entity.Associate;
import com.tuc.capacity.web.AssociateController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect AssociateController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByEidEquals", "form" }, method = RequestMethod.GET)
    public String AssociateController.findAssociatesByEidEqualsForm(Model uiModel) {
        return "associates/findAssociatesByEidEquals";
    }
    
    @RequestMapping(params = "find=ByEidEquals", method = RequestMethod.GET)
    public String AssociateController.findAssociatesByEidEquals(@RequestParam("eid") String eid, Model uiModel) {
        uiModel.addAttribute("associates", Associate.findAssociatesByEidEquals(eid).getResultList());
        return "associates/list";
    }
    
    @RequestMapping(params = { "find=ByEmpIdEquals", "form" }, method = RequestMethod.GET)
    public String AssociateController.findAssociatesByEmpIdEqualsForm(Model uiModel) {
        return "associates/findAssociatesByEmpIdEquals";
    }
    
    @RequestMapping(params = "find=ByEmpIdEquals", method = RequestMethod.GET)
    public String AssociateController.findAssociatesByEmpIdEquals(@RequestParam("empId") String empId, Model uiModel) {
        uiModel.addAttribute("associates", Associate.findAssociatesByEmpIdEquals(empId).getResultList());
        return "associates/list";
    }
    
    @RequestMapping(params = { "find=ByEmpIdLike", "form" }, method = RequestMethod.GET)
    public String AssociateController.findAssociatesByEmpIdLikeForm(Model uiModel) {
        return "associates/findAssociatesByEmpIdLike";
    }
    
    @RequestMapping(params = "find=ByEmpIdLike", method = RequestMethod.GET)
    public String AssociateController.findAssociatesByEmpIdLike(@RequestParam("empId") String empId, Model uiModel) {
        uiModel.addAttribute("associates", Associate.findAssociatesByEmpIdLike(empId).getResultList());
        return "associates/list";
    }
    
}