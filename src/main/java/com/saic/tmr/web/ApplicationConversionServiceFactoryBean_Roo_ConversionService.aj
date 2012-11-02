// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.saic.tmr.web;

import com.saic.tmr.domain.Award;
import com.saic.tmr.domain.BusinessUnit;
import com.saic.tmr.domain.Command;
import com.saic.tmr.domain.Company;
import com.saic.tmr.domain.ContractType;
import com.saic.tmr.domain.NewBusiness;
import com.saic.tmr.domain.OpCenter;
import com.saic.tmr.domain.Person;
import com.saic.tmr.domain.ProcurementType;
import com.saic.tmr.domain.Pursuit;
import com.saic.tmr.domain.PursuitRole;
import com.saic.tmr.domain.PursuitStatus;
import com.saic.tmr.domain.RFP;
import com.saic.tmr.web.ApplicationConversionServiceFactoryBean;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<Award, String> ApplicationConversionServiceFactoryBean.getAwardToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.saic.tmr.domain.Award, java.lang.String>() {
            public String convert(Award award) {
                return new StringBuilder().append(award.getAwardDate()).append(' ').append(award.getWinningBid()).toString();
            }
        };
    }
    
    public Converter<Long, Award> ApplicationConversionServiceFactoryBean.getIdToAwardConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.saic.tmr.domain.Award>() {
            public com.saic.tmr.domain.Award convert(java.lang.Long id) {
                return Award.findAward(id);
            }
        };
    }
    
    public Converter<String, Award> ApplicationConversionServiceFactoryBean.getStringToAwardConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.saic.tmr.domain.Award>() {
            public com.saic.tmr.domain.Award convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Award.class);
            }
        };
    }
    
    public Converter<BusinessUnit, String> ApplicationConversionServiceFactoryBean.getBusinessUnitToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.saic.tmr.domain.BusinessUnit, java.lang.String>() {
            public String convert(BusinessUnit businessUnit) {
                return new StringBuilder().append(businessUnit.getName()).toString();
            }
        };
    }
    
    public Converter<Long, BusinessUnit> ApplicationConversionServiceFactoryBean.getIdToBusinessUnitConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.saic.tmr.domain.BusinessUnit>() {
            public com.saic.tmr.domain.BusinessUnit convert(java.lang.Long id) {
                return BusinessUnit.findBusinessUnit(id);
            }
        };
    }
    
    public Converter<String, BusinessUnit> ApplicationConversionServiceFactoryBean.getStringToBusinessUnitConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.saic.tmr.domain.BusinessUnit>() {
            public com.saic.tmr.domain.BusinessUnit convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), BusinessUnit.class);
            }
        };
    }
    
    public Converter<Command, String> ApplicationConversionServiceFactoryBean.getCommandToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.saic.tmr.domain.Command, java.lang.String>() {
            public String convert(Command command) {
                return new StringBuilder().append(command.getName()).toString();
            }
        };
    }
    
    public Converter<Long, Command> ApplicationConversionServiceFactoryBean.getIdToCommandConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.saic.tmr.domain.Command>() {
            public com.saic.tmr.domain.Command convert(java.lang.Long id) {
                return Command.findCommand(id);
            }
        };
    }
    
    public Converter<String, Command> ApplicationConversionServiceFactoryBean.getStringToCommandConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.saic.tmr.domain.Command>() {
            public com.saic.tmr.domain.Command convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Command.class);
            }
        };
    }
    
    public Converter<Company, String> ApplicationConversionServiceFactoryBean.getCompanyToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.saic.tmr.domain.Company, java.lang.String>() {
            public String convert(Company company) {
                return new StringBuilder().append(company.getName()).toString();
            }
        };
    }
    
    public Converter<Long, Company> ApplicationConversionServiceFactoryBean.getIdToCompanyConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.saic.tmr.domain.Company>() {
            public com.saic.tmr.domain.Company convert(java.lang.Long id) {
                return Company.findCompany(id);
            }
        };
    }
    
    public Converter<String, Company> ApplicationConversionServiceFactoryBean.getStringToCompanyConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.saic.tmr.domain.Company>() {
            public com.saic.tmr.domain.Company convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Company.class);
            }
        };
    }
    
    public Converter<ContractType, String> ApplicationConversionServiceFactoryBean.getContractTypeToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.saic.tmr.domain.ContractType, java.lang.String>() {
            public String convert(ContractType contractType) {
                return new StringBuilder().append(contractType.getCode()).append(' ').append(contractType.getName()).toString();
            }
        };
    }
    
    public Converter<Long, ContractType> ApplicationConversionServiceFactoryBean.getIdToContractTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.saic.tmr.domain.ContractType>() {
            public com.saic.tmr.domain.ContractType convert(java.lang.Long id) {
                return ContractType.findContractType(id);
            }
        };
    }
    
    public Converter<String, ContractType> ApplicationConversionServiceFactoryBean.getStringToContractTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.saic.tmr.domain.ContractType>() {
            public com.saic.tmr.domain.ContractType convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ContractType.class);
            }
        };
    }
    
    public Converter<NewBusiness, String> ApplicationConversionServiceFactoryBean.getNewBusinessToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.saic.tmr.domain.NewBusiness, java.lang.String>() {
            public String convert(NewBusiness newBusiness) {
                return new StringBuilder().append(newBusiness.getName()).toString();
            }
        };
    }
    
    public Converter<Long, NewBusiness> ApplicationConversionServiceFactoryBean.getIdToNewBusinessConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.saic.tmr.domain.NewBusiness>() {
            public com.saic.tmr.domain.NewBusiness convert(java.lang.Long id) {
                return NewBusiness.findNewBusiness(id);
            }
        };
    }
    
    public Converter<String, NewBusiness> ApplicationConversionServiceFactoryBean.getStringToNewBusinessConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.saic.tmr.domain.NewBusiness>() {
            public com.saic.tmr.domain.NewBusiness convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), NewBusiness.class);
            }
        };
    }
    
    public Converter<OpCenter, String> ApplicationConversionServiceFactoryBean.getOpCenterToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.saic.tmr.domain.OpCenter, java.lang.String>() {
            public String convert(OpCenter opCenter) {
                return new StringBuilder().append(opCenter.getName()).toString();
            }
        };
    }
    
    public Converter<Long, OpCenter> ApplicationConversionServiceFactoryBean.getIdToOpCenterConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.saic.tmr.domain.OpCenter>() {
            public com.saic.tmr.domain.OpCenter convert(java.lang.Long id) {
                return OpCenter.findOpCenter(id);
            }
        };
    }
    
    public Converter<String, OpCenter> ApplicationConversionServiceFactoryBean.getStringToOpCenterConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.saic.tmr.domain.OpCenter>() {
            public com.saic.tmr.domain.OpCenter convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), OpCenter.class);
            }
        };
    }
    
    public Converter<Person, String> ApplicationConversionServiceFactoryBean.getPersonToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.saic.tmr.domain.Person, java.lang.String>() {
            public String convert(Person person) {
                return new StringBuilder().append(person.getLastName()).append(' ').append(person.getFirstName()).toString();
            }
        };
    }
    
    public Converter<Long, Person> ApplicationConversionServiceFactoryBean.getIdToPersonConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.saic.tmr.domain.Person>() {
            public com.saic.tmr.domain.Person convert(java.lang.Long id) {
                return Person.findPerson(id);
            }
        };
    }
    
    public Converter<String, Person> ApplicationConversionServiceFactoryBean.getStringToPersonConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.saic.tmr.domain.Person>() {
            public com.saic.tmr.domain.Person convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Person.class);
            }
        };
    }
    
    public Converter<ProcurementType, String> ApplicationConversionServiceFactoryBean.getProcurementTypeToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.saic.tmr.domain.ProcurementType, java.lang.String>() {
            public String convert(ProcurementType procurementType) {
                return new StringBuilder().append(procurementType.getName()).toString();
            }
        };
    }
    
    public Converter<Long, ProcurementType> ApplicationConversionServiceFactoryBean.getIdToProcurementTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.saic.tmr.domain.ProcurementType>() {
            public com.saic.tmr.domain.ProcurementType convert(java.lang.Long id) {
                return ProcurementType.findProcurementType(id);
            }
        };
    }
    
    public Converter<String, ProcurementType> ApplicationConversionServiceFactoryBean.getStringToProcurementTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.saic.tmr.domain.ProcurementType>() {
            public com.saic.tmr.domain.ProcurementType convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ProcurementType.class);
            }
        };
    }
    
    public Converter<Pursuit, String> ApplicationConversionServiceFactoryBean.getPursuitToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.saic.tmr.domain.Pursuit, java.lang.String>() {
            public String convert(Pursuit pursuit) {
                return new StringBuilder().append(pursuit.getTracCrmNumber()).append(' ').append(pursuit.getCodeName()).append(' ').append(pursuit.getProcurementValue()).append(' ').append(pursuit.getBuValue()).toString();
            }
        };
    }
    
    public Converter<Long, Pursuit> ApplicationConversionServiceFactoryBean.getIdToPursuitConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.saic.tmr.domain.Pursuit>() {
            public com.saic.tmr.domain.Pursuit convert(java.lang.Long id) {
                return Pursuit.findPursuit(id);
            }
        };
    }
    
    public Converter<String, Pursuit> ApplicationConversionServiceFactoryBean.getStringToPursuitConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.saic.tmr.domain.Pursuit>() {
            public com.saic.tmr.domain.Pursuit convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Pursuit.class);
            }
        };
    }
    
    public Converter<PursuitRole, String> ApplicationConversionServiceFactoryBean.getPursuitRoleToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.saic.tmr.domain.PursuitRole, java.lang.String>() {
            public String convert(PursuitRole pursuitRole) {
                return new StringBuilder().append(pursuitRole.getCode()).append(' ').append(pursuitRole.getName()).toString();
            }
        };
    }
    
    public Converter<Long, PursuitRole> ApplicationConversionServiceFactoryBean.getIdToPursuitRoleConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.saic.tmr.domain.PursuitRole>() {
            public com.saic.tmr.domain.PursuitRole convert(java.lang.Long id) {
                return PursuitRole.findPursuitRole(id);
            }
        };
    }
    
    public Converter<String, PursuitRole> ApplicationConversionServiceFactoryBean.getStringToPursuitRoleConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.saic.tmr.domain.PursuitRole>() {
            public com.saic.tmr.domain.PursuitRole convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), PursuitRole.class);
            }
        };
    }
    
    public Converter<PursuitStatus, String> ApplicationConversionServiceFactoryBean.getPursuitStatusToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.saic.tmr.domain.PursuitStatus, java.lang.String>() {
            public String convert(PursuitStatus pursuitStatus) {
                return new StringBuilder().append(pursuitStatus.getName()).toString();
            }
        };
    }
    
    public Converter<Long, PursuitStatus> ApplicationConversionServiceFactoryBean.getIdToPursuitStatusConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.saic.tmr.domain.PursuitStatus>() {
            public com.saic.tmr.domain.PursuitStatus convert(java.lang.Long id) {
                return PursuitStatus.findPursuitStatus(id);
            }
        };
    }
    
    public Converter<String, PursuitStatus> ApplicationConversionServiceFactoryBean.getStringToPursuitStatusConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.saic.tmr.domain.PursuitStatus>() {
            public com.saic.tmr.domain.PursuitStatus convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), PursuitStatus.class);
            }
        };
    }
    
    public Converter<RFP, String> ApplicationConversionServiceFactoryBean.getRFPToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.saic.tmr.domain.RFP, java.lang.String>() {
            public String convert(RFP rFP) {
                return new StringBuilder().append(rFP.getContractEffort()).toString();
            }
        };
    }
    
    public Converter<Long, RFP> ApplicationConversionServiceFactoryBean.getIdToRFPConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.saic.tmr.domain.RFP>() {
            public com.saic.tmr.domain.RFP convert(java.lang.Long id) {
                return RFP.findRFP(id);
            }
        };
    }
    
    public Converter<String, RFP> ApplicationConversionServiceFactoryBean.getStringToRFPConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.saic.tmr.domain.RFP>() {
            public com.saic.tmr.domain.RFP convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), RFP.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getAwardToStringConverter());
        registry.addConverter(getIdToAwardConverter());
        registry.addConverter(getStringToAwardConverter());
        registry.addConverter(getBusinessUnitToStringConverter());
        registry.addConverter(getIdToBusinessUnitConverter());
        registry.addConverter(getStringToBusinessUnitConverter());
        registry.addConverter(getCommandToStringConverter());
        registry.addConverter(getIdToCommandConverter());
        registry.addConverter(getStringToCommandConverter());
        registry.addConverter(getCompanyToStringConverter());
        registry.addConverter(getIdToCompanyConverter());
        registry.addConverter(getStringToCompanyConverter());
        registry.addConverter(getContractTypeToStringConverter());
        registry.addConverter(getIdToContractTypeConverter());
        registry.addConverter(getStringToContractTypeConverter());
        registry.addConverter(getNewBusinessToStringConverter());
        registry.addConverter(getIdToNewBusinessConverter());
        registry.addConverter(getStringToNewBusinessConverter());
        registry.addConverter(getOpCenterToStringConverter());
        registry.addConverter(getIdToOpCenterConverter());
        registry.addConverter(getStringToOpCenterConverter());
        registry.addConverter(getPersonToStringConverter());
        registry.addConverter(getIdToPersonConverter());
        registry.addConverter(getStringToPersonConverter());
        registry.addConverter(getProcurementTypeToStringConverter());
        registry.addConverter(getIdToProcurementTypeConverter());
        registry.addConverter(getStringToProcurementTypeConverter());
        registry.addConverter(getPursuitToStringConverter());
        registry.addConverter(getIdToPursuitConverter());
        registry.addConverter(getStringToPursuitConverter());
        registry.addConverter(getPursuitRoleToStringConverter());
        registry.addConverter(getIdToPursuitRoleConverter());
        registry.addConverter(getStringToPursuitRoleConverter());
        registry.addConverter(getPursuitStatusToStringConverter());
        registry.addConverter(getIdToPursuitStatusConverter());
        registry.addConverter(getStringToPursuitStatusConverter());
        registry.addConverter(getRFPToStringConverter());
        registry.addConverter(getIdToRFPConverter());
        registry.addConverter(getStringToRFPConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
