// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.tuc.capacity.entity.mstr;

import com.tuc.capacity.entity.mstr.ProjectRole;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect ProjectRole_Roo_Jpa_Entity {
    
    declare @type: ProjectRole: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long ProjectRole.id;
    
    @Version
    @Column(name = "version")
    private Integer ProjectRole.version;
    
    public Long ProjectRole.getId() {
        return this.id;
    }
    
    public void ProjectRole.setId(Long id) {
        this.id = id;
    }
    
    public Integer ProjectRole.getVersion() {
        return this.version;
    }
    
    public void ProjectRole.setVersion(Integer version) {
        this.version = version;
    }
    
}