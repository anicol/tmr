// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.saic.tmr.domain;

import com.saic.tmr.domain.ProcurementType;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ProcurementType_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ProcurementType.entityManager;
    
    public static final EntityManager ProcurementType.entityManager() {
        EntityManager em = new ProcurementType().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ProcurementType.countProcurementTypes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ProcurementType o", Long.class).getSingleResult();
    }
    
    public static List<ProcurementType> ProcurementType.findAllProcurementTypes() {
        return entityManager().createQuery("SELECT o FROM ProcurementType o order by name", ProcurementType.class).getResultList();
    }
    
    public static ProcurementType ProcurementType.findProcurementType(Long id) {
        if (id == null) return null;
        return entityManager().find(ProcurementType.class, id);
    }
    
    public static List<ProcurementType> ProcurementType.findProcurementTypeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ProcurementType o", ProcurementType.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ProcurementType.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ProcurementType.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ProcurementType attached = ProcurementType.findProcurementType(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ProcurementType.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ProcurementType.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ProcurementType ProcurementType.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ProcurementType merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
