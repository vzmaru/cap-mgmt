package com.tuc.capacity.entity;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import com.tuc.capacity.entity.mstr.Skill;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findAssociatesByEidEquals", "findAssociatesByEmpIdLike", "findAssociatesByEmpIdEquals" })
public class Associate {

    /**
     */
    private String eid;

    /**
     */
    @NotNull
    private String empId;

    /**
     */
    @NotNull
    private String name;

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Skill> skills = new HashSet<Skill>();

    /**
     */
    private String status;
}
