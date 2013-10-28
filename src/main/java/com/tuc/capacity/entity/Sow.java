package com.tuc.capacity.entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findSowsBySowNumEquals" })
public class Sow {

    /**
     */
    @NotNull
    private String sowNum;

    /**
     */
    @NotNull
    private String description;
}
