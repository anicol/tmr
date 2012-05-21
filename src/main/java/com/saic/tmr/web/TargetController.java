package com.saic.tmr.web;

import com.saic.tmr.domain.Target;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/targets")
@Controller
@RooWebScaffold(path = "targets", formBackingObject = Target.class)
public class TargetController {
}
