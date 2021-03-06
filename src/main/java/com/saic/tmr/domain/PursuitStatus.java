package com.saic.tmr.domain;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findPursuitStatusesByNameEquals", "findPursuitStatusesByCodeEquals" })
public class PursuitStatus {

    @NotNull
    @Size(min = 1)
    private String code;

    @NotNull
    @Size(min = 2)
    private String name;
}
