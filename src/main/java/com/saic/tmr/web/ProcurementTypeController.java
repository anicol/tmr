package com.saic.tmr.web;

import com.saic.tmr.domain.ProcurementType;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/procurementtypes")
@Controller
@RooWebScaffold(path = "procurementtypes", formBackingObject = ProcurementType.class)
public class ProcurementTypeController {
}
