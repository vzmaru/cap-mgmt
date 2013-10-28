package com.tuc.capacity.web;
import com.tuc.capacity.entity.mstr.ProjectRole;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/projectroles")
@Controller
@RooWebScaffold(path = "projectroles", formBackingObject = ProjectRole.class)
public class ProjectRoleController {
}
