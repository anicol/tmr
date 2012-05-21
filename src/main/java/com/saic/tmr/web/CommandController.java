package com.saic.tmr.web;

import com.saic.tmr.domain.Command;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/commands")
@Controller
@RooWebScaffold(path = "commands", formBackingObject = Command.class)
public class CommandController {
}
