package com.tuc.capacity.entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import com.tuc.capacity.entity.mstr.FinCtrlNum;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class SowAllocation {

    /**
     */
    @NotNull
    @ManyToOne
    private Associate associate;

    /**
     */
    @NotNull
    @ManyToOne
    private Sow sow;

    /**
     */
    @NotNull
    @ManyToOne
    private FinCtrlNum finCtrlNum;
}
