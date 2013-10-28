package com.tuc.capacity.web;
import com.tuc.capacity.entity.ProjectAllocation;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/projectallocations")
@Controller
@RooWebScaffold(path = "projectallocations", formBackingObject = ProjectAllocation.class)
public class ProjectAllocationController {
}
