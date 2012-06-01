// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.saic.tmr.domain;

import com.saic.tmr.domain.Target;
import java.util.Date;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Target_Roo_Finder {
    
    public static TypedQuery<Target> Target.findTargetsByRfpDate(Date rfpDate) {
        if (rfpDate == null) throw new IllegalArgumentException("The rfpDate argument is required");
        EntityManager em = Target.entityManager();
        TypedQuery<Target> q = em.createQuery("SELECT o FROM Target AS o WHERE o.rfpDate = :rfpDate", Target.class);
        q.setParameter("rfpDate", rfpDate);
        return q;
    }
    
    public static TypedQuery<Target> Target.findTargetsByRfpDateBetween(Date minRfpDate, Date maxRfpDate) {
        if (minRfpDate == null) throw new IllegalArgumentException("The minRfpDate argument is required");
        if (maxRfpDate == null) throw new IllegalArgumentException("The maxRfpDate argument is required");
        EntityManager em = Target.entityManager();
        TypedQuery<Target> q = em.createQuery("SELECT o FROM Target AS o WHERE o.rfpDate BETWEEN :minRfpDate AND :maxRfpDate", Target.class);
        q.setParameter("minRfpDate", minRfpDate);
        q.setParameter("maxRfpDate", maxRfpDate);
        return q;
    }
    
}
