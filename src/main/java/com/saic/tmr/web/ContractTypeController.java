package com.saic.tmr.web;

import com.saic.tmr.domain.ContractType;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/contracttypes")
@Controller
@RooWebScaffold(path = "contracttypes", formBackingObject = ContractType.class)
public class ContractTypeController {
}
