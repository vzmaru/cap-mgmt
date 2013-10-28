// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.tuc.capacity.entity.mstr;

import com.tuc.capacity.entity.mstr.Skill;
import com.tuc.capacity.entity.mstr.SkillDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect SkillDataOnDemand_Roo_DataOnDemand {
    
    declare @type: SkillDataOnDemand: @Component;
    
    private Random SkillDataOnDemand.rnd = new SecureRandom();
    
    private List<Skill> SkillDataOnDemand.data;
    
    public Skill SkillDataOnDemand.getNewTransientSkill(int index) {
        Skill obj = new Skill();
        setSkillName(obj, index);
        return obj;
    }
    
    public void SkillDataOnDemand.setSkillName(Skill obj, int index) {
        String skillName = "skillName_" + index;
        obj.setSkillName(skillName);
    }
    
    public Skill SkillDataOnDemand.getSpecificSkill(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Skill obj = data.get(index);
        Long id = obj.getId();
        return Skill.findSkill(id);
    }
    
    public Skill SkillDataOnDemand.getRandomSkill() {
        init();
        Skill obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Skill.findSkill(id);
    }
    
    public boolean SkillDataOnDemand.modifySkill(Skill obj) {
        return false;
    }
    
    public void SkillDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Skill.findSkillEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Skill' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Skill>();
        for (int i = 0; i < 10; i++) {
            Skill obj = getNewTransientSkill(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
