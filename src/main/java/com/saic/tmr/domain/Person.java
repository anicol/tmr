package com.saic.tmr.domain;

import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findPeopleByLastNameLikeAndFirstNameLike", "findPeopleByLastNameEqualsAndFirstNameEquals", "findPeopleByLastNameLike" })
public class Person {

    private String firstName;

    private String lastName;

    private String email;

    private String phone;
}
