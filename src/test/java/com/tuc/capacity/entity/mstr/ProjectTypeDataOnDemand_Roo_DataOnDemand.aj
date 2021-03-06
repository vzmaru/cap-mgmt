// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.tuc.capacity.entity.mstr;

import com.tuc.capacity.entity.mstr.ProjectType;
import com.tuc.capacity.entity.mstr.ProjectTypeDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect ProjectTypeDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ProjectTypeDataOnDemand: @Component;
    
    private Random ProjectTypeDataOnDemand.rnd = new SecureRandom();
    
    private List<ProjectType> ProjectTypeDataOnDemand.data;
    
    public ProjectType ProjectTypeDataOnDemand.getNewTransientProjectType(int index) {
        ProjectType obj = new ProjectType();
        setType(obj, index);
        return obj;
    }
    
    public void ProjectTypeDataOnDemand.setType(ProjectType obj, int index) {
        String type = "type_" + index;
        obj.setType(type);
    }
    
    public ProjectType ProjectTypeDataOnDemand.getSpecificProjectType(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        ProjectType obj = data.get(index);
        Long id = obj.getId();
        return ProjectType.findProjectType(id);
    }
    
    public ProjectType ProjectTypeDataOnDemand.getRandomProjectType() {
        init();
        ProjectType obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return ProjectType.findProjectType(id);
    }
    
    public boolean ProjectTypeDataOnDemand.modifyProjectType(ProjectType obj) {
        return false;
    }
    
    public void ProjectTypeDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = ProjectType.findProjectTypeEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'ProjectType' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ProjectType>();
        for (int i = 0; i < 10; i++) {
            ProjectType obj = getNewTransientProjectType(i);
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
