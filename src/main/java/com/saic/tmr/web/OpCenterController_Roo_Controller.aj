// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.saic.tmr.web;

import com.saic.tmr.domain.OpCenter;
import com.saic.tmr.web.OpCenterController;
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

privileged aspect OpCenterController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String OpCenterController.create(@Valid OpCenter opCenter, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, opCenter);
            return "opcenters/create";
        }
        uiModel.asMap().clear();
        opCenter.persist();
        return "redirect:/opcenters/" + encodeUrlPathSegment(opCenter.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String OpCenterController.createForm(Model uiModel) {
        populateEditForm(uiModel, new OpCenter());
        return "opcenters/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String OpCenterController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("opcenter", OpCenter.findOpCenter(id));
        uiModel.addAttribute("itemId", id);
        return "opcenters/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String OpCenterController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("opcenters", OpCenter.findOpCenterEntries(firstResult, sizeNo));
            float nrOfPages = (float) OpCenter.countOpCenters() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("opcenters", OpCenter.findAllOpCenters());
        }
        return "opcenters/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String OpCenterController.update(@Valid OpCenter opCenter, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, opCenter);
            return "opcenters/update";
        }
        uiModel.asMap().clear();
        opCenter.merge();
        return "redirect:/opcenters/" + encodeUrlPathSegment(opCenter.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String OpCenterController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, OpCenter.findOpCenter(id));
        return "opcenters/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String OpCenterController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        OpCenter opCenter = OpCenter.findOpCenter(id);
        opCenter.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/opcenters";
    }
    
    void OpCenterController.populateEditForm(Model uiModel, OpCenter opCenter) {
        uiModel.addAttribute("opCenter", opCenter);
    }
    
    String OpCenterController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
