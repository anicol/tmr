package com.saic.tmr.domain;

import javax.persistence.ManyToOne;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Pursuit {

    private String tracCrmNumber;

    @ManyToOne
    private BusinessUnit businessUnit;

    @ManyToOne
    private OpCenter opCenter;

    private String codeName;

    @ManyToOne
    private Person captureManager;

    @ManyToOne
    private Person contractsRep;

    @ManyToOne
    private Person subcontractsAdmin;

    @ManyToOne
    private PursuitRole pursuitRole;

    @ManyToOne
    private Company primeCompany;

    private Float procurementValue;

    private Float buValue;

    @ManyToOne
    private NewBusiness newBusiness;

    private Boolean oci;

    private String comments;

    @ManyToOne
    private RFP rfp;
}
