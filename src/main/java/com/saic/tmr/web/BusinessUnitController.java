package com.saic.tmr.web;

import com.saic.tmr.domain.BusinessUnit;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/businessunits")
@Controller
@RooWebScaffold(path = "businessunits", formBackingObject = BusinessUnit.class)
public class BusinessUnitController {
}
