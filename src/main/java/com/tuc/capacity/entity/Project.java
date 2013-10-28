package com.tuc.capacity.entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.persistence.ManyToOne;
import com.tuc.capacity.entity.mstr.ProjectType;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findProjectsByNameEquals" })
public class Project {

    /**
     */
    @NotNull
    private String name;

    /**
     */
    @NotNull
    @ManyToOne
    private ProjectGroup prjGroup;

    /**
     */
    @NotNull
    @ManyToOne
    private TuLead lead;

    /**
     */
    @ManyToOne
    private TuLead subLead;

    /**
     */
    @ManyToOne
    private TuLead manager;

    /**
     */
    @NotNull
    @ManyToOne
    private ProjectType type;
}
