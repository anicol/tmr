// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.saic.tmr.domain;

import com.saic.tmr.domain.OpCenter;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect OpCenter_Roo_Finder {
    
    public static TypedQuery<OpCenter> OpCenter.findOpCentersByNameEquals(String name) {
        if (name == null || name.length() == 0) throw new IllegalArgumentException("The name argument is required");
        EntityManager em = OpCenter.entityManager();
        TypedQuery<OpCenter> q = em.createQuery("SELECT o FROM OpCenter AS o WHERE o.name = :name", OpCenter.class);
        q.setParameter("name", name);
        return q;
    }
    
}
