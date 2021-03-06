// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.tuc.capacity.entity;

import com.tuc.capacity.entity.Associate;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Associate_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Associate.entityManager;
    
    public static final EntityManager Associate.entityManager() {
        EntityManager em = new Associate().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Associate.countAssociates() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Associate o", Long.class).getSingleResult();
    }
    
    public static List<Associate> Associate.findAllAssociates() {
        return entityManager().createQuery("SELECT o FROM Associate o", Associate.class).getResultList();
    }
    
    public static Associate Associate.findAssociate(Long id) {
        if (id == null) return null;
        return entityManager().find(Associate.class, id);
    }
    
    public static List<Associate> Associate.findAssociateEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Associate o", Associate.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Associate.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Associate.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Associate attached = Associate.findAssociate(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Associate.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Associate.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Associate Associate.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Associate merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
