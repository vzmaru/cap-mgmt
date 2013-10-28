package com.tuc.capacity.web;
import com.tuc.capacity.entity.TuLead;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/tuleads")
@Controller
@RooWebScaffold(path = "tuleads", formBackingObject = TuLead.class)
public class TuLeadController {
}
