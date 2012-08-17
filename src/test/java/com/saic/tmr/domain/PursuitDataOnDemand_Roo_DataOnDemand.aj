// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.saic.tmr.domain;

import com.saic.tmr.domain.BusinessUnitDataOnDemand;
import com.saic.tmr.domain.CompanyDataOnDemand;
import com.saic.tmr.domain.NewBusinessDataOnDemand;
import com.saic.tmr.domain.OpCenterDataOnDemand;
import com.saic.tmr.domain.PersonDataOnDemand;
import com.saic.tmr.domain.Pursuit;
import com.saic.tmr.domain.PursuitDataOnDemand;
import com.saic.tmr.domain.PursuitRoleDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect PursuitDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PursuitDataOnDemand: @Component;
    
    private Random PursuitDataOnDemand.rnd = new SecureRandom();
    
    private List<Pursuit> PursuitDataOnDemand.data;
    
    @Autowired
    private BusinessUnitDataOnDemand PursuitDataOnDemand.businessUnitDataOnDemand;
    
    @Autowired
    private PersonDataOnDemand PursuitDataOnDemand.personDataOnDemand;
    
    @Autowired
    private NewBusinessDataOnDemand PursuitDataOnDemand.newBusinessDataOnDemand;
    
    @Autowired
    private OpCenterDataOnDemand PursuitDataOnDemand.opCenterDataOnDemand;
    
    @Autowired
    private CompanyDataOnDemand PursuitDataOnDemand.companyDataOnDemand;
    
    @Autowired
    private PursuitRoleDataOnDemand PursuitDataOnDemand.pursuitRoleDataOnDemand;
    
    public Pursuit PursuitDataOnDemand.getNewTransientPursuit(int index) {
        Pursuit obj = new Pursuit();
        setBuValue(obj, index);
        setCodeName(obj, index);
        setComments(obj, index);
        setOci(obj, index);
        setProcurementValue(obj, index);
        setTracCrmNumber(obj, index);
        return obj;
    }
    
    public void PursuitDataOnDemand.setBuValue(Pursuit obj, int index) {
        Float buValue = new Integer(index).floatValue();
        obj.setBuValue(buValue);
    }
    
    public void PursuitDataOnDemand.setCodeName(Pursuit obj, int index) {
        String codeName = "codeName_" + index;
        obj.setCodeName(codeName);
    }
    
    public void PursuitDataOnDemand.setComments(Pursuit obj, int index) {
        String comments = "comments_" + index;
        obj.setComments(comments);
    }
    
    public void PursuitDataOnDemand.setOci(Pursuit obj, int index) {
        Boolean oci = Boolean.TRUE;
        obj.setOci(oci);
    }
    
    public void PursuitDataOnDemand.setProcurementValue(Pursuit obj, int index) {
        Float procurementValue = new Integer(index).floatValue();
        obj.setProcurementValue(procurementValue);
    }
    
    public void PursuitDataOnDemand.setTracCrmNumber(Pursuit obj, int index) {
        String tracCrmNumber = "tracCrmNumber_" + index;
        obj.setTracCrmNumber(tracCrmNumber);
    }
    
    public Pursuit PursuitDataOnDemand.getSpecificPursuit(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Pursuit obj = data.get(index);
        Long id = obj.getId();
        return Pursuit.findPursuit(id);
    }
    
    public Pursuit PursuitDataOnDemand.getRandomPursuit() {
        init();
        Pursuit obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Pursuit.findPursuit(id);
    }
    
    public boolean PursuitDataOnDemand.modifyPursuit(Pursuit obj) {
        return false;
    }
    
    public void PursuitDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Pursuit.findPursuitEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Pursuit' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Pursuit>();
        for (int i = 0; i < 10; i++) {
            Pursuit obj = getNewTransientPursuit(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
