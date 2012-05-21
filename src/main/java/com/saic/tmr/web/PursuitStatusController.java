package com.saic.tmr.web;

import com.saic.tmr.domain.PursuitStatus;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/pursuitstatuses")
@Controller
@RooWebScaffold(path = "pursuitstatuses", formBackingObject = PursuitStatus.class)
public class PursuitStatusController {
}
