package com.tuc.capacity.web;
import com.tuc.capacity.entity.mstr.Rate;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/rates")
@Controller
@RooWebScaffold(path = "rates", formBackingObject = Rate.class)
public class RateController {
}
