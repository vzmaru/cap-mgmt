package com.tuc.capacity.web;
import com.tuc.capacity.entity.Associate;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/associates")
@Controller
@RooWebScaffold(path = "associates", formBackingObject = Associate.class)
@RooWebFinder
public class AssociateController {
}
