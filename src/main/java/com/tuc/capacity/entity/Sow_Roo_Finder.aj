// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.tuc.capacity.entity;

import com.tuc.capacity.entity.Sow;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Sow_Roo_Finder {
    
    public static TypedQuery<Sow> Sow.findSowsBySowNumEquals(String sowNum) {
        if (sowNum == null || sowNum.length() == 0) throw new IllegalArgumentException("The sowNum argument is required");
        EntityManager em = Sow.entityManager();
        TypedQuery<Sow> q = em.createQuery("SELECT o FROM Sow AS o WHERE o.sowNum = :sowNum", Sow.class);
        q.setParameter("sowNum", sowNum);
        return q;
    }
    
}
