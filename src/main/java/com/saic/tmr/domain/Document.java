package com.saic.tmr.domain;

import javax.persistence.Basic;
import javax.persistence.FetchType;
import javax.persistence.Lob;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Document {
	
	private static final Log log = LogFactory.getLog(Document.class);

    @NotNull
    @Size(max = 30)
    private String name;

    @NotNull
    @Size(max = 500)
    private String description;

    private String filename;

    @NotNull
    @Lob
    @Basic(fetch = FetchType.LAZY)
    private byte[] content;
    
    private String contentType;

    private java.lang.Long filesize;
    
    @Transient
    @Size(max = 100)
    private String url ;
}
