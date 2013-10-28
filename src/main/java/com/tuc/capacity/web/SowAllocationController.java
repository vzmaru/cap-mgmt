package com.tuc.capacity.web;
import com.tuc.capacity.entity.SowAllocation;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/sowallocations")
@Controller
@RooWebScaffold(path = "sowallocations", formBackingObject = SowAllocation.class)
public class SowAllocationController {
}
