package com.tuc.capacity.web;
import com.tuc.capacity.entity.mstr.Skill;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/skills")
@Controller
@RooWebScaffold(path = "skills", formBackingObject = Skill.class)
public class SkillController {
}
