// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.saic.tmr.domain;

import com.saic.tmr.domain.BusinessUnit;
import com.saic.tmr.domain.BusinessUnitDataOnDemand;
import com.saic.tmr.domain.OpCenter;
import com.saic.tmr.domain.OpCenterDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect OpCenterDataOnDemand_Roo_DataOnDemand {
    
    declare @type: OpCenterDataOnDemand: @Component;
    
    private Random OpCenterDataOnDemand.rnd = new SecureRandom();
    
    private List<OpCenter> OpCenterDataOnDemand.data;
    
    @Autowired
    private BusinessUnitDataOnDemand OpCenterDataOnDemand.businessUnitDataOnDemand;
    
    public OpCenter OpCenterDataOnDemand.getNewTransientOpCenter(int index) {
        OpCenter obj = new OpCenter();
        setBusinessUnit(obj, index);
        setCode(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void OpCenterDataOnDemand.setBusinessUnit(OpCenter obj, int index) {
        BusinessUnit businessUnit = businessUnitDataOnDemand.getRandomBusinessUnit();
        obj.setBusinessUnit(businessUnit);
    }
    
    public void OpCenterDataOnDemand.setCode(OpCenter obj, int index) {
        String code = "code_" + index;
        obj.setCode(code);
    }
    
    public void OpCenterDataOnDemand.setName(OpCenter obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public OpCenter OpCenterDataOnDemand.getSpecificOpCenter(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        OpCenter obj = data.get(index);
        Long id = obj.getId();
        return OpCenter.findOpCenter(id);
    }
    
    public OpCenter OpCenterDataOnDemand.getRandomOpCenter() {
        init();
        OpCenter obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return OpCenter.findOpCenter(id);
    }
    
    public boolean OpCenterDataOnDemand.modifyOpCenter(OpCenter obj) {
        return false;
    }
    
    public void OpCenterDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = OpCenter.findOpCenterEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'OpCenter' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<OpCenter>();
        for (int i = 0; i < 10; i++) {
            OpCenter obj = getNewTransientOpCenter(i);
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
