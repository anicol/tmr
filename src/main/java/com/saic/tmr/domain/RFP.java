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
@RooJpaActiveRecord
public class RFP {

    private int targetNumber;

    @ManyToOne
    private PursuitStatus pursuitStatus;

    @ManyToOne
    private Command command;

    @NotNull
    @Size(min = 2)
    private String contractEffort;

    private String rfpNumber;

    @ManyToOne
    private ProcurementType procurementType;

    @ManyToOne
    private ContractType contractType;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date advanceNoticeEndDate;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date rfpIssueDate;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Company> incumbents = new HashSet<Company>();

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date submittalDate;

    private String comments;

    @OneToMany(cascade = CascadeType.ALL)
    private Set<Award> awards = new HashSet<Award>();
}