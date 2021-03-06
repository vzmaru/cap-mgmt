// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.tuc.capacity.entity;

import com.tuc.capacity.entity.Project;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Project_Roo_Finder {
    
    public static TypedQuery<Project> Project.findProjectsByNameEquals(String name) {
        if (name == null || name.length() == 0) throw new IllegalArgumentException("The name argument is required");
        EntityManager em = Project.entityManager();
        TypedQuery<Project> q = em.createQuery("SELECT o FROM Project AS o WHERE o.name = :name", Project.class);
        q.setParameter("name", name);
        return q;
    }
    
}
