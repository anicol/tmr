package com.saic.tmr.web;

import com.saic.tmr.domain.Pursuit;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/pursuits")
@Controller
@RooWebScaffold(path = "pursuits", formBackingObject = Pursuit.class)
public class PursuitController {
}
