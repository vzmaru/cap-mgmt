package com.tuc.capacity.web;
import com.tuc.capacity.entity.ProjectGroup;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/projectgroups")
@Controller
@RooWebScaffold(path = "projectgroups", formBackingObject = ProjectGroup.class)
public class ProjectGroupController {
}
