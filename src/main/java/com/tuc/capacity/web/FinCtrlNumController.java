package com.tuc.capacity.web;
import com.tuc.capacity.entity.mstr.FinCtrlNum;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/finctrlnums")
@Controller
@RooWebScaffold(path = "finctrlnums", formBackingObject = FinCtrlNum.class)
public class FinCtrlNumController {
}
