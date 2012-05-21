package com.saic.tmr.domain;

import java.util.Date;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Target {

    private int targetNumber;

    @ManyToOne
    private PursuitStatus pursuitStatus;

    private int tracCrmNumber;

    @ManyToOne
    private OpCenter opCenter;

    @ManyToOne
    private Command command;

    @NotNull
    @Size(min = 2)
    private String contractEffort;

    @NotNull
    private String rfpNumber;

    private String codeName;

    @ManyToOne
    private Person captureManager;

    @ManyToOne
    private PursuitRole pursuitRole;

    @ManyToOne
    private Company primeCompany;

    private Float procurementValue;

    private Float buValue;

    @ManyToOne
    private ProcurementType procurementType;

    @ManyToOne
    private NewBusiness newBusiness;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date rfpDate;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date submittalDate;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date awardDate;

    @ManyToOne
    private Company incumbant;

    private String comments;

    @ManyToOne
    private Company winningCompany;

    private Float winningBid;
}
