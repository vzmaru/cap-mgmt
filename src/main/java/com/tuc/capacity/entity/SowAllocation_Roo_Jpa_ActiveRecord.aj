// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.tuc.capacity.entity;

import com.tuc.capacity.entity.SowAllocation;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect SowAllocation_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager SowAllocation.entityManager;
    
    public static final EntityManager SowAllocation.entityManager() {
        EntityManager em = new SowAllocation().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long SowAllocation.countSowAllocations() {
        return entityManager().createQuery("SELECT COUNT(o) FROM SowAllocation o", Long.class).getSingleResult();
    }
    
    public static List<SowAllocation> SowAllocation.findAllSowAllocations() {
        return entityManager().createQuery("SELECT o FROM SowAllocation o", SowAllocation.class).getResultList();
    }
    
    public static SowAllocation SowAllocation.findSowAllocation(Long id) {
        if (id == null) return null;
        return entityManager().find(SowAllocation.class, id);
    }
    
    public static List<SowAllocation> SowAllocation.findSowAllocationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM SowAllocation o", SowAllocation.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void SowAllocation.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void SowAllocation.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            SowAllocation attached = SowAllocation.findSowAllocation(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void SowAllocation.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void SowAllocation.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public SowAllocation SowAllocation.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        SowAllocation merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
