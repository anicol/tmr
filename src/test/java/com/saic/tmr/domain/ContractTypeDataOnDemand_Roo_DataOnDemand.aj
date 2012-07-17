// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.saic.tmr.domain;

import com.saic.tmr.domain.ContractType;
import com.saic.tmr.domain.ContractTypeDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect ContractTypeDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ContractTypeDataOnDemand: @Component;
    
    private Random ContractTypeDataOnDemand.rnd = new SecureRandom();
    
    private List<ContractType> ContractTypeDataOnDemand.data;
    
    public ContractType ContractTypeDataOnDemand.getNewTransientContractType(int index) {
        ContractType obj = new ContractType();
        setName(obj, index);
        return obj;
    }
    
    public void ContractTypeDataOnDemand.setName(ContractType obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public ContractType ContractTypeDataOnDemand.getSpecificContractType(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        ContractType obj = data.get(index);
        Long id = obj.getId();
        return ContractType.findContractType(id);
    }
    
    public ContractType ContractTypeDataOnDemand.getRandomContractType() {
        init();
        ContractType obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return ContractType.findContractType(id);
    }
    
    public boolean ContractTypeDataOnDemand.modifyContractType(ContractType obj) {
        return false;
    }
    
    public void ContractTypeDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = ContractType.findContractTypeEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'ContractType' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ContractType>();
        for (int i = 0; i < 10; i++) {
            ContractType obj = getNewTransientContractType(i);
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
