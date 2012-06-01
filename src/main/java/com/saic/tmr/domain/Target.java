package com.saic.tmr.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
@RooJpaActiveRecord(finders = { "findTargetsByRfpDate", "findTargetsByRfpDateBetween" })
public class Target {

    private int targetNumber;

    @ManyToOne
    private PursuitStatus pursuitStatus;

    private String tracCrmNumber;

    @ManyToOne
    private OpCenter opCenter;

    @ManyToOne
    private Command command;

    @NotNull
    @Size(min = 2)
    private String contractEffort;

    private String rfpNumber;

    private String codeName;

    @ManyToOne
    private Person captureManager;

    @ManyToOne
    private PursuitRole pursuitRole;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Company> primeCompany = new HashSet<Company>();

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
