package com.tuc.capacity.entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import com.tuc.capacity.entity.mstr.ProjectRole;
import com.tuc.capacity.entity.mstr.Rate;
import com.tuc.capacity.entity.mstr.Location;

import java.util.Date;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class ProjectAllocation {

    /**
     */
    @NotNull
    @ManyToOne
    private Associate associate;

    /**
     */
    @NotNull
    @ManyToOne
    private Project project;

    /**
     */
    @ManyToOne
    private ProjectRole prjRole;

    /**
     */
    @NotNull
    @ManyToOne
    private Rate rate;

    /**
     */
    @NotNull
    @ManyToOne
    private Location location;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date startDate;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date endDate;
}
