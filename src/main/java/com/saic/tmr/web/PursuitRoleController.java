package com.saic.tmr.web;

import com.saic.tmr.domain.PursuitRole;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/pursuitroles")
@Controller
@RooWebScaffold(path = "pursuitroles", formBackingObject = PursuitRole.class)
public class PursuitRoleController {
}
