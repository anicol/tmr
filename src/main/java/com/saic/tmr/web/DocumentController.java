package com.saic.tmr.web;

import com.saic.tmr.*;
import com.saic.tmr.domain.*;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

@RequestMapping("/documents")
@Controller
@RooWebScaffold(path = "documents", formBackingObject = Document.class, update = false)
public class DocumentController {

    private static final Logger log = Logger.getLogger(DocumentController.class);

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws ServletException {
        binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
    }

    @RequestMapping(value = "savedoc", method = RequestMethod.POST)
    public String createdoc(@Valid Document document, BindingResult result, Model model, @RequestParam("content") MultipartFile content, HttpServletRequest request) {
        document.setContentType(content.getContentType());
        document.setFilename(content.getOriginalFilename());
        log.error("Filename is: " + content.getOriginalFilename());
        log.error("ContentType is: " + content.getContentType());
        document.setFilesize(content.getSize());
        if (result.hasErrors()) {
            List<ObjectError> errors = result.getAllErrors();
            for (int i = 0; i < errors.size(); i++) {
                ObjectError error = errors.get(i);
                log.error("Error " + i + " : " + error.toString());
            }
            model.addAttribute("document", document);
            return "documents/create";
        }
        document.persist();
        POIFSFileSystem fileSystem = null;
        try {
            fileSystem = new POIFSFileSystem(new ByteArrayInputStream(content.getBytes()));
        } catch (Exception e) {
            log.error("The file uploaded is not an excel file");
            return null;
        }
        HSSFWorkbook workBook = null;
        try {
            workBook = new HSSFWorkbook(fileSystem);
        } catch (IOException e) {
            e.printStackTrace();
        }
        HSSFSheet sheet = workBook.getSheetAt(0);
        Iterator<HSSFRow> rows = sheet.rowIterator();
        int previousTargetNumber = 0;
        rows.next();
        while (rows.hasNext()) {
            HSSFRow row = rows.next();
            log.error("Row No.: " + row.getRowNum());
            Iterator<HSSFCell> cells = row.cellIterator();
            RFP rfp = new RFP();
            Pursuit pursuit = new Pursuit();
            Award award = new Award();
            HSSFCell cellA = cells.next();
            int targetNumber = 0;
            if (cellA.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                rfp.setTargetNumber((int) cellA.getNumericCellValue());
                targetNumber = (int) cellA.getNumericCellValue();
            } else if (cellA.getCellType() == HSSFCell.CELL_TYPE_STRING) {
                rfp.setTargetNumber(Integer.parseInt(cellA.getRichStringCellValue().toString().trim()));
                targetNumber = Integer.parseInt(cellA.getRichStringCellValue().toString().trim());
            }            
            HSSFCell cellB = cells.next();
            if (cellB.getCellType() == HSSFCell.CELL_TYPE_STRING) {
                rfp.setPursuitStatus((PursuitStatus) PursuitStatus.findPursuitStatusesByCodeEquals(cellB.getRichStringCellValue().toString().trim()).getSingleResult());
            }
            HSSFCell cellC = cells.next();
            if (cellC.getCellType() == HSSFCell.CELL_TYPE_STRING) {
                pursuit.setTracCrmNumber(cellC.getRichStringCellValue().toString().trim());
            }
            HSSFCell cellD = cells.next();
            if (cellD.getCellType() == HSSFCell.CELL_TYPE_STRING) {
                List<BusinessUnit> results = BusinessUnit.findBusinessUnitsByNameEquals(cellD.getRichStringCellValue().toString().trim()).getResultList();
                if (results.size() == 0) {
                    BusinessUnit businessUnit = new BusinessUnit();
                    businessUnit.setName(cellD.getRichStringCellValue().toString().trim());
                    businessUnit.persist();
                    pursuit.setBusinessUnit(businessUnit);
                } else if (results.size() == 1) {
                    pursuit.setBusinessUnit((BusinessUnit) results.get(0));
                } else {
                    log.error("Database error");
                }
            }
            HSSFCell cellE = cells.next();
            if (cellE.getCellType() == HSSFCell.CELL_TYPE_STRING) {
                List<OpCenter> results = OpCenter.findOpCentersByNameEquals(cellE.getRichStringCellValue().toString().trim()).getResultList();
                if (results.size() == 0) {
                    OpCenter opCenter = new OpCenter();
                    opCenter.setName(cellE.getRichStringCellValue().toString().trim());
                    opCenter.persist();
                    pursuit.setOpCenter(opCenter);
                } else if (results.size() == 1) {
                    pursuit.setOpCenter((OpCenter) results.get(0));
                } else {
                    log.error("Database error");
                }
            }
            HSSFCell cellF = cells.next();
            if (cellF.getCellType() == HSSFCell.CELL_TYPE_STRING) {
                List<Command> results = Command.findCommandsByNameEquals(cellF.getRichStringCellValue().toString().trim()).getResultList();
                if (results.size() == 0) {
                    Command command = new Command();
                    command.setName(cellF.getRichStringCellValue().toString().trim());
                    command.persist();
                    rfp.setCommand(command);
                } else if (results.size() == 1) {
                    rfp.setCommand((Command) results.get(0));
                } else {
                    log.error("Database error");
                }
            }
            HSSFCell cellG = cells.next();
            if (cellG.getCellType() == HSSFCell.CELL_TYPE_STRING) {
                rfp.setContractEffort(cellG.getRichStringCellValue().toString().trim());
            }
            HSSFCell cellH = cells.next();
            if (cellH.getCellType() == HSSFCell.CELL_TYPE_STRING) {
                rfp.setRfpNumber(cellH.getRichStringCellValue().toString().trim());
            }
            HSSFCell cellI = cells.next();
            if (cellI.getCellType() == HSSFCell.CELL_TYPE_STRING) {
                pursuit.setCodeName(cellI.getRichStringCellValue().toString().trim());
            }
            HSSFCell cellJ = cells.next();
            if (cellJ.getCellType() == HSSFCell.CELL_TYPE_STRING) {
                String inFull = cellJ.getRichStringCellValue().toString().trim();
                if (!inFull.toString().equals(null) && !inFull.equals("")) {
                    String first = "";
                    String last = "";
                    List<Person> results = null;
                    if (inFull.contains(",")) {
                        String[] names = inFull.split(",");
                        last = names[0].trim();
                        first = names[1].trim();
                        results = Person.findPeopleByLastNameLikeAndFirstNameLike(last, first).getResultList();
                    } else if (inFull.contains(" ")) {
                        String[] names = inFull.split(" ");
                        first = names[0].trim();
                        last = names[1].trim();
                        results = Person.findPeopleByLastNameLikeAndFirstNameLike(last, first).getResultList();
                    } else {
                        last = inFull;
                        results = Person.findPeopleByLastNameLike(last).getResultList();
                    }
                    if (results.size() == 0) {
                        Person person = new Person();
                        person.setFirstName(first);
                        person.setLastName(last);
                        person.persist();
                        pursuit.setCaptureManager(person);
                    } else if (results.size() == 1) {
                    	pursuit.setCaptureManager((Person) results.get(0));
                    } else {
                        log.error("Database error");
                    }
                }
            }
            HSSFCell cellK = cells.next();
            if (cellK.getCellType() == HSSFCell.CELL_TYPE_STRING) {
            	pursuit.setPursuitRole((PursuitRole) PursuitRole.findPursuitRolesByCodeEquals(cellK.getRichStringCellValue().toString().trim()).getSingleResult());
            }
            HSSFCell cellL = cells.next();
            if (cellL.getCellType() == HSSFCell.CELL_TYPE_STRING) {
                List<Company> results = Company.findCompanysByNameEquals(cellL.getRichStringCellValue().toString().trim()).getResultList();
                if (results.size() == 0) {
                    Company company = new Company();
                    company.setName(cellL.getRichStringCellValue().toString());
                    company.persist();
                    pursuit.setPrimeCompany(company);
                } else if (results.size() == 1) {
                	pursuit.setPrimeCompany((Company) results.get(0));
                } else {
                    log.error("Database error");
                }
            }
            HSSFCell cellM = cells.next();
            if (cellM.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
            	pursuit.setProcurementValue((float) cellM.getNumericCellValue());
            } else if (cellM.getCellType() == HSSFCell.CELL_TYPE_STRING) {
            }
            HSSFCell cellN = cells.next();
            if (cellN.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
            	pursuit.setBuValue((float) cellN.getNumericCellValue());
            } else if (cellN.getCellType() == HSSFCell.CELL_TYPE_STRING) {
            }
            HSSFCell cellO = cells.next();
            if (cellO.getCellType() == HSSFCell.CELL_TYPE_STRING) {
                if (!cellO.getRichStringCellValue().toString().trim().equals(null) && !cellO.getRichStringCellValue().toString().trim().equals("")) {
                    rfp.setProcurementType((ProcurementType) ProcurementType.findProcurementTypesByCodeEquals(cellO.getRichStringCellValue().toString()).getSingleResult());
                }
            }
            HSSFCell cellP = cells.next();
            if (cellP.getCellType() == HSSFCell.CELL_TYPE_STRING) {
                if (!cellP.getRichStringCellValue().toString().trim().equals(null) && !cellP.getRichStringCellValue().toString().trim().equals("")) {
                    pursuit.setNewBusiness((NewBusiness) NewBusiness.findNewBusinessesByNameLike(cellP.getRichStringCellValue().toString().trim()).getSingleResult());
                }
            }
            HSSFCell cellQ = cells.next();
            if (cellQ.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
            	double value = cellQ.getNumericCellValue();
				if(HSSFDateUtil.isValidExcelDate(value))
				{
					Date date = HSSFDateUtil.getJavaDate(value);
					rfp.setRfpIssueDate(date);								
				}
				else
				{
					log.error("Invalid Date value found at row number " +
							row.getRowNum()+" and column number "+cellQ.getCellNum());	
				}    			
            }
            
            HSSFCell cellR = cells.next();
            if (cellR.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
            	double value = cellQ.getNumericCellValue();
				if(HSSFDateUtil.isValidExcelDate(value))
				{
					Date date = HSSFDateUtil.getJavaDate(value);
					rfp.setSubmittalDate(date);								
				}
				else
				{
					log.error("Invalid Date value found at row number " +
							row.getRowNum()+" and column number "+cellQ.getCellNum());	
				}
            }
            HSSFCell cellS = cells.next();
            if (cellS.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
            	double value = cellQ.getNumericCellValue();
				if(HSSFDateUtil.isValidExcelDate(value))
				{
					Date date = HSSFDateUtil.getJavaDate(value);
					award.setAwardDate(date);								
				}
				else
				{
					log.error("Invalid Date value found at row number " +
							row.getRowNum()+" and column number "+cellQ.getCellNum());	
				}
            }
            HSSFCell cellT = cells.next();
            if (cellT.getCellType() == HSSFCell.CELL_TYPE_STRING) {
                String inFull = cellT.getRichStringCellValue().toString().trim();
                if (!inFull.equals(null) && !inFull.equals("") && !inFull.equals(" ")) {
                    Set<Company> companys = new HashSet<Company>();
                    if (inFull.contains(",")) {
                        String[] companies = inFull.split(",");
                        for (int i = 0; i < companies.length; i++) {
                            List<Company> results = Company.findCompanysByNameEquals(companies[i]).getResultList();
                            if (results.size() == 0) {
                                Company company = new Company();
                                company.setName(companies[i]);
                                company.persist();
                                companys.add(company);
                            } else if (results.size() == 1) {
                                companys.add((Company) results.get(0));
                            } else {
                                log.error("Database error");
                            }
                        }
                    } else {
                        List<Company> results = Company.findCompanysByNameEquals(inFull).getResultList();
                        if (results.size() == 0) {
                            Company company = new Company();
                            company.setName(inFull);
                            company.persist();
                            companys.add(company);
                        } else if (results.size() == 1) {
                            companys.add((Company) results.get(0));
                        } else {
                            log.error("Database error");
                        }
                    }
                    rfp.setIncumbents(companys);
                }
            }
            HSSFCell cellU = cells.next();
            if (cellU.getCellType() == HSSFCell.CELL_TYPE_STRING) {
                String comment = cellU.getRichStringCellValue().toString().trim();
                if (comment.substring(0, 3).equalsIgnoreCase("cpoc")) {
                    String fullName = comment.substring(4).trim();
                    String first = "";
                    String last = "";
                    List<Person> results = null;
                    if (fullName.contains(",")) {
                        String[] names = fullName.split(",");
                        last = names[0].trim();
                        first = names[1].trim();
                        results = Person.findPeopleByLastNameLikeAndFirstNameLike(last, first).getResultList();
                    } else {
                        last = fullName;
                        results = Person.findPeopleByLastNameLike(last).getResultList();
                    }
                    if (results.size() == 0) {
                        Person person = new Person();
                        person.setFirstName(first);
                        person.setLastName(last);
                        person.persist();
                        pursuit.setContractsRep(person);
                    } else if (results.size() == 1) {
                        pursuit.setContractsRep((Person) results.get(0));
                    } else {
                        log.error("Database error");
                    }
                } else {
                    rfp.setComments(cellU.getRichStringCellValue().toString().trim());
                }
            }
            HSSFCell cellV = cells.next();
            if(!cellV.getRichStringCellValue().toString().trim().equals("")) {
	            if (cellV.getCellType() == HSSFCell.CELL_TYPE_STRING) {
	                List<Company> results = Company.findCompanysByNameEquals(cellV.getRichStringCellValue().toString().trim()).getResultList();
	                if (results.size() == 0) {
	                    Company company = new Company();
	                    company.setName(cellV.getRichStringCellValue().toString().trim());
	                    company.persist();
	                    award.setWinner(company);
	                } else if (results.size() == 1) {
	                    award.setWinner((Company) results.get(0));
	                } else {
	                    log.error("Database error");
	                }
	            }
            }
            if(cells.hasNext()) {
            	HSSFCell cellW = cells.next();
	            if (cellW.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
	                award.setWinningBid((float) cellW.getNumericCellValue());
	            } else if (cellW.getCellType() == HSSFCell.CELL_TYPE_STRING) {
	            }
            }
            
                    
            
            //  Need a method to join these all together.
            if (targetNumber!=previousTargetNumber) {
            	// New record            	
            	previousTargetNumber = targetNumber;
            	
            }
            else {
            	// Get existing rfp record
            	List<RFP> results = RFP.findRFPSByTargetNumber(targetNumber).getResultList();
            	if (results.size() == 0) {
            		log.error("Should have been a RFP record for: "+ targetNumber);
            	}
            	else if (results.size() == 1){
            		RFP prevRFP = (RFP) results.get(0);
            		rfp = prevRFP;
            	}
            	else {
            		log.error("Too many records returned for: " +targetNumber);
            	}
            }
            if(!cellV.getRichStringCellValue().toString().trim().equals("")) { //Winner is not empty
            	List<Award> awards = rfp.getAwards();
                award.setRfp(rfp);
            	awards.add(award);
            	rfp.setAwards(awards);
        		log.info("Adding award");
            }
        	if(!cellD.getRichStringCellValue().toString().trim().equals("")) { //BU is not empty
        		List<Pursuit> pursuits = rfp.getPursuits();
        		pursuit.setRfp(rfp);
        		pursuits.add(pursuit);
        		rfp.setPursuits(pursuits);
        		log.info("Adding pursuit");
        	}
            //pursuit.persist();
            //award.persist();
        	rfp.persist();
            
            
        }
        return "redirect:/documents?page=1&size=10" + encodeUrlPathSegment(document.getId().toString(), request);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Long id, Model model) {
        Document doc = Document.findDocument(id);
        doc.setUrl("http://localhost:8080/roodocman/documents/showdoc/" + id);
        model.addAttribute("document", Document.findDocument(id));
        model.addAttribute("itemId", id);
        return "documents/show";
    }

    @RequestMapping(value = "/showdoc/{id}", method = RequestMethod.GET)
    public String showdoc(@PathVariable("id") Long id, HttpServletResponse response, Model model) {
        Document doc = Document.findDocument(id);
        try {
            response.setHeader("Content-Disposition", "inline;filename=\"" + doc.getFilename() + "\"");
            OutputStream out = response.getOutputStream();
            response.setContentType(doc.getContentType());
            IOUtils.copy(new ByteArrayInputStream(doc.getContent()), out);
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Long id, Model model) {
        Document document = Document.findDocument(id);
        document.setUrl("http://localhost:8080/doctemplus/documents/showdoc/" + id);
        model.addAttribute("document", document);
        return "documents/update";
    }
}
