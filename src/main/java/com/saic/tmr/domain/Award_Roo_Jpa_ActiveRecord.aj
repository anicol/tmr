// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.saic.tmr.domain;

import com.saic.tmr.domain.Award;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Award_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Award.entityManager;
    
    public static final EntityManager Award.entityManager() {
        EntityManager em = new Award().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Award.countAwards() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Award o", Long.class).getSingleResult();
    }
    
    public static List<Award> Award.findAllAwards() {
        return entityManager().createQuery("SELECT o FROM Award o", Award.class).getResultList();
    }
    
    public static Award Award.findAward(Long id) {
        if (id == null) return null;
        return entityManager().find(Award.class, id);
    }
    
    public static List<Award> Award.findAwardEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Award o", Award.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Award.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Award.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Award attached = Award.findAward(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Award.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Award.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Award Award.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Award merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
