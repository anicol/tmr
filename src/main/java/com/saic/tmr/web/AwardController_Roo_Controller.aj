// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.saic.tmr.web;

import com.saic.tmr.domain.Award;
import com.saic.tmr.domain.Company;
import com.saic.tmr.domain.RFP;
import com.saic.tmr.web.AwardController;
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

privileged aspect AwardController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String AwardController.create(@Valid Award award, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, award);
            return "awards/create";
        }
        uiModel.asMap().clear();
        award.persist();
        return "redirect:/awards/" + encodeUrlPathSegment(award.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String AwardController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Award());
        return "awards/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String AwardController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("award", Award.findAward(id));
        uiModel.addAttribute("itemId", id);
        return "awards/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String AwardController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("awards", Award.findAwardEntries(firstResult, sizeNo));
            float nrOfPages = (float) Award.countAwards() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("awards", Award.findAllAwards());
        }
        addDateTimeFormatPatterns(uiModel);
        return "awards/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String AwardController.update(@Valid Award award, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, award);
            return "awards/update";
        }
        uiModel.asMap().clear();
        award.merge();
        return "redirect:/awards/" + encodeUrlPathSegment(award.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String AwardController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Award.findAward(id));
        return "awards/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String AwardController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Award award = Award.findAward(id);
        award.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/awards";
    }
    
    void AwardController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("award_awarddate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void AwardController.populateEditForm(Model uiModel, Award award) {
        uiModel.addAttribute("award", award);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("companys", Company.findAllCompanys());
        uiModel.addAttribute("rfps", RFP.findAllRFPS());
    }
    
    String AwardController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
