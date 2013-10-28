package com.tuc.capacity.entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findProjectGroupsByNameEquals" })
public class ProjectGroup {

    /**
     */
    @NotNull
    private String name;

    /**
     */
    @NotNull
    @ManyToOne
    private TuLead lead;
}
