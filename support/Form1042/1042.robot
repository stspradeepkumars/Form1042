***Keywords***

ProcessReturn-Form1042     
    #@{cards}          4242424242424242    5555555555554444    2223003122003222     5105105105105100     371449635398431         
    #ReadLocators
    Locators_1042
    ${xml}=    Parse XML    ../../Object Repository/1042.xml
    ${wbook}=     Set Variable     ${CURDIR}/../../Test Data/Form1042.xlsx
    ${logid}=     Get Environment Variable     logid
    ${start}=       Get Element Text    	${xml}   	start
    ${form}=       Get Element Text    	${xml}   	form
    ${1042}=    	set Variable    (//span[contains(text(),"Form 1042")])[4] 
    Open Workbook      ${wbook}
    ${sheet}=        Read Worksheet   Form1042
    ${rows}=         Get Length  ${sheet}

    FOR    ${i}    IN RANGE   2   10
      SelectNewForm1042  ${start}    ${form}  ${1042}
      sleep  15s
      ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled   ${startnew}        100s
      Run Keyword If	${passed}    Click Element   ${startnew}  
      Click Element  ${choose1042A}
      sleep	10s
      ${obj_ID}=    Get cell value    ${i}    A   Form1042   
      ${obj_Des}=    Get cell value    ${i}    B   Form1042
      ${obj_Expected}=		Get cell value    ${i}    FD   Form1042
      ${obj_PActual}=		Get cell value    ${i}    FE   Form1042
      ${obj_NActual}=		Get cell value    ${i}    FF   Form1042
      ${WithholdingAgentName}=    FakerLibrary.Name Male
      Log to console   ${WithholdingAgentName}
      # ${time}=     Get time
      # ${TName}=   Set Variable    ${time}
      # ${TName}=    Remove String        ${TName}   :    -   ${SPACE}
      ${WithholdingAgentN}=    Get cell value    ${i}    C   Form1042
      # ${WithholdingAgentName}=    	set Variable  ${WithholdingAgentN}${TName}  

      ${TypeOfEIN}=    Get cell value    ${i}    D   Form1042
      ${WithholdingAgentEIN}=    Get cell value    ${i}    E   Form1042
      ${ein}    Generate random string    7    1234589
      ${einManual}=    	set Variable    00${ein}
      ${QIEINManual}=    	set Variable    98${ein}

      ${Chapter3StatusCode}=    Get cell value    ${i}    F   Form1042
      ${Chapter4StatusCode}=    Get cell value    ${i}    G   Form1042

      ${IsForeignAdd}=      Get cell value    ${i}    H   Form1042
      ${WHAddress1}=    Get cell value    ${i}    I   Form1042
      ${WHAddress2}=    Get cell value    ${i}    J   Form1042
      ${WHCity}=    Get cell value    ${i}    K   Form1042
      ${StateName}=    Get cell value    ${i}    L   Form1042
      ${WHZipCode}=    Get cell value    ${i}    M   Form1042
      ${WHFAddress1}=      Get cell value    ${i}    I   Form1042
      ${WHFAddress2}=      Get cell value    ${i}    J   Form1042
      ${WHFCity}=      Get cell value    ${i}    K   Form1042
      ${WHFCountry}=      Get cell value    ${i}    L   Form1042
      ${WHFpostalcode}=      Get cell value    ${i}    M   Form1042
      ${ContactName}=    Get cell value    ${i}    N   Form1042
      ${WHEmailAddress}=    Get cell value    ${i}    O   Form1042
      ${WHPhone}=    Get cell value    ${i}    P   Form1042	  
      ${FaxNumber}=    Get cell value    ${i}    Q   Form1042	
      ${SigningAuthorityName}=	   Get cell value    ${i}    R   Form1042
      ${Title}=    Get cell value    ${i}    S   Form1042
      ${DayTimePhone}=    Get cell value    ${i}    T   Form1042	
      ${TaxYear}=      Get cell value    ${i}    U   Form1042
      ${IsFinalReturn}=      Get cell value    ${i}    V   Form1042
      ${FinalIncomePaidDate}=      Get cell value    ${i}    W   Form1042

      ${IsSection1-FederalTaxLiabily}=      Get cell value    ${i}    X   Form1042
      ${Jan-07}=    Get cell value    ${i}    Y   Form1042
      ${Jan-15}=    Get cell value    ${i}    Z   Form1042
      ${Jan-22}=    Get cell value    ${i}    AA   Form1042
      ${Jan-31}=    Get cell value    ${i}    AB   Form1042
      ${Jan.Total}=    Get cell value    ${i}    AC   Form1042
      ${Feb-07}=    Get cell value    ${i}    AD   Form1042
      ${Feb-15}=    Get cell value    ${i}    AE   Form1042
      ${Feb-22}=    Get cell value    ${i}    AF   Form1042
      ${Feb-28}=    Get cell value    ${i}    AG   Form1042
      ${Feb.Total}=    Get cell value    ${i}    AH   Form1042
      ${Mar-07}=    Get cell value    ${i}    AI   Form1042
      ${Mar-15}=    Get cell value    ${i}    AJ   Form1042
      ${Mar-22}=    Get cell value    ${i}    AK   Form1042
      ${Mar-31}=    Get cell value    ${i}    AL   Form1042
      ${Mar.Total}=    Get cell value    ${i}    AM   Form1042
      ${Apr-07}=    Get cell value    ${i}    AN   Form1042
      ${Apr-15}=    Get cell value    ${i}    AO   Form1042
      ${Apr-22}=    Get cell value    ${i}    AP   Form1042
      ${Apr-30}=    Get cell value    ${i}    AQ   Form1042
      ${Apr.Total}=    Get cell value    ${i}    AR   Form1042
      ${May-07}=    Get cell value    ${i}    AS   Form1042
      ${May-15}=    Get cell value    ${i}    AT   Form1042
      ${May-22}=    Get cell value    ${i}    AU   Form1042
      ${May-31}=    Get cell value    ${i}    AV   Form1042
      ${May.Total}=    Get cell value    ${i}    AW   Form1042
      ${June-07}=    Get cell value    ${i}    AX   Form1042
      ${June-15}=    Get cell value    ${i}    AY   Form1042
      ${June-22}=    Get cell value    ${i}    AZ   Form1042
      ${June-30}=    Get cell value    ${i}    BA   Form1042
      ${June.Total}=    Get cell value    ${i}    BB   Form1042
      ${July-07}=    Get cell value    ${i}    BC   Form1042
      ${July-15}=    Get cell value    ${i}    BD   Form1042
      ${July-22}=    Get cell value    ${i}    BE   Form1042
      ${July-31}=    Get cell value    ${i}    BF   Form1042
      ${July.Total}=    Get cell value    ${i}    BG   Form1042
      ${Aug-07}=    Get cell value    ${i}    BH   Form1042
      ${Aug-15}=    Get cell value    ${i}    BI   Form1042
      ${Aug-22}=    Get cell value    ${i}    BJ   Form1042
      ${Aug-31}=    Get cell value    ${i}    BK   Form1042
      ${Aug.Total}=    Get cell value    ${i}    BL   Form1042
      ${Sept-07}=    Get cell value    ${i}    BM   Form1042
      ${Sept-15}=    Get cell value    ${i}    BN   Form1042
      ${Sept-22}=    Get cell value    ${i}    BO   Form1042
      ${Sept-31}=    Get cell value    ${i}    BP   Form1042
      ${Sept.Total}=    Get cell value    ${i}    BQ   Form1042
      ${Oct-07}=    Get cell value    ${i}    BR   Form1042
      ${Oct-15}=    Get cell value    ${i}    BS   Form1042
      ${Oct-22}=    Get cell value    ${i}    BT   Form1042
      ${Oct-31}=    Get cell value    ${i}    BU   Form1042
      ${Oct.Total}=    Get cell value    ${i}    BV   Form1042
      ${Nov-07}=    Get cell value    ${i}    BW   Form1042
      ${Nov-15}=    Get cell value    ${i}    BX   Form1042
      ${Nov-22}=    Get cell value    ${i}    BY   Form1042
      ${Nov-30}=    Get cell value    ${i}    BZ   Form1042
      ${Nov.Total}=    Get cell value    ${i}    CA   Form1042
      ${Dec-07}=    Get cell value    ${i}    CB   Form1042
      ${Dec-15}=    Get cell value    ${i}    CC   Form1042
      ${Dec-22}=    Get cell value    ${i}    CD   Form1042
      ${Dec-31}=    Get cell value    ${i}    CE   Form1042
      ${Dec.Total}=    Get cell value    ${i}    CF   Form1042

      ${Line61-OnPaper}=      Get cell value    ${i}    CG   Form1042
      ${Line61-Electronically}=      Get cell value    ${i}    CH   Form1042
      ${Line62a-FDAPIncome}=      Get cell value    ${i}    CI   Form1042
      ${Line62b1-SubstituteDividendPayments}=      Get cell value    ${i}    CJ   Form1042
      ${Line62b2-SubstitutePaymentsReported}=    Get cell value    ${i}    CK   Form1042
      ${Line62c-TotalGrossAmount}=    Get cell value    ${i}    CL   Form1042
      ${Line62d-AcutallypaidGross}=    Get cell value    ${i}    CM   Form1042	  
      ${IsThirdPartyDesignee}=    Get cell value    ${i}    CN   Form1042	
      ${DesigneeName}=	   Get cell value    ${i}    CO   Form1042
      ${DesigneePhoneNumber}=    Get cell value    ${i}    CP   Form1042
      ${Pin1}=    Get cell value    ${i}    CQ   Form1042	
      ${Pin2}=      Get cell value    ${i}    CR   Form1042
      ${Pin3}=      Get cell value    ${i}    CS   Form1042
      ${Pin4}=      Get cell value    ${i}    CT   Form1042
      ${Pin5}=    Get cell value    ${i}    CU   Form1042	
      ${Line63a}=      Get cell value    ${i}    CV   Form1042
      ${Line63b1}=      Get cell value    ${i}    CW   Form1042
      ${Line63b2}=      Get cell value    ${i}    CX   Form1042
      ${Line63c1}=    Get cell value    ${i}    CY   Form1042	
      ${Line63c2}=      Get cell value    ${i}    CZ   Form1042
      ${Line63d}=      Get cell value    ${i}    DA   Form1042
      ${Line63e}=      Get cell value    ${i}    DB   Form1042
      ${Line64a}=    Get cell value    ${i}    DC   Form1042	
      ${Line64b}=      Get cell value    ${i}    DD   Form1042
      ${Line64c}=      Get cell value    ${i}    DE   Form1042
      ${Line64d}=      Get cell value    ${i}    DF   Form1042
      ${Line64e}=    Get cell value    ${i}    DG   Form1042	
      ${Line65a}=      Get cell value    ${i}    DH   Form1042
      ${Line65b}=      Get cell value    ${i}    DI   Form1042
      ${Line66}=      Get cell value    ${i}    DJ   Form1042
      ${Line67a}=    Get cell value    ${i}    DK   Form1042	
      ${Line67b}=      Get cell value    ${i}    DL   Form1042
      ${Line68}=      Get cell value    ${i}    DM   Form1042
      ${Line69}=      Get cell value    ${i}    DN   Form1042
      ${Line70a}=    Get cell value    ${i}    DO   Form1042	
      ${Line70b}=      Get cell value    ${i}    DP   Form1042
      ${Line71}=      Get cell value    ${i}    DQ   Form1042
      ${OverpaymntType}=      Get cell value    ${i}    DR   Form1042
      ${IsSection2}=    Get cell value    ${i}    DS   Form1042	
      ${IsSection2-1}=      Get cell value    ${i}    DT   Form1042
      ${IsSection2-2a}=      Get cell value    ${i}    DU   Form1042
      ${IsSection2-2b}=      Get cell value    ${i}    DV   Form1042
      ${IsSection2-2c}=      Get cell value    ${i}    DW   Form1042
      ${IsSection2-2d}=      Get cell value    ${i}    DX   Form1042
      ${IsSection2-2e}=    Get cell value    ${i}    DY   Form1042	
      ${IsSection2-3}=      Get cell value    ${i}    DZ   Form1042
      ${IsSection2-4}=      Get cell value    ${i}    EA   Form1042
      ${IsSection2-5}=      Get cell value    ${i}    EB   Form1042
      ${IsSection2-6}=    Get cell value    ${i}    EC   Form1042	
      ${Section3-Section 871}=      Get cell value    ${i}    ED   Form1042
      ${Section4-QDD}=      Get cell value    ${i}    EE   Form1042

      ${PaymentType}=      Get cell value    ${i}    EI   Form1042
      ${EFWAccountType}=      Get cell value    ${i}    FJ   Form1042
      ${EFWUSBankRoutingNumber}=    Get cell value    ${i}    EK   Form1042	
      ${USBankAccountNumber}=      Get cell value    ${i}    EL   Form1042
      ${Editreturn}=      Get cell value    ${i}    EM   Form1042
      ${EditLine1}=      Get cell value    ${i}    EN   Form1042
      ${ErrorMessage}=    Get cell value    ${i}    EO   Form1042	
      ${ErrorInput}=      Get cell value    ${i}    EP   Form1042
      ${AuditError}=      Get cell value    ${i}    EQ   Form1042
      ${E-signType}=      Get cell value    ${i}    ER   Form1042
      ${OnlinePIN}=    Get cell value    ${i}    ES   Form1042	
      ${IsReturnusingCredits}=      Get cell value    ${i}    ET   Form1042
      ${IsFillingFee}=      Get cell value    ${i}    EU   Form1042
      ${IsPayment}=      Get cell value    ${i}    EW   Form1042
      ${IsManual}=      Get cell value    ${i}    EV   Form1042
      ${IsIRSPayment}=      Get cell value    ${i}    EY   Form1042

      ${screen}=			Set Variable     ../../Test suite/Form1042/1042Screenshot/${obj_ID}.png
      ${Auditscreens}=			Set Variable     ../../Test suite/Form1042/1042AuditScreenshot/${obj_ID}.png

      Run Keyword And Continue On Failure   WithholdingAgentInformation  ${QIEINManual}  ${einManual}  ${WHFAddress2}  ${WHAddress2}  ${IsManual}  ${OWHFax}  ${OWHState}  ${OWHPostalCode}  ${OWHCountry}  ${OIsForeignAddr}  ${ONQI-EIN}  ${OWT-EIN}  ${OWP-EIN}  ${OQI-EIN}  ${OEIN}  ${OWHTitle}  ${OWHZipCode}  ${OWHAddress1}  ${OWHContactName}  ${OWHEmail}  ${OWHPhone}  ${OWHSignatoryName}  ${obtnsave}  ${OWHDaytimePhone}  ${OWHEmail}  ${OWHCity}  ${OWHAddress1}  ${OWithholdingAgentEIN}  ${OWithholdingAgentName}  ${WithholdingAgentName}  ${TypeOfEIN}  ${WithholdingAgentEIN}  ${IsForeignAdd}  ${WHAddress1}  ${WHCity}  ${StateName}  ${WHZipCode}  ${WHFAddress1}  ${WHFCity}  ${WHFCountry}  ${WHFpostalcode}  ${ContactName}  ${WHEmailAddress}  ${WHPhone}  ${FaxNumber}  ${SigningAuthorityName}   ${Title}   ${DayTimePhone}    ${TaxYear}
      Run Keyword And Continue On Failure   FormPage1-1042    ${OThirdPartyDesigneeYes}  ${ODesigneeName}  ${ODesigneePhoneNumber}  ${OPIN1}  ${OPIN2}  ${OPIN3}  ${OPIN4}  ${OPIN5}  ${OSaveandContinue}  ${OLine61Onpaper}  ${OLine61Electronically}  ${OLine62a}  ${OLine62b1}  ${OLine62b2}  ${OLine62c}  ${OLine62d}  ${ONovTotal}  ${ODec15}  ${ODec07}  ${ODec22}  ${ODec31}  ${ODecTotal}  ${ONov07}  ${ONov15}  ${ONov22}  ${ONov30}  ${OOct07}  ${OOct15}  ${OOct22}  ${OOct31}  ${OOctTotal}  ${OSep07}  ${OSep15}  ${OSep22}  ${OSep31}  ${OSepTotal}  ${OAug07}  ${OAug15}  ${OAug22}  ${OAug31}  ${OAugTotal}  ${OJuly07}  ${OJuly15}  ${OJuly22}  ${OJuly31}  ${OJulyTotal}  ${OJune07}  ${OJune15}  ${OJune22}  ${OJune30}  ${OJuneTotal}  ${OMay07}  ${OMay15}  ${OMay22}  ${OMay31}  ${OMayTotal}  ${OApr15}  ${OApr22}  ${OApr30}  ${OAprTotal}  ${OApr07}  ${OMarTotal}  ${OMar31}  ${OMar22}  ${OMar15}  ${OMar07}  ${OFebTotal}  ${OFeb28}  ${OFeb22}  ${OFeb15}  ${OFeb07}  ${OJan31}  ${OJan22}  ${OJan15}  ${OJan7}  ${OJanTotal}  ${Chapter3StatusCode}  ${Chapter4StatusCode}  ${IsFinalReturn}     ${FinalIncomePaidDate}    ${IsSection1-FederalTaxLiabily}  ${Jan-07}  ${Jan-15}  ${Jan-22}   ${Jan-31}  ${Jan.Total}  ${Feb-07}  ${Feb-15}   ${Feb-22}  ${Feb-28}  ${Feb.Total}   ${Mar-07}  ${Mar-15}  ${Mar-22}   ${Mar-31}  ${Mar.Total}    ${Apr-07}  ${Apr-15}  ${Apr-22}   ${Apr-30}  ${Apr.Total}    ${May-07}  ${May-15}  ${May-22}   ${May-31}  ${May.Total}    ${June-07}  ${June-15}  ${June-22}   ${June-30}  ${June.Total}   ${July-07}  ${July-15}  ${July-22}   ${July-31}  ${July.Total}   ${Aug-07}  ${Aug-15}  ${Aug-22}   ${Aug-31}  ${Aug.Total}  ${Sept-07}  ${Sept-15}  ${Sept-22}   ${Sept-31}  ${Sept.Total}   ${Oct-07}  ${Oct-15}  ${Oct-22}   ${Oct-31}  ${Oct.Total}    ${Nov-07}  ${Nov-15}  ${Nov-22}   ${Nov-30}  ${Nov.Total}   ${Dec-07}  ${Dec-15}  ${Dec-22}   ${Dec-31}  ${Dec.Total}  ${Line61-OnPaper}  ${Line61-Electronically}  ${Line62a-FDAPIncome}   ${Line62b1-SubstituteDividendPayments}  ${Line62b2-SubstitutePaymentsReported}   ${Line62c-TotalGrossAmount}    ${Line62d-AcutallypaidGross}  ${IsThirdPartyDesignee}  ${DesigneeName}  ${DesigneePhoneNumber}  ${Pin1}  ${Pin2}  ${Pin3}  ${Pin4}  ${Pin5}  
      Run Keyword And Continue On Failure   FormPage2-1042    ${OSec2-3}  ${OSec2-4}  ${OSec2-5}  ${OSec3-871m}  ${OSec4-QDD}  ${OSec2-1}  ${OLine71Credit}  ${OLine71Refund}  ${OSec2-2a}  ${OSec2-2b}  ${OSec2-2d}  ${OSec2-2c}  ${OSec2-2e}  ${OLine70b}  ${OLine66}  ${OLine65a}  ${OLine65b}  ${OLine68}  ${OLine66}  ${OLine67a}  ${OLine67b}  ${OLine69}  ${OLine68}  ${OLine70a}  ${OLine64e}  ${OLine64d}  ${OLine64c}  ${OLine64b}  ${OLine64a}  ${OLine63e}  ${OLine63d}  ${OLine63c2}  ${OLine63c1}  ${OLine63b2}  ${OLine63b1}  ${OLine63a}  ${Line63a}  ${Line63b1}  ${Line63b2}  ${Line63c1}  ${Line63c2}  ${Line63d}  ${Line63e}  ${Line64a}  ${Line64b}  ${Line64c}  ${Line64d}  ${Line64e}  ${Line65a}  ${Line65b}  ${Line66}  ${Line67a}  ${Line67b}  ${Line68}  ${Line69}  ${Line70a}  ${Line70b}  ${Line71}  ${OverpaymntType}  ${IsSection2}  ${IsSection2-1}  ${IsSection2-2a}  ${IsSection2-2b}  ${IsSection2-2c}  ${IsSection2-2d}  ${IsSection2-2e}  ${IsSection2-3}  ${IsSection2-4}  ${IsSection2-5}  ${IsSection2-6}  ${Section3-Section 871}  ${Section4-QDD}
      Run Keyword If	'${IsIRSPayment}'=='YES'	Form1042-IRSPayment  ${PaymentType}  ${DayTimePhone}   
      Run Keyword And Continue On Failure   Form1042-Summary
      Run Keyword And Continue On Failure   Form1042-Audit
      Run Keyword And Continue On Failure   Form1042-Signature 
      Run Keyword And Continue On Failure   Form1042-Filingfees-TransmitForm  ${oCompleteFiling}  
      # Form1042-SCHQ

      ${save} =		set Variable 	 //a[contains(text(),'Return Home')]                          
      # ...        ELSE          set Variable 	 ${oCompleteFiling}

      Final Message   ${save}		${logid}    ${obj_ID}   ${obj_Des}   ${obj_Expected}    ${obj_PActual}   ${obj_NActual}   ${screen}
      E-FileStaging  ${WithholdingAgentName}  ${obj_ID}
      Click Element     	  //a[contains(text(),'Return Home')]
      sleep  15s
    END

