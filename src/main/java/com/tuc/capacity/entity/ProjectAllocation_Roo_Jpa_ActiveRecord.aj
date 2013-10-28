// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.tuc.capacity.entity;

import com.tuc.capacity.entity.ProjectAllocation;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ProjectAllocation_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ProjectAllocation.entityManager;
    
    public static final EntityManager ProjectAllocation.entityManager() {
        EntityManager em = new ProjectAllocation().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ProjectAllocation.countProjectAllocations() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ProjectAllocation o", Long.class).getSingleResult();
    }
    
    public static List<ProjectAllocation> ProjectAllocation.findAllProjectAllocations() {
        return entityManager().createQuery("SELECT o FROM ProjectAllocation o", ProjectAllocation.class).getResultList();
    }
    
    public static ProjectAllocation ProjectAllocation.findProjectAllocation(Long id) {
        if (id == null) return null;
        return entityManager().find(ProjectAllocation.class, id);
    }
    
    public static List<ProjectAllocation> ProjectAllocation.findProjectAllocationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ProjectAllocation o", ProjectAllocation.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ProjectAllocation.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ProjectAllocation.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ProjectAllocation attached = ProjectAllocation.findProjectAllocation(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ProjectAllocation.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ProjectAllocation.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ProjectAllocation ProjectAllocation.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ProjectAllocation merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
