// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.saic.tmr.domain;

import com.saic.tmr.domain.ProcurementType;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect ProcurementType_Roo_Finder {
    
    public static TypedQuery<ProcurementType> ProcurementType.findProcurementTypesByCodeEquals(String code) {
        if (code == null || code.length() == 0) throw new IllegalArgumentException("The code argument is required");
        EntityManager em = ProcurementType.entityManager();
        TypedQuery<ProcurementType> q = em.createQuery("SELECT o FROM ProcurementType AS o WHERE o.code = :code", ProcurementType.class);
        q.setParameter("code", code);
        return q;
    }
    
}
