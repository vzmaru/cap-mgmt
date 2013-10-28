// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.tuc.capacity.entity;

import com.tuc.capacity.entity.TuLead;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TuLead_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager TuLead.entityManager;
    
    public static final EntityManager TuLead.entityManager() {
        EntityManager em = new TuLead().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long TuLead.countTuLeads() {
        return entityManager().createQuery("SELECT COUNT(o) FROM TuLead o", Long.class).getSingleResult();
    }
    
    public static List<TuLead> TuLead.findAllTuLeads() {
        return entityManager().createQuery("SELECT o FROM TuLead o", TuLead.class).getResultList();
    }
    
    public static TuLead TuLead.findTuLead(Long id) {
        if (id == null) return null;
        return entityManager().find(TuLead.class, id);
    }
    
    public static List<TuLead> TuLead.findTuLeadEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM TuLead o", TuLead.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void TuLead.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void TuLead.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            TuLead attached = TuLead.findTuLead(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void TuLead.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void TuLead.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public TuLead TuLead.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        TuLead merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
