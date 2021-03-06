// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.tuc.capacity.web;

import com.tuc.capacity.entity.Sow;
import com.tuc.capacity.web.SowController;
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

privileged aspect SowController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String SowController.create(@Valid Sow sow, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sow);
            return "sows/create";
        }
        uiModel.asMap().clear();
        sow.persist();
        return "redirect:/sows/" + encodeUrlPathSegment(sow.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String SowController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Sow());
        return "sows/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String SowController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("sow", Sow.findSow(id));
        uiModel.addAttribute("itemId", id);
        return "sows/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String SowController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("sows", Sow.findSowEntries(firstResult, sizeNo));
            float nrOfPages = (float) Sow.countSows() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("sows", Sow.findAllSows());
        }
        return "sows/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String SowController.update(@Valid Sow sow, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sow);
            return "sows/update";
        }
        uiModel.asMap().clear();
        sow.merge();
        return "redirect:/sows/" + encodeUrlPathSegment(sow.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String SowController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Sow.findSow(id));
        return "sows/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String SowController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Sow sow = Sow.findSow(id);
        sow.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/sows";
    }
    
    void SowController.populateEditForm(Model uiModel, Sow sow) {
        uiModel.addAttribute("sow", sow);
    }
    
    String SowController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
