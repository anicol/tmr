// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.saic.tmr.domain;

import com.saic.tmr.domain.NewBusiness;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect NewBusiness_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager NewBusiness.entityManager;
    
    public static final EntityManager NewBusiness.entityManager() {
        EntityManager em = new NewBusiness().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long NewBusiness.countNewBusinesses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM NewBusiness o", Long.class).getSingleResult();
    }
    
    public static List<NewBusiness> NewBusiness.findAllNewBusinesses() {
        return entityManager().createQuery("SELECT o FROM NewBusiness o", NewBusiness.class).getResultList();
    }
    
    public static NewBusiness NewBusiness.findNewBusiness(Long id) {
        if (id == null) return null;
        return entityManager().find(NewBusiness.class, id);
    }
    
    public static List<NewBusiness> NewBusiness.findNewBusinessEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM NewBusiness o", NewBusiness.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void NewBusiness.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void NewBusiness.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            NewBusiness attached = NewBusiness.findNewBusiness(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void NewBusiness.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void NewBusiness.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public NewBusiness NewBusiness.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        NewBusiness merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
