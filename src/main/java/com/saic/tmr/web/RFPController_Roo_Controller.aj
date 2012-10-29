// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.saic.tmr.web;

import com.saic.tmr.domain.Award;
import com.saic.tmr.domain.Command;
import com.saic.tmr.domain.Company;
import com.saic.tmr.domain.ContractType;
import com.saic.tmr.domain.ProcurementType;
import com.saic.tmr.domain.Pursuit;
import com.saic.tmr.domain.PursuitStatus;
import com.saic.tmr.domain.RFP;
import com.saic.tmr.web.RFPController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect RFPController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String RFPController.create(@Valid RFP RFP_, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, RFP_);
            return "rfps/create";
        }
        uiModel.asMap().clear();
        RFP_.persist();
        return "redirect:/rfps/" + encodeUrlPathSegment(RFP_.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String RFPController.createForm(Model uiModel) {
        populateEditForm(uiModel, new RFP());
        return "rfps/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String RFPController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("rfp_", RFP.findRFP(id));
        uiModel.addAttribute("itemId", id);
        return "rfps/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String RFPController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("rfps", RFP.findRFPEntries(firstResult, sizeNo));
            float nrOfPages = (float) RFP.countRFPS() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("rfps", RFP.findAllRFPS());
        }
        addDateTimeFormatPatterns(uiModel);
        return "rfps/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String RFPController.update(@Valid RFP RFP_, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, RFP_);
            return "rfps/update";
        }
        uiModel.asMap().clear();
        RFP_.merge();
        return "redirect:/rfps/" + encodeUrlPathSegment(RFP_.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String RFPController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, RFP.findRFP(id));
        return "rfps/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String RFPController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        RFP RFP_ = RFP.findRFP(id);
        RFP_.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/rfps";
    }
    
    void RFPController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("RFP__advancenoticeenddate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("RFP__rfpissuedate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("RFP__submittaldate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void RFPController.populateEditForm(Model uiModel, RFP RFP_) {
        uiModel.addAttribute("RFP_", RFP_);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("awards", Award.findAllAwards());
        uiModel.addAttribute("commands", Command.findAllCommands());
        uiModel.addAttribute("companys", Company.findAllCompanys());
        uiModel.addAttribute("contracttypes", ContractType.findAllContractTypes());
        uiModel.addAttribute("procurementtypes", ProcurementType.findAllProcurementTypes());
        uiModel.addAttribute("pursuits", Pursuit.findAllPursuits());
        uiModel.addAttribute("pursuitstatuses", PursuitStatus.findAllPursuitStatuses());
    }
    
    String RFPController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
