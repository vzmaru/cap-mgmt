package com.tuc.capacity.entity.mstr;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import com.tuc.capacity.entity.Sow;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class FinCtrlNum {

    /**
     */
    @NotNull
    @ManyToOne
    private Sow sow;

    /**
     */
    @NotNull
    private String finCtrlNum;
}
