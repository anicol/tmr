// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.saic.tmr.domain;

import com.saic.tmr.domain.NewBusiness;
import com.saic.tmr.domain.NewBusinessDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect NewBusinessDataOnDemand_Roo_DataOnDemand {
    
    declare @type: NewBusinessDataOnDemand: @Component;
    
    private Random NewBusinessDataOnDemand.rnd = new SecureRandom();
    
    private List<NewBusiness> NewBusinessDataOnDemand.data;
    
    public NewBusiness NewBusinessDataOnDemand.getNewTransientNewBusiness(int index) {
        NewBusiness obj = new NewBusiness();
        setName(obj, index);
        return obj;
    }
    
    public void NewBusinessDataOnDemand.setName(NewBusiness obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public NewBusiness NewBusinessDataOnDemand.getSpecificNewBusiness(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        NewBusiness obj = data.get(index);
        Long id = obj.getId();
        return NewBusiness.findNewBusiness(id);
    }
    
    public NewBusiness NewBusinessDataOnDemand.getRandomNewBusiness() {
        init();
        NewBusiness obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return NewBusiness.findNewBusiness(id);
    }
    
    public boolean NewBusinessDataOnDemand.modifyNewBusiness(NewBusiness obj) {
        return false;
    }
    
    public void NewBusinessDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = NewBusiness.findNewBusinessEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'NewBusiness' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<NewBusiness>();
        for (int i = 0; i < 10; i++) {
            NewBusiness obj = getNewTransientNewBusiness(i);
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
