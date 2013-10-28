package com.tuc.capacity.web;
import com.tuc.capacity.entity.mstr.ProjectType;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/projecttypes")
@Controller
@RooWebScaffold(path = "projecttypes", formBackingObject = ProjectType.class)
public class ProjectTypeController {
}
