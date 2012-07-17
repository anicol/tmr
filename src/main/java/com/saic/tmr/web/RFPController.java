package com.saic.tmr.web;

import com.saic.tmr.domain.RFP;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/rfps")
@Controller
@RooWebScaffold(path = "rfps", formBackingObject = RFP.class)
public class RFPController {
}
