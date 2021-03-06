package com.tuc.capacity.entity.mstr;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findSkillsBySkillNameEquals" })
public class Skill {

    /**
     */
    @NotNull
    private String skillName;
}
