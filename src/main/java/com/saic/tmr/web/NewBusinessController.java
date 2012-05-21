package com.saic.tmr.web;

import com.saic.tmr.domain.NewBusiness;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/newbusinesses")
@Controller
@RooWebScaffold(path = "newbusinesses", formBackingObject = NewBusiness.class)
public class NewBusinessController {
}
