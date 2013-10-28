// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.tuc.capacity.web;

import com.tuc.capacity.entity.mstr.ProjectType;
import com.tuc.capacity.web.ProjectTypeController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ProjectTypeController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ProjectTypeController.create(@Valid ProjectType projectType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, projectType);
            return "projecttypes/create";
        }
        uiModel.asMap().clear();
        projectType.persist();
        return "redirect:/projecttypes/" + encodeUrlPathSegment(projectType.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ProjectTypeController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ProjectType());
        return "projecttypes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ProjectTypeController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("projecttype", ProjectType.findProjectType(id));
        uiModel.addAttribute("itemId", id);
        return "projecttypes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ProjectTypeController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("projecttypes", ProjectType.findProjectTypeEntries(firstResult, sizeNo));
            float nrOfPages = (float) ProjectType.countProjectTypes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("projecttypes", ProjectType.findAllProjectTypes());
        }
        return "projecttypes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ProjectTypeController.update(@Valid ProjectType projectType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, projectType);
            return "projecttypes/update";
        }
        uiModel.asMap().clear();
        projectType.merge();
        return "redirect:/projecttypes/" + encodeUrlPathSegment(projectType.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ProjectTypeController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, ProjectType.findProjectType(id));
        return "projecttypes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ProjectTypeController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ProjectType projectType = ProjectType.findProjectType(id);
        projectType.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/projecttypes";
    }
    
    void ProjectTypeController.populateEditForm(Model uiModel, ProjectType projectType) {
        uiModel.addAttribute("projectType", projectType);
    }
    
    String ProjectTypeController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
