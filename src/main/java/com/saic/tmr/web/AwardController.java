package com.saic.tmr.web;

import com.saic.tmr.domain.Award;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/awards")
@Controller
@RooWebScaffold(path = "awards", formBackingObject = Award.class)
public class AwardController {
}
