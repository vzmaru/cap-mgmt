package com.tuc.capacity.web;
import com.tuc.capacity.entity.Sow;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/sows")
@Controller
@RooWebScaffold(path = "sows", formBackingObject = Sow.class)
public class SowController {
}
