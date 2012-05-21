package com.saic.tmr.web;

import com.saic.tmr.domain.OpCenter;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/opcenters")
@Controller
@RooWebScaffold(path = "opcenters", formBackingObject = OpCenter.class)
public class OpCenterController {
}
