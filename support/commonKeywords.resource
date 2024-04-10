*** Keywords ***
WithholdingAgentInformation
  [Arguments]    ${QIEINManual}  ${einManual}  ${WHFAddress2}  ${WHAddress2}  ${IsManual}  ${OWHFax}  ${OWHState}  ${OWHPostalCode}  ${OWHCountry}  ${OIsForeignAddr}  ${ONQI-EIN}  ${OWT-EIN}  ${OWP-EIN}  ${OQI-EIN}  ${OEIN}  ${OWHTitle}  ${OWHZipCode}  ${OWHAddress1}  ${OWHContactName}  ${OWHEmail}  ${OWHPhone}  ${OWHSignatoryName}  ${obtnsave}  ${OWHDaytimePhone}  ${OWHEmail}  ${OWHCity}  ${OWHAddress1}  ${OWithholdingAgentEIN}  ${OWithholdingAgentName}  ${WithholdingAgentName}  ${TypeOfEIN}  ${WithholdingAgentEIN}  ${IsForeignAdd}  ${WHAddress1}  ${WHCity}  ${StateName}  ${WHZipCode}  ${WHFAddress1}  ${WHFCity}  ${WHFCountry}  ${WHFpostalcode}  ${ContactName}  ${WHEmailAddress}  ${WHPhone}  ${FaxNumber}  ${SigningAuthorityName}   ${Title}   ${DayTimePhone}    ${TaxYear}
    IF    '${IsManual}' == 'YES'
      #Wait Until Element Is Enabled    ${OWithholdingAgentName}  10s 		
	    sleep  15s
      #TypeOfEIN: EIN, QI-EIN, WP-EIN, WT-EN & NQI-EIN
      Run Keyword If    '${TypeOfEIN}' == 'EIN'   Click Element    ${OEIN}
      Run Keyword If    '${TypeOfEIN}' == 'QI-EIN'   Click Element    ${OQI-EIN}
      Run Keyword If    '${TypeOfEIN}' == 'WP-EIN'   Click Element    ${OWP-EIN}
      Run Keyword If    '${TypeOfEIN}' == 'WT-EIN'   Click Element    ${OWT-EIN}
      Run Keyword If    '${TypeOfEIN}' == 'NQI-EIN'   Click Element    ${ONQI-EIN}
      sleep  5s
      Run Keyword If    '${TypeOfEIN}' == 'QI-EIN'  Input Text       ${OWithholdingAgentEIN}          ${QIEINManual}
	    Run Keyword If    '${TypeOfEIN}' != 'QI-EIN'  Input Text       ${OWithholdingAgentEIN}          ${einManual}
      Input Text       ${OWithholdingAgentName}   ${WithholdingAgentName} 
      IF    '${IsForeignAdd}' == 'YES'
          Wait Until Element Is Enabled   ${OIsForeignAddr}   10s
          Execute Javascript  document.evaluate('${OIsForeignAddr}', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
          Input Text       ${OWHAddress1}          ${WHFAddress1}
          Input Text       ${OWHAddress2}          ${WHFAddress2}
          Input Text       ${OWHCity}          ${WHFCity}
          Input Text       (//label[@class="v-label v-field-label"])[6]/following-sibling::input          ${WHFCity}
          SeleniumLibrary.Press Keys 	 ${OWHCountry}  ${WHFCountry}
          sleep  5s
          Input Text       ${OWHContactNameF}          ${ContactName}
          Input Text       ${OWHEmailF}          ${WHEmailAddress}
          Input Text       ${OWHPhoneF}          ${WHPhone}
          Input Text       ${OWHFaxF}          8574125792
          Input Text       ${OWHSignatoryNameF}          ${SigningAuthorityName}
          Input Text    ${OWHTitleF}  Sole Proprietor
          Input Text       ${OWHDaytimePhoneF}          ${DayTimePhone}
          Input Text       ${OWHPostalCode}          ${WHFpostalcode}
      ELSE
          Input Text       ${OWHAddress1}          ${WHAddress1}
          sleep  2s
          Input Text       ${OWHAddress2}          ${WHAddress2}
          sleep  2s
          Input Text       ${OWHCity}          ${WHCity}
            #Click Element 	 //*[@id="StateName"]/parent::div 
          sleep  3s
          SeleniumLibrary.Press Keys 	 ${OWHState}  ${StateName}
          sleep  3s
          Input Text       ${OWHContactName}          ${ContactName}
          Input Text       ${OWHEmail}          ${WHEmailAddress}
          Input Text       ${OWHPhone}          ${WHPhone}
          Input Text       ${OWHFax}          8574125792
          Input Text       ${OWHSignatoryName}          ${SigningAuthorityName}
          Input Text    ${OWHTitle}  Sole Proprietor
          Input Text       ${OWHDaytimePhone}          ${DayTimePhone}
          sleep  5s
          Input Text       ${OWHZipCode}          ${WHZipCode}
      END
      Click Element 	 ${obtnsave}
      # ${passed} =    Run Keyword And Return Status         SeleniumLibrary.Page Should Contain 	 inValid Zip Code  	   20s  
      # press keys       ${OWHZipCode}          CTRL+a+BACKSPACE
      # Input Text       ${OWHZipCode}          ${WHZipCode}
      
      ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled		//i[@class="mdi-close mdi v-icon notranslate v-theme--light v-icon--size-default fs-14px mr-1"]/..  20s  
      Run Keyword If    ${passed}   JavascriptClick   //i[@class="mdi-close mdi v-icon notranslate v-theme--light v-icon--size-default fs-14px mr-1"]/..
      sleep    5s
      ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled		(//span[@class="v-btn__content"])[30]  20s  
      Run Keyword If    ${passed}   JavascriptClick   (//span[@class="v-btn__content"])[30]    

      ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled		(//span[@class="v-btn__content"])[30]  20s  
      Run Keyword If    ${passed}   Click Element   (//span[@class="v-btn__content"])[30]    
      ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled		//i[@class="mdi-close mdi v-icon notranslate v-theme--light v-icon--size-default fs-14px mr-1"]/..  20s  
      Run Keyword If    ${passed}   JavascriptClick   //i[@class="mdi-close mdi v-icon notranslate v-theme--light v-icon--size-default fs-14px mr-1"]/..
      sleep    5s
      ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled		(//span[@class="v-btn__content"])[30]  20s  
      Run Keyword If    ${passed}   JavascriptClick   (//span[@class="v-btn__content"])[30]    


    ELSE
      Wait Until Element Is Enabled   (//button[@type="button"])[7]/span[@class="v-btn__content"]   50s
      Click Element   (//button[@type="button"])[7]/span[@class="v-btn__content"]
      Wait Until Element Is Enabled   //span[contains(text()," Search ")]   5s
      common.JavascriptClick  //span[contains(text()," Search ")]
      Input text  //input[@placeholder="Enter Payer Name of the Employee/Recipient"]   ${WithholdingAgentName}
      sleep    5s
      Click Element         //div[@class="v-field__append-inner"]/button   
      sleep    5s 
      Click Element     	  ${obtnsave}
    END

FormPage1-1042
  [Arguments]    ${OThirdPartyDesigneeYes}  ${ODesigneeName}  ${ODesigneePhoneNumber}  ${OPIN1}  ${OPIN2}  ${OPIN3}  ${OPIN4}  ${OPIN5}  ${OSaveandContinue}  ${OLine61Onpaper}  ${OLine61Electronically}  ${OLine62a}  ${OLine62b1}  ${OLine62b2}  ${OLine62c}  ${OLine62d}  ${ONovTotal}  ${ODec15}  ${ODec07}  ${ODec22}  ${ODec31}  ${ODecTotal}  ${ONov07}  ${ONov15}  ${ONov22}  ${ONov30}  ${OOct07}  ${OOct15}  ${OOct22}  ${OOct31}  ${OOctTotal}  ${OSep07}  ${OSep15}  ${OSep22}  ${OSep31}  ${OSepTotal}  ${OAug07}  ${OAug15}  ${OAug22}  ${OAug31}  ${OAugTotal}  ${OJuly07}  ${OJuly15}  ${OJuly22}  ${OJuly31}  ${OJulyTotal}  ${OJune07}  ${OJune15}  ${OJune22}  ${OJune30}  ${OJuneTotal}  ${OMay07}  ${OMay15}  ${OMay22}  ${OMay31}  ${OMayTotal}  ${OApr15}  ${OApr22}  ${OApr30}  ${OAprTotal}  ${OApr07}  ${OMarTotal}  ${OMar31}  ${OMar22}  ${OMar15}  ${OMar07}  ${OFebTotal}  ${OFeb28}  ${OFeb22}  ${OFeb15}  ${OFeb07}  ${OJan31}  ${OJan22}  ${OJan15}  ${OJan7}  ${OJanTotal}  ${Chapter3StatusCode}  ${Chapter4StatusCode}  ${IsFinalReturn}     ${FinalIncomePaidDate}    ${IsSection1-FederalTaxLiabily}  ${Jan-07}  ${Jan-15}  ${Jan-22}   ${Jan-31}  ${Jan.Total}  ${Feb-07}  ${Feb-15}   ${Feb-22}  ${Feb-28}  ${Feb.Total}   ${Mar-07}  ${Mar-15}  ${Mar-22}   ${Mar-31}  ${Mar.Total}    ${Apr-07}  ${Apr-15}  ${Apr-22}   ${Apr-30}  ${Apr.Total}    ${May-07}  ${May-15}  ${May-22}   ${May-31}  ${May.Total}    ${June-07}  ${June-15}  ${June-22}   ${June-30}  ${June.Total}   ${July-07}  ${July-15}  ${July-22}   ${July-31}  ${July.Total}   ${Aug-07}  ${Aug-15}  ${Aug-22}   ${Aug-31}  ${Aug.Total}  ${Sept-07}  ${Sept-15}  ${Sept-22}   ${Sept-31}  ${Sept.Total}   ${Oct-07}  ${Oct-15}  ${Oct-22}   ${Oct-31}  ${Oct.Total}    ${Nov-07}  ${Nov-15}  ${Nov-22}   ${Nov-30}  ${Nov.Total}   ${Dec-07}  ${Dec-15}  ${Dec-22}   ${Dec-31}  ${Dec.Total}  ${Line61-OnPaper}  ${Line61-Electronically}  ${Line62a-FDAPIncome}   ${Line62b1-SubstituteDividendPayments}  ${Line62b2-SubstitutePaymentsReported}   ${Line62c-TotalGrossAmount}    ${Line62d-AcutallypaidGross}  ${IsThirdPartyDesignee}  ${DesigneeName}  ${DesigneePhoneNumber}  ${Pin1}  ${Pin2}  ${Pin3}  ${Pin4}  ${Pin5}  
  sleep  7s
  Wait Until Element Is Enabled   (//em[contains(text(),"Chapter 3 Status Code")]/../following-sibling::div/div/div/child::div)[3]   50s
  SeleniumLibrary.Press Keys    (//em[contains(text(),"Chapter 3 Status Code")]/../following-sibling::div/div/div/child::div)[3]  ${Chapter3StatusCode}
  Run Keyword If    '${IsFinalReturn}' == 'YES'  Click Element    //em[contains(text(),"Do not expect to file this return in the future")]
  Run Keyword If    '${IsFinalReturn}' == 'YES'  Input Text    //input[@placeholder="MM/DD/YYYY"]    12/13/2023

    IF    '${IsSection1-FederalTaxLiabily}' == 'YES'
        Input Text    ${OJan7}    ${Jan-07}
        Input Text    ${OJan15}    ${Jan-15}
        Input Text    ${OJan22}    ${Jan-22}
        Input Text    ${OJan31}    ${Jan-31}
        ${GetJan.Total}    Get value   ${OJanTotal}
        Should Be Equal  ${GetJan.Total}  ${Jan.Total}

        Input Text    ${OFeb07}    ${Feb-07}
        Input Text    ${OFeb15}    ${Feb-15}
        Input Text    ${OFeb22}    ${Feb-22}
        Input Text    ${OFeb28}    ${Feb-28}
        ${GetFeb.Total}    Get value   ${OFebTotal}
        Should Be Equal  ${GetFeb.Total}  ${Feb.Total}

        Input Text    ${OMar07}    ${Mar-07}
        Input Text    ${OMar15}    ${Mar-15}
        Input Text    ${OMar22}    ${Mar-22}
        Input Text    ${OMar31}    ${Mar-31}
        ${GetMar.Total}    Get value   ${OMarTotal}
        Should Be Equal  ${GetMar.Total}  ${Mar.Total}

        Input Text    ${OApr07}    ${Apr-07}
        Input Text    ${OApr15}    ${Apr-15}
        Input Text    ${OApr22}    ${Apr-22}
        Input Text    ${OApr30}    ${Apr-30}
        ${GetApr.Total}    Get value   ${OAprTotal}
        Should Be Equal  ${GetApr.Total}  ${Apr.Total}

        Input Text    ${OMay07}    ${May-07}
        Input Text    ${OMay15}    ${May-15}
        Input Text    ${OMay22}    ${May-22}
        Input Text    ${OMay31}    ${May-31}
        ${GetMay.Total}    Get value   ${OMayTotal}
        Should Be Equal  ${GetMay.Total}  ${May.Total}

        Input Text    ${OJune07}    ${June-07}
        Input Text    ${OJune15}    ${June-15}
        Input Text    ${OJune22}    ${June-22}
        Input Text    ${OJune30}    ${June-30}
        ${GetJune.Total}    Get value   ${OJuneTotal}
        Should Be Equal  ${GetJune.Total}  ${June.Total}

        Input Text    ${OJuly07}    ${July-07}
        Input Text    ${OJuly15}    ${July-15}
        Input Text    ${OJuly22}    ${July-22}
        Input Text    ${OJuly31}    ${July-31}
        ${GetJuly.Total}    Get value   ${OJulyTotal}
        Should Be Equal  ${GetJuly.Total}  ${July.Total}

        Input Text    ${OAug07}    ${Aug-07}
        Input Text    ${OAug15}    ${Aug-15}
        Input Text    ${OAug22}    ${Aug-22}
        Input Text    ${OAug31}    ${Aug-31}
        ${GetAug.Total}    Get value   ${OAugTotal}
        Should Be Equal  ${GetAug.Total}  ${Aug.Total}

        Input Text    ${OSep07}    ${Sept-07}
        Input Text    ${OSep15}    ${Sept-15}
        Input Text    ${OSep22}    ${Sept-22}
        Input Text    ${OSep31}    ${Sept-31}
        ${GetSept.Total}    Get value   ${OSepTotal}
        Should Be Equal  ${GetSept.Total}  ${Sept.Total}

        Input Text    ${OOct07}    ${Oct-07}
        Input Text    ${OOct15}    ${Oct-15}
        Input Text    ${OOct22}    ${Oct-22}
        Input Text    ${OOct31}    ${Oct-31}
        ${GetOct.Total}    Get value   ${OOctTotal}
        Should Be Equal  ${GetOct.Total}  ${Oct.Total}
 
        Input Text    ${ONov07}    ${Nov-07}
        Input Text    ${ONov15}    ${Nov-15}
        Input Text    ${ONov22}    ${Nov-22}
        Input Text    ${ONov30}    ${Nov-30}
        ${GetNov.Total}    Get value   ${ONovTotal}
        Should Be Equal  ${GetNov.Total}  ${Nov.Total}

        Input Text    ${ODec07}    ${Dec-07}
        Input Text    ${ODec15}    ${Dec-15}
        Input Text    ${ODec22}    ${Dec-22}
        Input Text    ${ODec31}    ${Dec-31}
        ${GetDec.Total}    Get value   ${ODecTotal}
        Should Be Equal  ${GetDec.Total}  ${Dec.Total}
    END
    sleep  2s
    Wait Until Element Is Enabled   (//em[contains(text(),"Chapter 4 Status Code")]/../following-sibling::div/div/div/child::div)[3]   50s
    SeleniumLibrary.Press Keys    (//em[contains(text(),"Chapter 4 Status Code")]/../following-sibling::div/div/div/child::div)[3]  ${Chapter4StatusCode}
    sleep  5s  
    Run Keyword If    '${Line61-OnPaper}' != 'None'   Input Text  ${OLine61Onpaper}    ${Line61-OnPaper}
    Run Keyword If    '${Line61-Electronically}' != 'None'   Input Text  ${OLine61Electronically}    ${Line61-Electronically}
    Input Text  ${OLine62a}    ${Line62a-FDAPIncome}
    Input Text  ${OLine62b1}    ${Line62b1-SubstituteDividendPayments}
    Input Text  ${OLine62b2}    ${Line62b2-SubstitutePaymentsReported}
    ${GetLine62c.Total}    Get value   ${OLine62c}
    Should Be Equal  ${GetLine62c.Total}  ${Line62c-TotalGrossAmount}
    Input Text  ${OLine62d}    ${Line62d-AcutallypaidGross}

    IF    '${IsThirdPartyDesignee}' == 'YES'
        common.JavascriptClick  ${OThirdPartyDesigneeYes}  
        Input Text  ${ODesigneeName}    ${DesigneeName}
        Input Text  ${ODesigneePhoneNumber}    ${DesigneePhoneNumber}
        Input Text  ${OPIN1}    ${Pin1}
        Input Text  ${OPIN2}    ${Pin2}
        Input Text  ${OPIN3}    ${Pin3}
        Input Text  ${OPIN4}    ${Pin4}
        Input Text  ${OPIN5}    ${Pin5}
    END
  sleep  5s
  common.JavascriptClick  ${OSaveandContinue}     	  
  sleep  5s
FormPage2-1042
  [Arguments]   ${OSec2-3}  ${OSec2-4}  ${OSec2-5}  ${OSec3-871m}  ${OSec4-QDD}  ${OSec2-1}  ${OLine71Credit}  ${OLine71Refund}  ${OSec2-2a}  ${OSec2-2b}  ${OSec2-2d}  ${OSec2-2c}  ${OSec2-2e}  ${OLine70b}  ${OLine66}  ${OLine65a}  ${OLine65b}  ${OLine68}  ${OLine66}  ${OLine67a}  ${OLine67b}  ${OLine69}  ${OLine68}  ${OLine70a}  ${OLine64e}  ${OLine64d}  ${OLine64c}  ${OLine64b}  ${OLine64a}  ${OLine63e}  ${OLine63d}  ${OLine63c2}  ${OLine63c1}  ${OLine63b2}  ${OLine63b1}  ${OLine63a}  ${Line63a}  ${Line63b1}  ${Line63b2}  ${Line63c1}  ${Line63c2}  ${Line63d}  ${Line63e}  ${Line64a}  ${Line64b}  ${Line64c}  ${Line64d}  ${Line64e}  ${Line65a}  ${Line65b}  ${Line66}  ${Line67a}  ${Line67b}  ${Line68}  ${Line69}  ${Line70a}  ${Line70b}  ${Line71}  ${OverpaymntType}  ${IsSection2}  ${IsSection2-1}  ${IsSection2-2a}  ${IsSection2-2b}  ${IsSection2-2c}  ${IsSection2-2d}  ${IsSection2-2e}  ${IsSection2-3}  ${IsSection2-4}  ${IsSection2-5}  ${IsSection2-6}  ${Section3-Section 871}  ${Section4-QDD}
    Wait Until Element Is Enabled   ${OLine63a}   50s
    Input Text  ${OLine63a}    ${Line63a}
    Input Text  ${OLine63b1}    ${Line63b1}
    Input Text  ${OLine63b2}    ${Line63b2}
    Input Text  ${OLine63c1}    ${Line63c1}
    Input Text  ${OLine63c2}    ${Line63c2}
    Input Text  ${OLine63d}    ${Line63d}
    ${GetLine63e.Total}    Get value   ${OLine63e}
    Should Be Equal  ${GetLine63e.Total}  ${Line63e}
  
    Input Text  ${OLine64a}    ${Line64a}
    Input Text  ${OLine64b}    ${Line64b}
    Input Text  ${OLine64c}    ${Line64c}
    Input Text  ${OLine64d}    ${Line64d}
    ${GetLine64e.Total}    Get value   ${OLine64e}
    Should Be Equal  ${GetLine64e.Total}  ${Line64e}

    Input Text  ${OLine65a}    ${Line65a}
    Input Text  ${OLine65b}    ${Line65b}
    Input Text  ${OLine66}    ${Line66}
    #Line67a & 67b is now not supported by US.
    # Input Text  ${OLine67a}    ${Line67a}
    # Input Text  ${OLine67b}    ${Line67b}
    ${GetLine68.Total}    Get value   ${OLine68}
    Should Be Equal  ${GetLine68.Total}  ${Line68}
    ${GetLine69.Total}    Get value   ${OLine69}
    Should Be Equal  ${GetLine69.Total}  ${Line69} 
    Execute JavaScript  window.scrollBy(0, 890)
    Run Keyword If    '${Line70a}' != '0'   Input Text  ${OLine70a}    ${Line70a}
    Run Keyword If    '${Line70b}' != '0'   Input Text  ${OLine70b}    ${Line70b}

    Run Keyword If    '${OverpaymntType}' == 'Credit'   JavascriptClick   ${OLine71Credit}
    Run Keyword If    '${OverpaymntType}' == 'Refund'   JavascriptClick   ${OLine71Refund}
  
    IF    '${IsSection2}' == 'YES'
        Input Text  ${OSec2-1}    ${IsSection2-1}
        Input Text  ${OSec2-2a}    ${IsSection2-2a}
        Input Text  ${OSec2-2b}    ${IsSection2-2b}
        Input Text  ${OSec2-2c}    ${IsSection2-2c}
        Input Text  ${OSec2-2d}    ${IsSection2-2d}
        ${GetSection2-2e.Total}    Get value   ${OSec2-2e}
        Should Be Equal  ${GetSection2-2e.Total}  ${IsSection2-2e}
        ${GetSection2-3.Total}    Get value   ${OSec2-3}
        Should Be Equal  ${GetSection2-3.Total}  ${IsSection2-3}
        ${GetSection2-4.Total}    Get value   ${OSec2-4}
        Should Be Equal  ${GetSection2-4.Total}  ${IsSection2-4} 
        ${GetSection2-5.Total}    Get value   ${OSec2-5}
        Should Be Equal  ${GetSection2-5.Total}  ${IsSection2-5}
        Input Text  //textarea[@class="v-field__input"]    ${IsSection2-6}
    END
    Run Keyword If    '${Section3-Section 871}' == 'YES'  Click Element  ${OSec3-871m}
    Run Keyword If    '${Section4-QDD}' == 'YES'  Click Element  ${OSec4-QDD}
    sleep  5s
    common.JavascriptClick  (//div[contains(@class,"justify-space-between d-flex align-center")]/button)[2] 
    sleep  5s
Form1042-IRSPayment
  [Arguments]   ${PaymentType}  ${DayTimePhone}  
    #EFW
    Run Keyword If    '${PaymentType}' == 'EFW'   Wait Until Element Is Enabled   //div[@class="v-field__input"]   15s
    Run Keyword If    '${PaymentType}' == 'EFW'   Press Keys 	 //div[@class="v-field__input"]   Saving 
    #Run Keyword If    '${PaymentType}' == 'EFW'   Click Element   //span[contains(text(),"Saving")]
    sleep   5s
    Run Keyword If    '${PaymentType}' == 'EFW'   JavascriptClick       (//label[@class="v-label v-field-label"])[4]
    sleep   2s
    Run Keyword If    '${PaymentType}' == 'EFW'   Input Text       (//label[@class="v-label v-field-label"])[4]/following-sibling::input          ${DayTimePhone}
    Run Keyword If    '${PaymentType}' == 'EFW'   Input Text       (//label[@class="v-label v-field-label"])[3]/following-sibling::input          122105155 
    sleep   2s
    Run Keyword If    '${PaymentType}' == 'EFW'   Input Text       (//label[@class="v-label v-field-label"])[2]/following-sibling::input          1234563583543 
    
    sleep   1s
    #Run Keyword If    '${PaymentType}' == 'EFW'   Click Element     	  //button[contains(text(),'Authorize')]
    #EFTPS....
    Run Keyword If    '${PaymentType}' == 'EFTPS'   Click Element     	  //div[@class="v-expansion-panels v-theme--light v-expansion-panels--variant-default accrodion-sm"]/div[2]  
    sleep   1s
    #Run Keyword If    '${PaymentType}' == 'EFTPS'   Execute Javascript  document.evaluate('${oAcceptance}', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
    Wait Until Element Is Enabled 		(//div[contains(@class,"justify-space-between d-flex align-center")]/button)[2]    		5s
    Click Element     	  (//div[contains(@class,"justify-space-between d-flex align-center")]/button)[2]
Form1042-Summary
    sleep   2s
    Wait Until Element Is Enabled 		//div[contains(@class,"justify-between d-flex align-center")]/div/button   		50s
    Click Element   //div[contains(@class,"justify-between d-flex align-center")]/div/button

Form1042-Audit
  # [Arguments]   ${ErrorInput}  ${Auditscreens}
  #   # ${Auditstatus}    Run Keyword And Return Status		Page Should Contain	${ErrorInput}
  #   # IF    '${Auditstatus}' == 'Error Messages'
  #   #   ${passed} =    Run Keyword And Return Status		Page Should Contain	${ErrorInput}
  #   #   Run Keyword If    ${passed}	Capture Page Screenshot   ${Auditscreens}
  #   #   Click Element   //a[contains(text(),'Fix Me')]
  #   # END               
    # Click Element   //button[@id='next']
    # sleep   3s
    Wait Until Element Is Enabled 		//button[contains(text(),"Continue")]   		50s
    Click Element   //button[contains(text(),"Continue")]    

Form1042-Signature
    #E-sign 8453-EMP
    # wait until element is visible   //label[@for='formentry']   10s
    # JavascriptClick  //label[@for="formentry"]  
    Wait Until Element Is Enabled		//a[@onclick="OpenEsign();"]	10s
	  Execute Javascript  document.evaluate('//a[@onclick="OpenEsign();"]', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
    Wait Until Element Is Enabled 		//label[@for="IsAgree" and contains(text()," I agree that this mark will be the electronic representation of my signature.")]    		5s
    Click Element   //label[@for="IsAgree" and contains(text()," I agree that this mark will be the electronic representation of my signature.")]  
    sleep   4s
    ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled		//button[@id='btnSave']	10s
	  sleep	3s
	  Run Keyword If    ${passed}	Execute Javascript  document.evaluate('//button[@id="btnSave"]', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
    ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled		//label[@for="SigantureConsent" and contains(text(),"Under penalties of perjury")]  
    Run Keyword If    ${passed}   JavascriptClick   //label[@for="SigantureConsent" and contains(text(),"Under penalties of perjury")]
    WaitUntilSimpleClick    //div[contains(@class,"buttonBlockN d-flex align-items-center")]/button


Form1042-Filingfees-TransmitForm
  [Arguments]   ${oCompleteFiling}  
    Wait Until Element Is Enabled		${oCompleteFiling}  10s
    common.JavascriptClick  ${oCompleteFiling}
    sleep   5s
    Execute Javascript  document.evaluate('//a[@id="addPaymentProfile"]', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
    sleep   5s
    Input Text    //input[@id='txtFirstName']    Ruth Steven
    sleep   5s
    # ${random_card}=    Evaluate    random.choice($cards)
    # Input Text    //div[@class='pos-rel']/input[@id='CardNumber']   ${random_card}
    Input Text    //div[@class='pos-rel']/input[@id='CardNumber']     4111111111111111
    JavascriptClick   //select[@id="MonthId"]
    sleep   1s
    Wait Until Element Is Enabled 	 //option[contains(text(),"January(01)")]   10s
    Click Element   //option[contains(text(),"January(01)")] 
    sleep   2s
    JavascriptClick  //select[@id="YearId"]
    sleep   1s
    Wait Until Element Is Enabled 	 //option[contains(text(),"2025")]   10s
    Click Element   //option[contains(text(),"2025")]
    sleep   2s
    Input Text    //input[@id='AuthCode']   123
    # Input Text    //input[@name='Address1']   ${WHAddress1}
    Input Text    //input[@id="City"]   Dallas
    # sleep   1s
    # Press Keys	 //select[@name='StateName']   Alabama (AL)
    # Input Text    //input[@name='Zip']    ${WHZipCode}
    sleep   1s
    Click Element   //label[contains(text(),'I confirm that I have the authority to use')]
    Click Element   //button[contains(text(),"Pay & Transmit*")]
E-SignPage1042CPA
  [Arguments]   ${E-signTypeNonBO}  ${einManual}
  IF    '${E-signTypeNonBO}' == 'Upload'
    ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled    //a[contains(text(),"Other Options")]   
    Run Keyword If    ${passed}	Execute Javascript  document.evaluate('//a[contains(text(),"Other Options")]', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();  
    Execute Javascript  document.evaluate('//input[@id="AttachFile"]', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();  
    sleep   5s
    Choose File   //input[@id='AttachFile']    ${EXECDIR}/PDF/e-sign.pdf
    sleep   1s
    Execute Javascript  document.evaluate('//label[contains(text(),"Under penalty of perjury")]', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
    Click Element     	  //input[@id="Upload8453PDF"]
    sleep   1s
    Click Element   //div[contains(@class,"buttonBlockN")]/button
  END 
  IF    '${E-signTypeNonBO}' == 'RequestE-sign'
    common.JavascriptClick    //button[@id="SendEsign"]
    sleep  5s
    Input Text       //input[@id="MailToAddress"]  puvanasri.j@spantechnologyservices.com
    Click Element   //a[@id="btnSend"]
    sleep  30s
    ${link}   email_link
    log to console    ${link}
    sleep  10s
    Open Browser    ${link}     Chrome
    sleep  10s
    Input Text       //input[@id="txtpassword"]  ${einManual}
    Click Element   //input[@id="btnContinue"]
    sleep  5s
    common.JavascriptClick  //img[@class="click2sign94x"]
    Wait Until Element Is Enabled 		//label[@for="IsAgree" and contains(text()," I agree that this mark will be the electronic representation of my signature.")]    		5s
    Click Element   //label[@for="IsAgree" and contains(text()," I agree that this mark will be the electronic representation of my signature.")]  
    sleep   4s
    ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled		//button[@id='btnSave']	10s
	  sleep	3s
	  Run Keyword If    ${passed}	Execute Javascript  document.evaluate('//button[@id="btnSave"]', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
    Click Element   //input[@value="Click to Submit"]
    ${handles}=  Get Window Handles
    #Switch Window   ${handles}[1]
    Switch Window   ${handles}[0]
    sleep  10s
    Wait Until Element Is Enabled 		//a[@onclick="refreshpage();"]    		5s
    Click Element   //a[@onclick="refreshpage();"]
    sleep  10s
    Click Element   //button[@id="PreparerSign" and contains(text(),"Click to Sign ")]
    Wait Until Element Is Enabled 		//label[@for="IsAgree" and contains(text()," I agree that this mark will be the electronic representation of my signature.")]    		5s
    Click Element   //label[@for="IsAgree" and contains(text()," I agree that this mark will be the electronic representation of my signature.")]  
    sleep   4s
    ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled		//button[@id='btnSave']	10s
	  sleep	3s
	  Run Keyword If    ${passed}	Execute Javascript  document.evaluate('//button[@id="btnSave"]', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
    Click Element   //button[contains(text(),"Next")]
  END
    #https://esignirsforms.spansprint.com//Form1042Esign/SecurityCheck/?ESignToken=b8d00bff-7fff-4720-a55f-4b73a4eabfc1

E-SignPage1042ERO
  [Arguments]   ${E-signTypeNonBO}
  IF    '${E-signTypeNonBO}' == 'Upload'
    ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled    //a[contains(text(),"Other Options")]   
    Run Keyword If    ${passed}	Execute Javascript  document.evaluate('//a[contains(text(),"Other Options")]', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();  
    Execute Javascript  document.evaluate('//input[@id="AttachFile"]', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();  
    sleep   5s
    Choose File   //input[@id='AttachFile']    ${EXECDIR}/PDF/e-sign.pdf
    sleep   1s
    #Execute Javascript  document.evaluate('//label[contains(text(),"Under penalty of perjury")]', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
    Click Element     	  //a[@id="Upload8879PDF"]
    sleep   1s
    Click Element   //button[@id="next"]
  END 

Form1042-SCHQ
  Log to console  Yet to Develop
PaymentDetails
  [Arguments]  ${start}    ${form}  ${941}  ${ocontinuefil}    ${IsVeriff}  ${VeriffProofType}  ${VeriffScreen}  ${otransmitt}  ${PayerAddress1}  ${PayerCity}  ${PayerZipCode}
          sleep   5s
          ${page} =    Run Keyword And Return Status         Wait Until Element Is Enabled		${ocontinuefil}	10s
          Click Element   ${ocontinuefil}
          sleep   5s
          Execute Javascript  document.evaluate('//a[@id="addPaymentProfile"]', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
          #${passed} =    Run Keyword AND Return Status         Wait Until Element Is Enabled       //a[@id='addPaymentProfile']    10s
	        #Run Keyword If    ${passed}    Click Element   //a[@id='addPaymentProfile'] 
          #Click Element   //a[@id='addPaymentProfile']
          sleep   5s
          #Run Keyword If    ${passed}   Input Text    //input[@id='txtFirstName']    jan
          Input Text    //input[@id='txtFirstName']    Anavup
          sleep   5s
          #Run Keyword If    ${passed}   Input Text    //div[@class='fieldset pos-rel']/input[@id='CardNumber']   3530111333300000
          Input Text    //div[@class='pos-rel']/input[@id='CardNumber']     3530111333300000
          JavascriptClick   //select[@id="MonthId"]
          sleep   1s
          Wait Until Element Is Enabled 	 //option[contains(text(),"January(01)")]   10s
          Click Element   //option[contains(text(),"January(01)")] 
          sleep   2s
          JavascriptClick  //select[@id="YearId"]
          sleep   1s
          Wait Until Element Is Enabled 	 //option[contains(text(),"2025")]   10s
          Click Element   //option[contains(text(),"2025")]
          sleep   2s
          Input Text    //input[@id='AuthCode']   123
          #Run Keyword If    ${passed}   Click Element   //button[@id='btnSave']
          Input Text    //input[@name='Address1']   ${PayerAddress1}
          Input Text    //input[@name='City']   ${PayerCity}
          sleep   1s
          Press Keys	 //select[@name='StateName']   Alabama (AL)
          Input Text    //input[@name='Zip']    ${PayerZipCode}
          sleep   1s
          Click Element   //label[contains(text(),'I confirm that I have the authority to use')]
          #Click Element   //button[@id='btnSave'] 
          Click Element   //button[contains(text(),"Pay & Transmit*")]

          Run Keyword If    '${IsVeriff}' == 'YES'  Veriff_941  ${VeriffProofType}  ${VeriffScreen}   ${start}    ${form}  ${941}



Deletereturn
  [Arguments]   ${oyear}  ${TaxYear}  ${oedetails94x}   ${Quarter}    ${Editreturn}   ${BusinessN}   ${odel}   ${BusinessName}   ${obtnsave}   ${Quarter}   ${oincomplete}
		${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       (//header[@id="header"]/div/a)[1]     10s
		Run Keyword If    ${passed}    Click Element        (//header[@id="header"]/div/a)[1]
		Sleep    2s
		Run Keyword If    ${passed}    Click Element        (//a[contains(text(),"94x")])[1]
    sleep   5s
    Wait Until Element Is Enabled 		//a[@id='liaReturnsBusiness_xs' and contains(text(),'All Returns')]    		50s
    Click Element   //a[@id='liaReturnsBusiness_xs' and contains(text(),'All Returns')]
    sleep   10s
    ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       //i[@class=" mdi mdi-menu "]     10s
    Run Keyword If    ${passed}    Execute Javascript  document.evaluate('//i[@class=" mdi mdi-menu "]', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
    sleep   3s
    Execute Javascript  document.evaluate('//li[@id="tab_AuditSucceedForms"]/a/div', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
    sleep   5s
    Wait Until Element Is Enabled 		//select[@id='94xbusinessList']    		50s
    Click Element   //select[@id='94xbusinessList']
    sleep   3s
    Click Element   //option[contains(text(),'${BusinessN}')]
    sleep   10s
    Wait Until Element Is Enabled 		(//a[contains(@onclick,'DeleteForm941Return')])[1]    		50s
    sleep   3s
    Click Element   (//a[contains(@onclick,'DeleteForm941Return')])[1]
    sleep   5s
    Execute Javascript  document.evaluate('${odel}', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
    sleep   7s
    Go To    ${oedetails94x}
    sleep   5s
    Wait Until Element Is Enabled   //span[contains(text(),'Select Employer from address book')]   50s
    Click Element   //span[contains(text(),'Select Employer from address book')]
    sleep   2s
    Wait Until Element Is Enabled   //div[@id='ListPart']/input[@id='BusinessSearch']   10s
    input text  //div[@id='ListPart']/input[@id='BusinessSearch']   ${BusinessName}
    sleep    3s
		Wait Until Element Is Enabled 		//span[contains(text(),'${BusinessName}')]    		10s
		Click Element         //span[contains(text(),'${BusinessName}')]
    sleep    3s 
	  Click Element     	  ${obtnsave}
    sleep	3s
    ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled		(//button[contains(text(),'Yes')])[1]   10s
	  Run Keyword If    ${passed}	Execute Javascript  document.evaluate('(//button[contains(text(),"Yes")])[1] ', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
    sleep	3s
    SelectYear  ${oedetails94x}  ${Editreturn}  ${oincomplete}   ${oyear}   ${Quarter}   ${BusinessN}   ${odel}   ${BusinessName}   ${obtnsave}   ${TaxYear}





TransmitForm
  [Arguments]   ${obj_Year}   ${oPayandTransmit}   ${oPaymentconfirmcheckbox}  ${PayerZipCode}   ${occStateName}   ${occForeignPayerPostalCode}    ${PayerZipCode}   ${occCountryCode}   ${occCity}   ${PayerCity}   ${occAddress2}   ${PayerAddress2}   ${occAddress1}   ${PayerAddress1}   ${occFaddress}  ${IsCCForeignAdd}   ${oAuthCode}   ${obj_CVVNum}  ${oYearId}  ${oCompleteFiling}  ${oaddPayment}  ${oCCFirstName}    ${obj_NameOnCC}  ${oCardNumber}   ${obj_CardNum}   ${oMonthId} 
  WaitUntilClick  ${ocontinuefil}
  sleep   5s
  WaitUntilClick  ${oaddPayment}
  sleep   5s
  Input Text    ${oCCFirstName}    ${obj_NameOnCC}
  Input Text    ${oCardNumber}   ${obj_CardNum}
  #Input Text    ${oCardNumber}   3530111333300000
  # Press Keys	 ${oMonthId}		January(01)
  # sleep   3s
  # Press Keys	 //select[@id="YearId"]		${obj_Year}
  #Input Text    ${oAuthCode}   ${obj_CVVNum}
  JavascriptClick   //span[@class="ui-selectmenu-text" and contains(text(),"Select Month")]
  sleep   1s
  Wait Until Element Is Enabled 	 //div[contains(text(),"January(01)")]   10s
  Click Element   //div[contains(text(),"January(01)")]
  sleep   2s
  JavascriptClick  //span[@class="ui-selectmenu-text" and contains(text(),"Select Year")]
  sleep   1s
  Wait Until Element Is Enabled 	 //div[contains(text(),"${obj_Year}")]   10s
  Click Element   //div[contains(text(),"${obj_Year}")]
  Input Text    ${oAuthCode}  ${obj_CVVNum}

  # IF    '${IsCCForeignAdd}'=='YES'
  #   JavascriptClick  ${occFaddress}
  #   Input Text    ${occAddress1}   ${PayerAddress1}
  #   Input Text    ${occAddress2}   ${PayerAddress2}
  #   Input Text    ${occCity}   ${PayerCity}
  #   sleep   1s
  #   Press Keys	 ${occCountryCode}   Canada
  #   Input Text    ${occForeignPayerPostalCode}    ${PayerZipCode}
  # ELSE
  #   Input Text    ${occAddress1}   ${PayerAddress1}
  #   Input Text    ${occAddress2}   ${PayerAddress2}
  #   Input Text    ${occCity}   ${PayerCity}
  #   sleep   1s
  #   Press Keys	 ${occStateName}   Alabama (AL)
  #   Input Text    ${occZip}    ${PayerZipCode}
  # END
  sleep   1s
  Click Element   //label[contains(text(),'I confirm that I have the authority to use')]
  Click Element   //button[contains(text(),"Pay & Transmit*")]


BuyCredits
  [Arguments]   @{cards}  
  Click Element   (//div[@role="list"]/div[2]/button)[1]/span/i
  JavascriptClick    //div[contains(@class,"v-list-item__title font-weight-medium") and contains(text(),"Credits")]
  Wait Until Element Is Enabled 	 (//span[contains(text(),"Add Credits")])[2]   10s
  Click Element   (//span[contains(text(),"Add Credits")])[2] 
  Wait Until Element Is Enabled 	 //a[contains(text(),"View Pricing")]   10s
  Click Element   //a[contains(text(),"View Pricing")]
  sleep  5s
  Click Element   //button[@id="btnOK"]
  #Data Validation + Federal E-File: Form 940, 941, 943, 944, 945
  Input Text    //input[@id="txtFederalCount"]  1
  SeleniumLibrary.Page Should Contain 	 $5.95 	  
  #Data Validation + Federal E-File: Form 940 Schedule R Clients
  Input Text    //input[@id="txt940SchRCount"]  1 
  SeleniumLibrary.Page Should Contain 	 $1.00
  #Data Validation + Federal E-File: Form 941 Schedule R Clients
  Input Text    //input[@id="txt941SchRCount"]  1 
  SeleniumLibrary.Page Should Contain 	 $0.50 
  #Data Validation + Download Copy: Form 941-X, 940 Amendment
  Input Text    //input[@id="txt94xCORCount"]  1 
  SeleniumLibrary.Page Should Contain 	 $2.99
  ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       //label[contains(text(),"Total Amount:")]        20s
  sleep  2s
  Run Keyword If    ${passed}		Page Should Contain 	 $10.44
  sleep  1s
  Click Element   //input[@id="btnProcess"]
  #CaputreScreenshot
  ${Buycreditsscreen}=			Set Variable     ../Test suite/941-2024/BuycreditsScreenshot/Buycreditsscreen.png
  Capture Page Screenshot     ${Buycreditsscreen}
  #CreditsPayment
  ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       //a[@id="addPaymentProfile"]        20s
  sleep  2s
  Run Keyword If    ${passed}		Click Element   //a[@id="addPaymentProfile"]
  sleep   5s
  #${first_name}=    Steven Milson
  Input Text    //input[@id="txtFirstName"]    Steven Milson
  ${random_card}=    Evaluate    random.choice($cards)
  Input Text    //div[@class='pos-rel']/input[@id='CardNumber']   ${random_card}
  JavascriptClick   //span[@class="ui-selectmenu-text" and contains(text(),"Select Month")]
  sleep   1s
  Wait Until Element Is Enabled 	 //div[contains(text(),"January(01)")]   10s
  Click Element   //div[contains(text(),"January(01)")]
  sleep   2s
  JavascriptClick  //span[@class="ui-selectmenu-text" and contains(text(),"Select Year")]
  sleep   1s
  Wait Until Element Is Enabled 	 //ul[@id="YearId-menu"]/li/div[contains(text(),"2025")]   10s
  Click Element     //ul[@id="YearId-menu"]/li/div[contains(text(),"2025")]  
  sleep   1s   
  Input Text    //input[@id="AuthCode"]  123

  # IF    '${IsCCForeignAdd}'=='YES'
  #   JavascriptClick  ${occFaddress}
  #   Input Text    ${occAddress1}   ${PayerAddress1}
  #   Input Text    ${occAddress2}   ${PayerAddress2}
  #   Input Text    ${occCity}   ${PayerCity}
  #   sleep   1s
  #   Press Keys	 ${occCountryCode}   Canada
  #   Input Text    ${occForeignPayerPostalCode}    ${PayerZipCode}
  # ELSE
    Input Text    //input[@name="Address1"]   123 Main ST street
    Input Text    //input[@name="Address2"]   Rose Valley
    Input Text    //input[@name="City"]   Dallas
    sleep   1s
    Press Keys	 //select[@name="StateName"]   Alabama (AL)
    Input Text    //input[@name="Zip"]    35801
  # END
  Page Should Contain 	 $10.44
  Click Element   //button[@id="btnContinue"]
  sleep  10s
  Click Element   //button[@id="btnDone" and contains(text(),"Go to Dashboard")]





  #:::::::::::::ViewPricingComparer:::::::::::
  # ${page_text}    Execute JavaScript    return document.body.innerText;
  # Log to console    ${page_text}
  # ${Notepad_File}=     Set Variable     ${CURDIR}/../Test Data/pricing.txt
  # ${notepad_content}=    Get File    ${Notepad_File}
  # ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       //button[@id="btnOK"]        20s
  # sleep  7s
  # Run Keyword If    ${passed}		Page Should Contain    ${notepad_content}
  
E-FileStaging
  [Arguments]   ${WithholdingAgentName}  ${obj_ID}
    
    Go To 	https://tbs-efile.spanstage.com/
    #Open Browser    https://tbs-efile.spanstage.com/     Chrome 

    Input Text    //input[@id="UserName"]  Spanemployee
    Input Text    //input[@id="Password"]   123123
    Click Element   //input[@value="Log On"]
    Click Element   //h2[contains(text(),"Form 1042")]

    Click Element   //a[contains(text(),"New Returns")]
    
    Input Text    //input[@placeholder="Search"]  ${WithholdingAgentName}
    sleep  5s
    Click Element   (//a[contains(text(),"Generate App Xml")])[1]
    sleep  1s
    Click Element   //a[contains(text(),"Generate IRS Xml")]
    sleep  1s
    Execute JavaScript  window.scrollBy(0, 1099)
    Click Element   //a[contains(text(),"Download IRS_XML")]
    sleep  1s
    common.JavascriptClick  //a[contains(text(),"Validate Xml Schema")]
    sleep  1s
    Click Element   //a[contains(text(),"Business Validation")]
    sleep  1s
    ${passed} =    Run Keyword And Return Status    Page Should Contain 	 Error Message 
    Run Keyword If    ${passed}		SeleniumLibrary.Capture Page Screenshot 	 filename=../../Test suite/Form1042/1042efile/${obj_ID}.png
    Click Element   //a[contains(text(),"Generate Zip")] 
    sleep  1s
    Click Element   //a[contains(text(),"Send Submission")]
    sleep  1s
    Click Element   //a[contains(text(),"Get Ack")]
    sleep  1s
    ${passed} =    Run Keyword And Return Status    Page Should Contain 	 Error Message 
    Run Keyword If    ${passed}		SeleniumLibrary.Capture Page Screenshot 	 filename=../../Test suite/Form1042/1042efile/${obj_ID}.png
    Click Element   //span[contains(text(),"Notify User Through Mail")]
    sleep  1s
    Click Element   //button[contains(text()," Change Return Status")]

    ${handles}=  Get Window Handles
    #Switch Window   ${handles}[1]
    Switch Window   ${handles}[0]
    #close Browser
    sleep  15s
    SeleniumLibrary.Go To 	 url=https://tbs-94x.spanstage.com/Form1042/Form1042AfterTransmit
    sleep  10s

PDF_Verification-TY2023
  [Arguments]   ${Line5a1C1}    ${EINno}  ${EINnumber}  ${Line6}  ${Line20}  ${Line24}  ${Line25}  ${Line26}  ${Line23}  ${Line19}  ${Line27}  ${Taxmonth1}  ${Taxmonth2}  ${Taxmonth3}  ${SendrefundforNext}  ${Line16TotLibility}  ${DepositorSemiormonthly}  ${Line15}  ${Line12}  ${Line13e}  ${Line13c}  ${Line13g}  ${Line13a}  ${Line14}  ${Line11g}  ${Line3}  ${Line11d}  ${Line10}  ${Line7}  ${Line8}  ${Line9}  ${BusinessNa}   ${PayerAddress1}  ${Line3}  ${PayerCity}  ${StatePDF}   ${PayerZipCode}   ${Quarterpdf}   ${1NoofEmp}  ${Line2}  ${Line5aC1}  ${4Nowtc}  ${Line5aC2}  ${Line5dC2}  ${Line5bC2}  ${Line5cC2}  ${Line5a1C2}  ${Line5a2C2}  ${Line5dC1}   ${Line5bC1}  ${Line5cC1}  ${Line5aC1}  ${Line5a2C1}  ${Line5e}    ${Line11b}    ${Line11a}  ${Line5f}                                                                                                            
      ${list}  filelist
      log to console  ${list}
      ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       //a[@id="showLeft"]     10s
      Run Keyword If    ${passed}    Click Element        //a[@id="showLeft"]
      Sleep    2s
      Run Keyword If    ${passed}    Click Element        (//a[contains(text(),"94x")])[1]
      sleep   5s
      Wait Until Element Is Enabled 		//a[@id='liaReturnsBusiness_xs' and contains(text(),'Returns by Employer')]    		50s
      Click Element   //a[@id='liaReturnsBusiness_xs' and contains(text(),'Returns by Employer')] 
      JavascriptClick 	 //div[@class="position-relative"]/div/div[@class="globe-part position-absolute"]
      Input Text       //input[@id="BusinessSearch"]  ${BusinessNa}
      sleep   2s
      Wait Until Element Is Enabled 		//button[contains(text(),"${BusinessNa}")]    		5s
      sleep   2s
      Click Element         //button[contains(text(),"${BusinessNa}")]  
      sleep    5s 
      Click Element   (//a[@class="dashEdit" and contains(text(),"View Summary")])[1]
      Wait Until Element Is Enabled   (//p[contains(text(),"Form 941")]/../a)[1]    10s
      Click Element   (//p[contains(text(),"Form 941")]/../a)[1] 
      sleep   20s
      ${list1}  filelist 
        log to console  ${list1}   
        sleep   20s
        ${pdfpath}  downloadedFile  ${list}  ${list1}
        log to console  ${pdfpath}  

        ${defaultdownload_location}=    Set Variable    C:/Users/STS717-PUVANASRI J/Downloads
        ${source_path}=    Set Variable    ${defaultdownload_location}/${pdfpath}
        ${currentpath_location}=    Set Variable    ${EXECDIR}/PDF_Verification
        Remove Files    ${currentpath_location}/*.pdf
        Remove Directory    ${currentpath_location}
        Create Directory    ${currentpath_location}
        Move File    ${source_path}    ${currentpath_location}
        ${pdf_location}=    Set Variable    ${currentpath_location}/${pdfpath}
        ${pdf_values}=    pdfreaderq    ${pdf_location}
        log to console  ${pdf_values}

      ${EINnumber} =    Set Variable    ${EINno}
        ${vtxt941EIN1}=    Get From Dictionary   ${pdf_values}   txt941EIN1
        ${vtxt941EIN2}=    Get From Dictionary   ${pdf_values}   txt941EIN2
        ${vtxt941EIN3}=    Get From Dictionary   ${pdf_values}   txt941EIN3
        ${vtxt941EIN4}=    Get From Dictionary   ${pdf_values}   txt941EIN4
        ${vtxt941EIN5}=    Get From Dictionary   ${pdf_values}   txt941EIN5
        ${vtxt941EIN6}=    Get From Dictionary   ${pdf_values}   txt941EIN6
        ${vtxt941EIN7}=    Get From Dictionary   ${pdf_values}   txt941EIN7
        ${vtxt941EIN8}=    Get From Dictionary   ${pdf_values}   txt941EIN8
        ${vtxt941EIN9}=    Get From Dictionary   ${pdf_values}   txt941EIN9

        ${vtxt941EmpName2}=    Get From Dictionary   ${pdf_values}   txt941EmpName2
        ${vtxt941EmpName}=    Get From Dictionary   ${pdf_values}   txt941EmpName
        Run Keyword If  '${vtxt941EmpName}'!='${Empty}'   Should Be Equal    ${vtxt941EmpName}   ${BusinessNa}
        ${vtxt941FullAddress}=    Get From Dictionary   ${pdf_values}   txt941FullAddress
        Run Keyword If  '${vtxt941FullAddress}'!='${Empty}'   Should Be Equal    ${vtxt941FullAddress}   ${PayerAddress1}
        ${vtxt941City}=    Get From Dictionary   ${pdf_values}   txt941City
        Run Keyword If  '${vtxt941City}'!='${Empty}'   Should Be Equal    ${vtxt941City}    ${PayerCity}
        ${vtxt941State}=    Get From Dictionary   ${pdf_values}   txt941State
        Run Keyword If  '${vtxt941State}'!='${Empty}'   Should Be Equal    ${vtxt941State}   ${StatePDF}
        ${vtxt941ZipCode}=    Get From Dictionary   ${pdf_values}   txt941ZipCode
        Run Keyword If  '${vtxt941ZipCode}'!='${Empty}'   Compare Zip Codes   ${vtxt941ZipCode}   ${PayerZipCode}
        ${vtxt941ForeignCountryName}=    Get From Dictionary   ${pdf_values}   txt941ForeignCountryName
        ${vtxt941ForeignProvince}=    Get From Dictionary   ${pdf_values}   txt941ForeignProvince
        log to console  ${vtxt941ForeignProvince}
        ${vtxt941TradeName}=    Get From Dictionary   ${pdf_values}   txt941TradeName

        ${vchk941Quater2}=    Get From Dictionary   ${pdf_values}   chk941Quater2
        Run Keyword If  '${vchk941Quater2}'!='None'   Should Be Equal    ${vchk941Quater2}    ${Quarterpdf}
        ${vchk941Quater3}=    Get From Dictionary   ${pdf_values}   chk941Quater3
        Run Keyword If  '${vchk941Quater3}'!='None'   Should Be Equal    ${vchk941Quater3}    ${Quarterpdf}
        ${vchk941Quater4}=    Get From Dictionary   ${pdf_values}   chk941Quater4
        Run Keyword If  '${vchk941Quater4}'!='None'   Should Be Equal    ${vchk941Quater4}    ${Quarterpdf}
        #Line1
        ${vtxt941Line1}=    Get From Dictionary   ${pdf_values}   txt941Line1
        Run Keyword If  '${vtxt941Line1}'!='None'   Should Be Equal    ${vtxt941Line1}    ${1NoofEmp}
        #Line3
        ${vtxt941Line3Cents}=    Get From Dictionary   ${pdf_values}   txt941Line3Cents
        ${vtxt941Line3Dollers}=    Get From Dictionary   ${pdf_values}   txt941Line3Dollers
        ${original_numberl3}    Set Variable    ${Line3}
        ${number_stringl3}    Convert To String    ${original_numberl3}
        ${lengthl3}    Get Length    ${number_stringl3}
        ${last_two_indexl3}    Evaluate    ${lengthl3}-2
        ${last_two_digitsl3}    Get Substring    ${number_stringl3}    ${last_two_indexl3}    ${lengthl3}
        ${other_digitsl3Dot}    Get Substring    ${number_stringl3}    0    ${last_two_indexl3}
        ${other_digitsl3}    Replace String    ${other_digitsl3Dot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line3Cents}'!='${Empty}'   Should Be Equal    ${vtxt941Line3Cents}    ${last_two_digitsl3}
        Run Keyword If  '${vtxt941Line3Dollers}'!='${Empty}'   Should Be Equal    ${vtxt941Line3Dollers}    ${other_digitsl3}
        #Line2
        ${vtxt941Line2Dollers}=    Get From Dictionary   ${pdf_values}   txt941Line2Dollers
        ${vtxt941Line2Cents}=    Get From Dictionary   ${pdf_values}   txt941Line2Cents
        ${original_numberl2}    Set Variable    ${Line2}
        ${number_stringl2}    Convert To String    ${original_numberl2}
        ${lengthl2}    Get Length    ${number_stringl2}
        ${last_two_indexl2}    Evaluate    ${lengthl2}-2
        ${last_two_digitsl2}    Get Substring    ${number_stringl2}    ${last_two_indexl2}    ${lengthl2}
        ${other_digitsl2Dot}    Get Substring    ${number_stringl2}    0    ${last_two_indexl2}
        ${other_digitsl2}    Replace String    ${other_digitsl2Dot}    .    ${EMPTY}        
        Run Keyword If  '${vtxt941Line2Cents}'!='${Empty}'   Should Be Equal    ${vtxt941Line2Cents}    ${last_two_digitsl2}
        Run Keyword If  '${vtxt941Line2Dollers}'!='${Empty}'   Should Be Equal    ${vtxt941Line2Dollers}    ${other_digitsl2}
        #Line5a
        ${vtxt941Line5aDollers}=    Get From Dictionary   ${pdf_values}   txt941Line5aDollers    
        ${vtxt941Line5aCents}=    Get From Dictionary   ${pdf_values}   txt941Line5aCents
        ${original_numberl5a}    Set Variable    ${Line5aC1}
        ${number_stringl5a}    Convert To String    ${original_numberl5a}
        ${lengthl5a}    Get Length    ${number_stringl5a}
        ${last_two_indexl5a}    Evaluate    ${lengthl5a}-2
        ${last_two_digitsl5a}    Get Substring    ${number_stringl5a}    ${last_two_indexl5a}    ${lengthl5a}
        ${other_digitsl5aDot}    Get Substring    ${number_stringl5a}    0    ${last_two_indexl5a}
        ${other_digitsl5a}    Replace String    ${other_digitsl5aDot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line5aCents}'!='${Empty}'   Should Be Equal    ${vtxt941Line5aCents}    ${last_two_digitsl5a}
        Run Keyword If  '${vtxt941Line5aDollers}'!='${Empty}'   Should Be Equal    ${vtxt941Line5aDollers}    ${other_digitsl5a}
        #Line4
        ${vchk941Line4}=    Get From Dictionary   ${pdf_values}   chk941Line4
        Run Keyword If  '${vchk941Line4}'!='None'   Should Be Equal    ${vchk941Line4}    ${4Nowtc}
        #Line5ac2
        ${vtxt941Line5aTotalCents}=    Get From Dictionary   ${pdf_values}   txt941Line5aTotalCents
        ${vtxt941Line5aTotalDollers}=    Get From Dictionary   ${pdf_values}   txt941Line5aTotalDollers
        ${original_numberl5aT}    Set Variable    ${Line5aC2}
        ${number_stringl5aT}    Convert To String    ${original_numberl5aT}
        ${lengthl5aT}    Get Length    ${number_stringl5aT}
        ${last_two_indexl5aT}    Evaluate    ${lengthl5aT}-2
        ${last_two_digitsl5aT}    Get Substring    ${number_stringl5aT}    ${last_two_indexl5aT}    ${lengthl5aT}
        ${other_digitsl5aTDot}    Get Substring    ${number_stringl5aT}    0    ${last_two_indexl5aT}
        ${other_digitsl5aT}    Replace String    ${other_digitsl5aTDot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line5aTotalCents}'!='${Empty}'   Should Be Equal    ${vtxt941Line5aTotalCents}    ${last_two_digitsl5aT}
        Run Keyword If  '${vtxt941Line5aTotalDollers}'!='${Empty}'   Should Be Equal    ${vtxt941Line5aTotalDollers}    ${other_digitsl5aT}
        #Line5dc2
        ${vtxt941Line5dTotalCents}=    Get From Dictionary   ${pdf_values}  txt941Line5dTotalCents
        ${vtxt941Line5dTotalDollers}=    Get From Dictionary   ${pdf_values}   txt941Line5dTotalDollers
        ${original_numberl5dt}    Set Variable    ${Line5dC2}
        ${number_stringl5dt}    Convert To String    ${original_numberl5dt}
        ${lengthl5dt}    Get Length    ${number_stringl5dt}
        ${last_two_indexl5dt}    Evaluate    ${lengthl5dt}-2
        ${last_two_digitsl5dt}    Get Substring    ${number_stringl5dt}    ${last_two_indexl5dt}    ${lengthl5dt}
        ${other_digitsl5dtDot}    Get Substring    ${number_stringl5dt}    0    ${last_two_indexl5dt}
        ${other_digitsl5dt}    Replace String    ${other_digitsl5dtDot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line5dTotalCents}'!='${Empty}'   Should Be Equal    ${vtxt941Line5dTotalCents}    ${last_two_digitsl5dt}
        Run Keyword If  '${vtxt941Line5dTotalDollers}'!='${Empty}'   Should Be Equal    ${vtxt941Line5dTotalDollers}    ${other_digitsl5dt}
        #Line5bc2
        ${vtxt941Line5bTotalCents}=    Get From Dictionary   ${pdf_values}   txt941Line5bTotalCents
        ${vtxt941Line5bTotalDollers}=    Get From Dictionary   ${pdf_values}  txt941Line5bTotalDollers
        ${original_numberl5bt}    Set Variable    ${Line5bC2}
        ${number_stringl5bt}    Convert To String    ${original_numberl5bt}
        ${lengthl5bt}    Get Length    ${number_stringl5bt}
        ${last_two_indexl5bt}    Evaluate    ${lengthl5bt}-2
        ${last_two_digitsl5bt}    Get Substring    ${number_stringl5bt}    ${last_two_indexl5bt}    ${lengthl5bt}
        ${other_digitsl5btDot}    Get Substring    ${number_stringl5bt}    0    ${last_two_indexl5bt}
        ${other_digitsl5bt}    Replace String    ${other_digitsl5btDot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line5bTotalCents}'!='${Empty}'   Should Be Equal    ${vtxt941Line5bTotalCents}    ${last_two_digitsl5bt}
        Run Keyword If  '${vtxt941Line5bTotalDollers}'!='${Empty}'   Should Be Equal    ${vtxt941Line5bTotalDollers}    ${other_digitsl5bt}
        #Line5cc2
        ${vtxt941Line5cTotalCents}=    Get From Dictionary   ${pdf_values}   txt941Line5cTotalCents
        ${vtxt941Line5cTotalDollers}=    Get From Dictionary   ${pdf_values}   txt941Line5cTotalDollers 
        ${original_numberl5ct}    Set Variable    ${Line5cC2}
        ${number_stringl5ct}    Convert To String    ${original_numberl5ct}
        ${lengthl5ct}    Get Length    ${number_stringl5ct}
        ${last_two_indexl5ct}    Evaluate    ${lengthl5ct}-2
        ${last_two_digitsl5ct}    Get Substring    ${number_stringl5ct}    ${last_two_indexl5ct}    ${lengthl5ct}
        ${other_digitsl5ctDot}    Get Substring    ${number_stringl5ct}    0    ${last_two_indexl5ct}
        ${other_digitsl5ct}    Replace String    ${other_digitsl5ctDot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line5cTotalCents}'!='${Empty}'   Should Be Equal    ${vtxt941Line5cTotalCents}    ${last_two_digitsl5ct}
        Run Keyword If  '${vtxt941Line5cTotalDollers}'!='${Empty}'   Should Be Equal    ${vtxt941Line5cTotalDollers}    ${other_digitsl5ct}
        #Line5a1c2
        ${vtxt941Line5a1TotalCents}=    Get From Dictionary   ${pdf_values}   txt941Line5a1TotalCents 
        ${vtxt941Line5a1TotalDollers}=    Get From Dictionary   ${pdf_values}   txt941Line5a1TotalDollers 
        ${original_numberl5a1t}    Set Variable    ${Line5a1C2}
        ${number_stringl5a1t}    Convert To String    ${original_numberl5a1t}
        ${lengthl5a1t}    Get Length    ${number_stringl5a1t}
        ${last_two_indexl5a1t}    Evaluate    ${lengthl5a1t}-2
        ${last_two_digitsl5a1t}    Get Substring    ${number_stringl5a1t}    ${last_two_indexl5a1t}    ${lengthl5a1t}
        ${other_digitsl5a1tDot}    Get Substring    ${number_stringl5a1t}    0    ${last_two_indexl5a1t}
        ${other_digitsl5a1t}    Replace String    ${other_digitsl5a1tDot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line5a1TotalCents}'!='${Empty}'   Should Be Equal    ${vtxt941Line5a1TotalCents}    ${last_two_digitsl5a1t}
        Run Keyword If  '${vtxt941Line5a1TotalDollers}'!='${Empty}'   Should Be Equal    ${vtxt941Line5a1TotalDollers}    ${other_digitsl5a1t}
        #Line5a2c2
        ${vtxt941Line5a2TotalCents}=    Get From Dictionary   ${pdf_values}   txt941Line5a2TotalCents
        ${vtxt941Line5a2TotalDollers}=    Get From Dictionary   ${pdf_values}   txt941Line5a2TotalDollers
        ${original_numberl5a2t}    Set Variable    ${Line5a2C2}
        ${number_stringl5a2t}    Convert To String    ${original_numberl5a2t}
        ${lengthl5a2t}    Get Length    ${number_stringl5a2t}
        ${last_two_indexl5a2t}    Evaluate    ${lengthl5a2t}-2
        ${last_two_digitsl5a2t}    Get Substring    ${number_stringl5a2t}    ${last_two_indexl5a2t}    ${lengthl5a2t}
        ${other_digitsl5a2tDot}    Get Substring    ${number_stringl5a2t}    0    ${last_two_indexl5a2t}
        ${other_digitsl5a2t}    Replace String    ${other_digitsl5a2tDot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line5a2TotalCents}'!='${Empty}'   Should Be Equal    ${vtxt941Line5a2TotalCents}    ${last_two_digitsl5a2t}
        Run Keyword If  '${vtxt941Line5a2TotalDollers}'!='${Empty}'   Should Be Equal    ${vtxt941Line5a2TotalDollers}    ${other_digitsl5a2t}
        #Line5d
        ${vtxt941Line5dDollers}=    Get From Dictionary   ${pdf_values}   txt941Line5dDollers
        ${vtxt941Line5dCents}=    Get From Dictionary   ${pdf_values}   txt941Line5dCents
        ${original_numberl5d}    Set Variable    ${Line5dC1}
        ${number_stringl5d}    Convert To String    ${original_numberl5d}
        ${lengthl5d}    Get Length    ${number_stringl5d}
        ${last_two_indexl5d}    Evaluate    ${lengthl5d}-2
        ${last_two_digitsl5d}    Get Substring    ${number_stringl5d}    ${last_two_indexl5d}    ${lengthl5d}
        ${other_digitsl5dDot}    Get Substring    ${number_stringl5d}    0    ${last_two_indexl5d}
        ${other_digitsl5d}    Replace String    ${other_digitsl5dDot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line5dCents}'!='${Empty}'   Should Be Equal    ${vtxt941Line5dCents}    ${last_two_digitsl5d}
        Run Keyword If  '${vtxt941Line5dDollers}'!='${Empty}'   Should Be Equal    ${vtxt941Line5dDollers}    ${other_digitsl5d}
        #Line5b
        ${vtxt941Line5bDollers}=    Get From Dictionary   ${pdf_values}   txt941Line5bDollers
        ${vtxt941Line5bCents}=    Get From Dictionary   ${pdf_values}   txt941Line5bCents    
        ${original_numberl5b}    Set Variable    ${Line5bC1}
        ${number_stringl5b}    Convert To String    ${original_numberl5b}
        ${lengthl5b}    Get Length    ${number_stringl5b}
        ${last_two_indexl5b}    Evaluate    ${lengthl5b}-2
        ${last_two_digitsl5b}    Get Substring    ${number_stringl5b}    ${last_two_indexl5b}    ${lengthl5b}
        ${other_digitsl5bDot}    Get Substring    ${number_stringl5b}    0    ${last_two_indexl5b}
        ${other_digitsl5b}    Replace String    ${other_digitsl5bDot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line5bCents}'!='${Empty}'   Should Be Equal    ${vtxt941Line5bCents}    ${last_two_digitsl5b}
        Run Keyword If  '${vtxt941Line5bDollers}'!='${Empty}'   Should Be Equal    ${vtxt941Line5bDollers}    ${other_digitsl5b}
        #Line5c
        ${vtxt941Line5cDollers}=    Get From Dictionary   ${pdf_values}   txt941Line5cDollers
        ${vtxt941Line5cCents}=    Get From Dictionary   ${pdf_values}   txt941Line5cCents
        ${original_numberl5c}    Set Variable    ${Line5cC1}
        ${number_stringl5c}    Convert To String    ${original_numberl5c}
        ${lengthl5c}    Get Length    ${number_stringl5c}
        ${last_two_indexl5c}    Evaluate    ${lengthl5c}-2
        ${last_two_digitsl5c}    Get Substring    ${number_stringl5c}    ${last_two_indexl5c}    ${lengthl5c}
        ${other_digitsl5cDot}    Get Substring    ${number_stringl5c}    0    ${last_two_indexl5c}
        ${other_digitsl5c}    Replace String    ${other_digitsl5cDot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line5cCents}'!='${Empty}'   Should Be Equal    ${vtxt941Line5cCents}    ${last_two_digitsl5c}
        Run Keyword If  '${vtxt941Line5cDollers}'!='${Empty}'   Should Be Equal    ${vtxt941Line5cDollers}    ${other_digitsl5c}
        #Line5a1       
        ${vtxt941Line5a1Cents}=    Get From Dictionary   ${pdf_values}   txt941Line5a1Cents
        ${vttxt941Line5a1Dollers}=    Get From Dictionary   ${pdf_values}   txt941Line5a1Dollers
        ${original_numberl5a1}    Set Variable    ${Line5a1C1}
        ${number_stringl5a1}    Convert To String    ${original_numberl5a1}
        ${lengthl5a1}    Get Length    ${number_stringl5a1}
        ${last_two_indexl5a1}    Evaluate    ${lengthl5a1}-2
        ${last_two_digitsl5a1}    Get Substring    ${number_stringl5a1}    ${last_two_indexl5a1}    ${lengthl5a1}
        ${other_digitsl5a1Dot}    Get Substring    ${number_stringl5a1}    0    ${last_two_indexl5a1}
        ${other_digitsl5a1}    Replace String    ${other_digitsl5a1Dot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line5a1Cents}'!='${Empty}'   Should Be Equal    ${vtxt941Line5a1Cents}    ${last_two_digitsl5a1}
        Run Keyword If  '${vttxt941Line5a1Dollers}'!='${Empty}'   Should Be Equal    ${vttxt941Line5a1Dollers}    ${other_digitsl5a1}
        #Line5a2
        ${vtxt941Line5a2Dollers}=    Get From Dictionary   ${pdf_values}   txt941Line5a2Dollers
        ${vtxt941Line5a2Cents}=    Get From Dictionary   ${pdf_values}   txt941Line5a2Cents     
        ${original_numberl5a2}    Set Variable    ${Line5a2C1}
        ${number_stringl5a2}    Convert To String    ${original_numberl5a2}
        ${lengthl5a2}    Get Length    ${number_stringl5a2}
        ${last_two_indexl5a2}    Evaluate    ${lengthl5a2}-2
        ${last_two_digitsl5a2}    Get Substring    ${number_stringl5a2}    ${last_two_indexl5a2}    ${lengthl5a2}
        ${other_digitsl5a2Dot}    Get Substring    ${number_stringl5a2}    0    ${last_two_indexl5a2}
        ${other_digitsl5a2}    Replace String    ${other_digitsl5a2Dot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line5a2Cents}'!='${Empty}'   Should Be Equal    ${vtxt941Line5a2Cents}    ${last_two_digitsl5a2}
        Run Keyword If  '${vtxt941Line5a2Dollers}'!='${Empty}'   Should Be Equal    ${vtxt941Line5a2Dollers}    ${other_digitsl5a2}
        #Line5e
        ${vtxt941Line5eDollers}=    Get From Dictionary   ${pdf_values}   txt941Line5eDollers
        ${vtxt941Line5eCents}=    Get From Dictionary   ${pdf_values}   txt941Line5eCents
        ${original_numberl5e}    Set Variable    ${Line5e}
        ${number_stringl5e}    Convert To String    ${original_numberl5e}
        ${lengthl5e}    Get Length    ${number_stringl5e}
        ${last_two_indexl5e}    Evaluate    ${lengthl5e}-2
        ${last_two_digitsl5e}    Get Substring    ${number_stringl5e}    ${last_two_indexl5e}    ${lengthl5e}
        ${other_digitsl5eDot}    Get Substring    ${number_stringl5e}    0    ${last_two_indexl5e}
        ${other_digitsl5e}    Replace String    ${other_digitsl5eDot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line5eCents}'!='${Empty}'   Should Be Equal    ${vtxt941Line5eCents}    ${last_two_digitsl5e}
        Run Keyword If  '${vtxt941Line5eDollers}'!='${Empty}'   Should Be Equal    ${vtxt941Line5eDollers}    ${other_digitsl5e}
        #Line11b
        ${vtxt941Line11bCents}=    Get From Dictionary   ${pdf_values}   txt941Line11bCents
        ${vtxt941Line11bDollers}=    Get From Dictionary   ${pdf_values}   txt941Line11bDollers
        ${original_numberl11b}    Set Variable    ${Line11b}
        ${number_stringl11b}    Convert To String    ${original_numberl11b}
        ${lengthl11b}    Get Length    ${number_stringl11b}
        ${last_two_indexl11b}    Evaluate    ${lengthl11b}-2
        ${last_two_digitsl11b}    Get Substring    ${number_stringl11b}    ${last_two_indexl11b}    ${lengthl11b}
        ${other_digitsl11bDot}    Get Substring    ${number_stringl11b}    0    ${last_two_indexl11b}
        ${other_digitsl11b}    Replace String    ${other_digitsl11bDot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line11bCents}'!='${Empty}'   Should Be Equal    ${vtxt941Line11bCents}    ${last_two_digitsl11b}
        Run Keyword If  '${vtxt941Line11bDollers}'!='${Empty}'   Should Be Equal    ${vtxt941Line11bDollers}    ${other_digitsl11b}
        #Line11a
        ${vtxt941Line11Cents}=    Get From Dictionary   ${pdf_values}   txt941Line11Cents
        ${vtxt941Line11Dollers}=    Get From Dictionary   ${pdf_values}   txt941Line11Dollers
        ${original_numberl11}    Set Variable    ${Line11a}
        ${number_stringl11}    Convert To String    ${original_numberl11}
        ${lengthl11}    Get Length    ${number_stringl11}
        ${last_two_indexl11}    Evaluate    ${lengthl11}-2
        ${last_two_digitsl11}    Get Substring    ${number_stringl11}    ${last_two_indexl11}    ${lengthl11}
        ${other_digitsl11Dot}    Get Substring    ${number_stringl11}    0    ${last_two_indexl11}
        ${other_digitsl11}    Replace String    ${other_digitsl11Dot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line11Cents}'!='None'   Should Be Equal    ${vtxt941Line11Cents}    ${last_two_digitsl11}
        Run Keyword If  '${vtxt941Line11Dollers}'!='None'   Should Be Equal    ${vtxt941Line11Dollers}    ${other_digitsl11}
        #Line5f
        ${vtxt941Line5fDollers}=    Get From Dictionary   ${pdf_values}  txt941Line5fDollers
        ${vtxt941Line5fCents}=    Get From Dictionary   ${pdf_values}   txt941Line5fCents
        ${original_numberl5f}    Set Variable    ${Line5f}
        ${number_stringl5f}    Convert To String    ${original_numberl5f}
        ${lengthl5f}    Get Length    ${number_stringl5f}
        ${last_two_indexl5f}    Evaluate    ${lengthl5f}-2
        ${last_two_digitsl5f}    Get Substring    ${number_stringl5f}    ${last_two_indexl5f}    ${lengthl5f}
        ${other_digitsl5fDot}    Get Substring    ${number_stringl5f}    0    ${last_two_indexl5f}
        ${other_digitsl5f}    Replace String    ${other_digitsl5fDot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line5fCents}'!='${Empty}'   Should Be Equal    ${vtxt941Line5fCents}    ${last_two_digitsl5f}
        Run Keyword If  '${vtxt941Line5fDollers}'!='${Empty}'   Should Be Equal    ${vtxt941Line5fDollers}    ${other_digitsl5f}
        #Line6
        ${vtxt941Line6Dollers}=    Get From Dictionary   ${pdf_values}   txt941Line6Dollers
        ${vtxt941Line6Cents}=    Get From Dictionary   ${pdf_values}   txt941Line6Cents
        ${original_numberl6}    Set Variable    ${Line6}
        ${number_stringl6}    Convert To String    ${original_numberl6}
        ${lengthl6}    Get Length    ${number_stringl6}
        ${last_two_indexl6}    Evaluate    ${lengthl6}-2
        ${last_two_digitsl6}    Get Substring    ${number_stringl6}    ${last_two_indexl6}    ${lengthl6}
        ${other_digitsl6Dot}    Get Substring    ${number_stringl6}    0    ${last_two_indexl6}
        ${other_digitsl6}    Replace String    ${other_digitsl6Dot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line6Cents}'!='${Empty}'   Should Be Equal    ${vtxt941Line6Cents}    ${last_two_digitsl6}
        Run Keyword If  '${vtxt941Line6Dollers}'!='${Empty}'   Should Be Equal    ${vtxt941Line6Dollers}    ${other_digitsl6}        
        #Line7
        ${vtxt941Line7Dollers}=    Get From Dictionary   ${pdf_values}   txt941Line7Dollers
        ${vtxt941Line7Cents}=    Get From Dictionary   ${pdf_values}   txt941Line7Cents
        ${original_numberl7}    Set Variable    ${Line7}
        ${number_stringl7}    Convert To String    ${original_numberl7}
        ${lengthl7}    Get Length    ${number_stringl7}
        ${last_two_indexl7}    Evaluate    ${lengthl7}-2
        ${last_two_digitsl7}    Get Substring    ${number_stringl7}    ${last_two_indexl7}    ${lengthl7}
        ${other_digitsl7Dot}    Get Substring    ${number_stringl7}    0    ${last_two_indexl7}
        ${other_digitsl7}    Replace String    ${other_digitsl7Dot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line7Cents}'!='${Empty}'   Should Be Equal    ${vtxt941Line7Cents}    ${last_two_digitsl7}
        Run Keyword If  '${vtxt941Line7Dollers}'!='${Empty}'   Should Be Equal    ${vtxt941Line7Dollers}    ${other_digitsl7}        
        #Line8
        ${vtxt941Line8Dollers}=    Get From Dictionary   ${pdf_values}   txt941Line8Dollers
        ${vtxt941Line8Cents}=    Get From Dictionary   ${pdf_values}   txt941Line8Cents
        ${original_numberl8}    Set Variable    ${Line8}
        ${number_stringl8}    Convert To String    ${original_numberl8}
        ${lengthl8}    Get Length    ${number_stringl8}
        ${last_two_indexl8}    Evaluate    ${lengthl8}-2
        ${last_two_digitsl8}    Get Substring    ${number_stringl8}    ${last_two_indexl8}    ${lengthl8}
        ${other_digitsl8Dot}    Get Substring    ${number_stringl8}    0    ${last_two_indexl8}
        ${other_digitsl8}    Replace String    ${other_digitsl8Dot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line8Cents}'!='${Empty}'   Should Be Equal    ${vtxt941Line8Cents}    ${last_two_digitsl8}
        Run Keyword If  '${vtxt941Line8Dollers}'!='${Empty}'   Should Be Equal    ${vtxt941Line8Dollers}    ${other_digitsl8}       
        #Line9
        ${vtxt941Line9Dollers}=    Get From Dictionary   ${pdf_values}  txt941Line9Dollers
        ${vtxt941Line9Cents}=    Get From Dictionary   ${pdf_values}   txt941Line9Cents
        ${original_numberl9}    Set Variable    ${Line9}
        ${number_stringl9}    Convert To String    ${original_numberl9}
        ${lengthl9}    Get Length    ${number_stringl9}
        ${last_two_indexl9}    Evaluate    ${lengthl9}-2
        ${last_two_digitsl9}    Get Substring    ${number_stringl9}    ${last_two_indexl9}    ${lengthl9}
        ${other_digitsl9Dot}    Get Substring    ${number_stringl9}    0    ${last_two_indexl9}
        ${other_digitsl9}    Replace String    ${other_digitsl9Dot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line9Cents}'!='${Empty}'   Should Be Equal    ${vtxt941Line9Cents}    ${last_two_digitsl9}
        Run Keyword If  '${vtxt941Line9Dollers}'!='${Empty}'   Should Be Equal    ${vtxt941Line9Dollers}    ${other_digitsl9}
        #Line10
        ${vtxt941Line10Dollers}=    Get From Dictionary   ${pdf_values}   txt941Line10Dollers
        ${vtxt941Line10Cents}=    Get From Dictionary   ${pdf_values}   txt941Line10Cents
        ${original_numberl10}    Set Variable    ${Line10}
        ${number_stringl10}    Convert To String    ${original_numberl10}
        ${lengthl10}    Get Length    ${number_stringl10}
        ${last_two_indexl10}    Evaluate    ${lengthl10}-2
        ${last_two_digitsl10}    Get Substring    ${number_stringl10}    ${last_two_indexl10}    ${lengthl10}
        ${other_digitsl10Dot}    Get Substring    ${number_stringl10}    0    ${last_two_indexl10}
        ${other_digitsl10}    Replace String    ${other_digitsl10Dot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line10Cents}'!='${Empty}'   Should Be Equal    ${vtxt941Line10Cents}    ${last_two_digitsl10}
        Run Keyword If  '${vtxt941Line10Dollers}'!='${Empty}'   Should Be Equal    ${vtxt941Line10Dollers}    ${other_digitsl10}

        ${vtxt941EmpName2}=    Get From Dictionary   ${pdf_values}   txt941EmpName2
        Run Keyword If  '${vtxt941EmpName2}'!='${Empty}'   Should Be Equal    ${vtxt941EmpName2}    ${BusinessNa}
        ${vtxt941EINNumber}=    Get From Dictionary   ${pdf_values}   txt941EINNumber
        Run Keyword If  '${vtxt941EINNumber}'!='${Empty}'   Should Be Equal    ${vtxt941EINNumber}    ${EINno} 
        #Line11d
        ${vtxt941Line11dCents}=    Get From Dictionary   ${pdf_values}   txt941Line11dCents
        ${vtxt941Line11dDollers}=    Get From Dictionary   ${pdf_values}  txt941Line11dDollers
        ${original_numberl11d}    Set Variable    ${Line11d}
        ${number_stringl11d}    Convert To String    ${original_numberl11d}
        ${lengthl11d}    Get Length    ${number_stringl11d}
        ${last_two_indexl11d}    Evaluate    ${lengthl11d}-2
        ${last_two_digitsl11d}    Get Substring    ${number_stringl11d}    ${last_two_indexl11d}    ${lengthl11d}
        ${other_digitsl11dDot}    Get Substring    ${number_stringl11d}    0    ${last_two_indexl11d}
        ${other_digitsl11d}    Replace String    ${other_digitsl11dDot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line11dCents}'!='None'   Should Be Equal    ${vtxt941Line11dCents}    ${last_two_digitsl11d}
        Run Keyword If  '${vtxt941Line11dDollers}'!='None'   Should Be Equal    ${vtxt941Line11dDollers}    ${other_digitsl11d}        
        #Line11e
        ${vtxt941Line11eCents}=    Get From Dictionary   ${pdf_values}   txt941Line11eCents
        ${vtxt941Line11eDollers}=    Get From Dictionary   ${pdf_values}   txt941Line11eDollers
        ${original_numberl11e}    Set Variable    ${Line3}
        ${number_stringl11e}    Convert To String    ${original_numberl11e}
        ${lengthl11e}    Get Length    ${number_stringl11e}
        ${last_two_indexl11e}    Evaluate    ${lengthl11e}-2
        ${last_two_digitsl11e}    Get Substring    ${number_stringl11e}    ${last_two_indexl11e}    ${lengthl11e}
        ${other_digitsl11eDot}    Get Substring    ${number_stringl11e}    0    ${last_two_indexl11e}
        ${other_digitsl11e}    Replace String    ${other_digitsl11eDot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line11eCents}'!='None'   Should Be Equal    ${vtxt941Line11eCents}    ${last_two_digitsl11e}
        Run Keyword If  '${vtxt941Line11eDollers}'!='None'   Should Be Equal    ${vtxt941Line11eDollers}    ${other_digitsl11e}

        ${vtxt941Line11f}=    Get From Dictionary   ${pdf_values}   txt941Line11f

        ${vtxt941Line11gDollers}=    Get From Dictionary   ${pdf_values}   txt941Line11gDollers
        ${vtxt941Line11gCents}=    Get From Dictionary   ${pdf_values}   txt941Line11gCents
        ${original_numberl11g}    Set Variable    ${Line11g}
        ${number_stringl11g}    Convert To String    ${original_numberl11g}
        ${lengthl11g}    Get Length    ${number_stringl11g}
        ${last_two_indexl11g}    Evaluate    ${lengthl11g}-2
        ${last_two_digitsl11g}    Get Substring    ${number_stringl11g}    ${last_two_indexl11g}    ${lengthl11g}
        ${other_digitsl11gDot}    Get Substring    ${number_stringl11g}    0    ${last_two_indexl11g}
        ${other_digitsl11g}    Replace String    ${other_digitsl11gDot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line11gCents}'!='None'   Should Be Equal    ${vtxt941Line11gCents}    ${last_two_digitsl11g}
        Run Keyword If  '${vtxt941Line11gDollers}'!='None'   Should Be Equal    ${vtxt941Line11gDollers}    ${other_digitsl11g}

        ${vtxt941Line14Cents}=    Get From Dictionary   ${pdf_values}   txt941Line14Cents
        ${vtxt941Line14Dollers}=    Get From Dictionary   ${pdf_values}   txt941Line14Dollers
        ${original_numberl14}    Set Variable    ${Line14}
        ${number_stringl14}    Convert To String    ${original_numberl14}
        ${lengthl14}    Get Length    ${number_stringl14}
        ${last_two_indexl14}    Evaluate    ${lengthl14}-2
        ${last_two_digitsl14}    Get Substring    ${number_stringl14}    ${last_two_indexl14}    ${lengthl14}
        ${other_digitsl14Dot}    Get Substring    ${number_stringl14}    0    ${last_two_indexl14}
        ${other_digitsl14}    Replace String    ${other_digitsl14Dot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line14Cents}'!='${Empty}'   Should Be Equal    ${vtxt941Line14Cents}    ${last_two_digitsl14}
        Run Keyword If  '${vtxt941Line14Dollers}'!='${Empty}'   Should Be Equal    ${vtxt941Line14Dollers}    ${other_digitsl14}

        ${vtxt941Line13gCents}=    Get From Dictionary   ${pdf_values}  txt941Line13gCents
        ${vtxt941Line13gDollers}=    Get From Dictionary   ${pdf_values}   txt941Line13gDollers
        ${original_numberl13g}    Set Variable    ${Line13g}
        ${number_stringl13g}    Convert To String    ${original_numberl13g}
        ${lengthl13g}    Get Length    ${number_stringl13g}
        ${last_two_indexl13g}    Evaluate    ${lengthl13g}-2
        ${last_two_digitsl13g}    Get Substring    ${number_stringl13g}    ${last_two_indexl13g}    ${lengthl13g}
        ${other_digitsl13gDot}    Get Substring    ${number_stringl13g}    0    ${last_two_indexl13g}
        ${other_digitsl13g}    Replace String    ${other_digitsl13gDot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line13gCents}'!='None'   Should Be Equal    ${vtxt941Line13gCents}    ${last_two_digitsl13g}
        Run Keyword If  '${vtxt941Line13gDollers}'!='None'   Should Be Equal    ${vtxt941Line13gDollers}    ${other_digitsl13g}

        ${vtxt941Line13Dollers}=    Get From Dictionary   ${pdf_values}   txt941Line13Dollers
        ${vtxt941Line13Cents}=    Get From Dictionary   ${pdf_values}   txt941Line13Cents
        ${original_numberl13}    Set Variable    ${Line13a}
        ${number_stringl13}    Convert To String    ${original_numberl13}
        ${lengthl13}    Get Length    ${number_stringl13}
        ${last_two_indexl13}    Evaluate    ${lengthl13}-2
        ${last_two_digitsl13}    Get Substring    ${number_stringl13}    ${last_two_indexl13}    ${lengthl13}
        ${other_digitsl13Dot}    Get Substring    ${number_stringl13}    0    ${last_two_indexl13}
        ${other_digitsl13}    Replace String    ${other_digitsl13Dot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line13Cents}'!='None'   Should Be Equal    ${vtxt941Line13Cents}    ${last_two_digitsl13}
        Run Keyword If  '${vtxt941Line13Dollers}'!='None'   Should Be Equal    ${vtxt941Line13Dollers}    ${other_digitsl13}

        ${vtxt941Line12Dollers}=    Get From Dictionary   ${pdf_values}   txt941Line12Dollers
        ${vtxt941Line12Cents}=    Get From Dictionary   ${pdf_values}   txt941Line12Cents
        ${original_numberl12}    Set Variable    ${Line12}
        ${number_stringl12}    Convert To String    ${original_numberl12}
        ${lengthl12}    Get Length    ${number_stringl12}
        ${last_two_indexl12}    Evaluate    ${lengthl12}-2
        ${last_two_digitsl12}    Get Substring    ${number_stringl12}    ${last_two_indexl12}    ${lengthl12}
        ${other_digitsl12Dot}    Get Substring    ${number_stringl12}    0    ${last_two_indexl12}
        ${other_digitsl12}    Replace String    ${other_digitsl12Dot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line12Cents}'!='None'   Should Be Equal    ${vtxt941Line12Cents}    ${last_two_digitsl12}
        Run Keyword If  '${vtxt941Line12Dollers}'!='None'   Should Be Equal    ${vtxt941Line12Dollers}    ${other_digitsl12}

        ${vtxt941Line13cCents}=    Get From Dictionary   ${pdf_values}   txt941Line13cCents
        ${vtxt941Line13cDollers}=    Get From Dictionary   ${pdf_values}   txt941Line13cDollers
        ${original_numberl13c}    Set Variable    ${Line13c}
        ${number_stringl13c}    Convert To String    ${original_numberl13c}
        ${lengthl13c}    Get Length    ${number_stringl13c}
        ${last_two_indexl13c}    Evaluate    ${lengthl13c}-2
        ${last_two_digitsl13c}    Get Substring    ${number_stringl13c}    ${last_two_indexl13c}    ${lengthl13c}
        ${other_digitsl13cDot}    Get Substring    ${number_stringl13c}    0    ${last_two_indexl13c}
        ${other_digitsl13c}    Replace String    ${other_digitsl13cDot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line13cCents}'!='None'   Should Be Equal    ${vtxt941Line13cCents}    ${last_two_digitsl13c}
        Run Keyword If  '${vtxt941Line13cDollers}'!='None'   Should Be Equal    ${vtxt941Line13cDollers}    ${other_digitsl13c}

        ${vtxt941Line13eDollers}=    Get From Dictionary   ${pdf_values}   txt941Line13eDollers
        ${vtxt941Line13eCents}=    Get From Dictionary   ${pdf_values}  txt941Line13eCents
        ${original_numberl13e}    Set Variable    ${Line13e}
        ${number_stringl13e}    Convert To String    ${original_numberl13e}
        ${lengthl13e}    Get Length    ${number_stringl13e}
        ${last_two_indexl13e}    Evaluate    ${lengthl13e}-2
        ${last_two_digitsl13e}    Get Substring    ${number_stringl13e}    ${last_two_indexl13e}    ${lengthl13e}
        ${other_digitsl13eDot}    Get Substring    ${number_stringl13e}    0    ${last_two_indexl13e}
        ${other_digitsl13e}    Replace String    ${other_digitsl13eDot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line13eCents}'!='None'   Should Be Equal    ${vtxt941Line13eCents}    ${last_two_digitsl13e}
        Run Keyword If  '${vtxt941Line13eDollers}'!='None'   Should Be Equal    ${vtxt941Line13eDollers}    ${other_digitsl13e}

        ${vtxt941Line13fDollers}=    Get From Dictionary   ${pdf_values}   txt941Line13fDollers
        ${vtxt941Line13fCents}=    Get From Dictionary   ${pdf_values}   txt941Line13fCents

        ${vtxt941Line15Cents}=    Get From Dictionary   ${pdf_values}  txt941Line15Cents
        ${vtxt941Line15Dollers}=    Get From Dictionary   ${pdf_values}   txt941Line15Dollers
        ${original_numberl15}    Set Variable    ${Line15}
        ${number_stringl15}    Convert To String    ${original_numberl15}
        ${lengthl15}    Get Length    ${number_stringl15}
        ${last_two_indexl15}    Evaluate    ${lengthl15}-2
        ${last_two_digitsl15}    Get Substring    ${number_stringl15}    ${last_two_indexl15}    ${lengthl15}
        ${other_digitsl15Dot}    Get Substring    ${number_stringl15}    0    ${last_two_indexl15}
        ${other_digitsl15}    Replace String    ${other_digitsl15Dot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line15Cents}'!='None'   Should Be Equal    ${vtxt941Line15Cents}    ${last_two_digitsl15}
        Run Keyword If  '${vtxt941Line15Dollers}'!='None'   Should Be Equal    ${vtxt941Line15Dollers}    ${other_digitsl15}

        ${vchk941Line13SendRefund}=    Get From Dictionary   ${pdf_values}   chk941Line13SendRefund
        Run Keyword If  '${vchk941Line13SendRefund}'!='None'   Should Be Equal    ${vchk941Line13SendRefund}    ${SendrefundforNext}
        ${vchk941Line13ApplyNextReturn}=    Get From Dictionary   ${pdf_values}   chk941Line13ApplyNextReturn
        Run Keyword If  '${vchk941Line13ApplyNextReturn}'!='None'   Should Be Equal    ${vchk941Line13ApplyNextReturn}    ${SendrefundforNext}

        ${vchk941Line14AdjLess2500}=    Get From Dictionary   ${pdf_values}   chk941Line14AdjLess2500
        Run Keyword If  '${vchk941Line14AdjLess2500}'!='None'   Should Be Equal    ${vchk941Line14AdjLess2500}    ${DepositorSemiormonthly}
        ${vchk941Line14MonthlyDepositor}=    Get From Dictionary   ${pdf_values}   chk941Line14MonthlyDepositor
        Run Keyword If  '${vchk941Line14MonthlyDepositor}'!='None'   Should Be Equal    ${vchk941Line14MonthlyDepositor}    ${DepositorSemiormonthly}
        ${vchk941Line14WeeklyDepositor}=    Get From Dictionary   ${pdf_values}   chk941Line14WeeklyDepositor
        Run Keyword If  '${vchk941Line14WeeklyDepositor}'!='None'   Should Be Equal    ${vchk941Line14WeeklyDepositor}    ${DepositorSemiormonthly}

        ${vtxt941Line16TotLibilityCents}=    Get From Dictionary   ${pdf_values}   txt941Line16TotLibilityCents
        ${vtxt941Line16TotLibilityDollers}=    Get From Dictionary   ${pdf_values}   txt941Line16TotLibilityDollers
        ${original_numberl16t}    Set Variable    ${Line16TotLibility}
        ${number_stringl16t}    Convert To String    ${original_numberl16t}
        ${lengthl16t}    Get Length    ${number_stringl16t}
        ${last_two_indexl16t}    Evaluate    ${lengthl16t}-2
        ${last_two_digitsl16t}    Get Substring    ${number_stringl16t}    ${last_two_indexl16t}    ${lengthl16t}
        ${other_digitsl16tDot}    Get Substring    ${number_stringl16t}    0    ${last_two_indexl16t}
        ${other_digitsl16t}    Replace String    ${other_digitsl16tDot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line16TotLibilityCents}'!='None'   Should Be Equal    ${vtxt941Line16TotLibilityCents}    ${last_two_digitsl16t}
        Run Keyword If  '${vtxt941Line16TotLibilityDollers}'!='None'   Should Be Equal    ${vtxt941Line16TotLibilityDollers}    ${other_digitsl16t}

        ${vtxt941Line16Month1Cents}=    Get From Dictionary   ${pdf_values}  txt941Line16Month1Cents
        ${vtxt941Line16Month1Dollers}=    Get From Dictionary   ${pdf_values}   txt941Line16Month1Dollers
        ${original_numberl16M1}    Set Variable    ${Taxmonth1}
        ${number_stringl16M1}    Convert To String    ${original_numberl16M1}
        ${lengthl16M1}    Get Length    ${number_stringl16M1}
        ${last_two_indexl16M1}    Evaluate    ${lengthl16M1}-2
        ${last_two_digitsl16M1}    Get Substring    ${number_stringl16M1}    ${last_two_indexl16M1}    ${lengthl16M1}
        ${other_digitsl16M1Dot}    Get Substring    ${number_stringl16M1}    0    ${last_two_indexl16M1}
        ${other_digitsl16M1}    Replace String    ${other_digitsl16M1Dot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line16Month1Cents}'!='None'   Should Be Equal    ${vtxt941Line16Month1Cents}    ${last_two_digitsl16M1}
        Run Keyword If  '${vtxt941Line16Month1Dollers}'!='None'   Should Be Equal    ${vtxt941Line16Month1Dollers}    ${other_digitsl16M1}

        ${vtxt941Line16Month2Cents}=    Get From Dictionary   ${pdf_values}   txt941Line16Month2Cents
        ${vtxt941Line16Month2Dollers}=    Get From Dictionary   ${pdf_values}   txt941Line16Month2Dollers
        ${original_numberl16M2}    Set Variable    ${Taxmonth2}
        ${number_stringl16M2}    Convert To String    ${original_numberl16M2}
        ${lengthl16M2}    Get Length    ${number_stringl16M2}
        ${last_two_indexl16M2}    Evaluate    ${lengthl16M2}-2
        ${last_two_digitsl16M2}    Get Substring    ${number_stringl16M2}    ${last_two_indexl16M2}    ${lengthl16M2}
        ${other_digitsl16M2Dot}    Get Substring    ${number_stringl16M2}    0    ${last_two_indexl16M2}
        ${other_digitsl16M2}    Replace String    ${other_digitsl16M2Dot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line16Month2Cents}'!='None'   Should Be Equal    ${vtxt941Line16Month2Cents}    ${last_two_digitsl16M2}
        Run Keyword If  '${vtxt941Line16Month2Dollers}'!='None'   Should Be Equal    ${vtxt941Line16Month2Dollers}    ${other_digitsl16M2}

        ${vtxt941Line16Month3Cents}=    Get From Dictionary   ${pdf_values}   txt941Line16Month3Cents
        ${vtxt941Line16Month3Dollers}=    Get From Dictionary   ${pdf_values}   txt941Line16Month3Dollers
        ${original_numberl16M3}    Set Variable    ${Taxmonth3}
        ${number_stringl16M3}    Convert To String    ${original_numberl16M3}
        ${lengthl16M3}    Get Length    ${number_stringl16M3}
        ${last_two_indexl16M3}    Evaluate    ${lengthl16M3}-2
        ${last_two_digitsl16M3}    Get Substring    ${number_stringl16M3}    ${last_two_indexl16M3}    ${lengthl16M3}
        ${other_digitsl16M3Dot}    Get Substring    ${number_stringl16M3}    0    ${last_two_indexl16M3}
        ${other_digitsl16M3}    Replace String    ${other_digitsl16M3Dot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line16Month3Cents}'!='None'   Should Be Equal    ${vtxt941Line16Month3Cents}    ${last_two_digitsl16M3}
        Run Keyword If  '${vtxt941Line16Month3Dollers}'!='None'   Should Be Equal    ${vtxt941Line16Month3Dollers}    ${other_digitsl16M3}

        ${vtxt941EmpName3}=    Get From Dictionary   ${pdf_values}   txt941EmpName3
        ${vtxt941PreparerZipCode}=    Get From Dictionary   ${pdf_values}   txt941PreparerZipCode

        ${vtxt941Line27Cents}=    Get From Dictionary   ${pdf_values}   txt941Line27Cents
        ${vtxt941Line27Dollers}=    Get From Dictionary   ${pdf_values}   txt941Line27Dollers
        ${original_numberl27}    Set Variable    ${Line27}
        ${number_stringl27}    Convert To String    ${original_numberl27}
        ${lengthl27}    Get Length    ${number_stringl27}
        ${last_two_indexl27}    Evaluate    ${lengthl27}-2
        ${last_two_digitsl27}    Get Substring    ${number_stringl27}    ${last_two_indexl27}    ${lengthl27}
        ${other_digitsl27Dot}    Get Substring    ${number_stringl27}    0    ${last_two_indexl27}
        ${other_digitsl27}    Replace String    ${other_digitsl27Dot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line27Cents}'!='None'   Should Be Equal    ${vtxt941Line27Cents}    ${last_two_digitsl27}
        Run Keyword If  '${vtxt941Line27Dollers}'!='None'   Should Be Equal    ${vtxt941Line27Dollers}    ${other_digitsl27}


        ${vtxt941Line20Cents}=    Get From Dictionary   ${pdf_values}   txt941Line20Cents
        ${vtxt941Line20Dollers}=    Get From Dictionary   ${pdf_values}   txt941Line20Dollers
        ${original_numberl20}    Set Variable    ${Line20}
        ${number_stringl20}    Convert To String    ${original_numberl20}
        ${lengthl20}    Get Length    ${number_stringl20}
        ${last_two_indexl20}    Evaluate    ${lengthl20}-2
        ${last_two_digitsl20}    Get Substring    ${number_stringl20}    ${last_two_indexl20}    ${lengthl20}
        ${other_digitsl20Dot}    Get Substring    ${number_stringl20}    0    ${last_two_indexl20}
        ${other_digitsl20}    Replace String    ${other_digitsl20Dot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line20Cents}'!='None'   Should Be Equal    ${vtxt941Line20Cents}    ${last_two_digitsl20}
        Run Keyword If  '${vtxt941Line20Dollers}'!='None'   Should Be Equal    ${vtxt941Line20Dollers}    ${other_digitsl20}

        ${vchk941Line15}=    Get From Dictionary   ${pdf_values}  chk941Line15

        ${vtxt941Line17FinalYear}=    Get From Dictionary   ${pdf_values}   txt941Line17FinalYear
        ${vtxt941Line17FinalDay}=    Get From Dictionary   ${pdf_values}   txt941Line17FinalDay
        ${vtxt941Line17FinalMonth}=    Get From Dictionary   ${pdf_values}   txt941Line17FinalMonth

        ${vchk941Line16}=    Get From Dictionary   ${pdf_values}   chk941Line16

        ${vtxt941Line19Dollers}=    Get From Dictionary   ${pdf_values}   txt941Line19Dollers
        ${vtxt941Line19Cents}=    Get From Dictionary   ${pdf_values}   txt941Line19Cents
        ${original_numberl19}    Set Variable    ${Line19}
        ${number_stringl19}    Convert To String    ${original_numberl19}
        ${lengthl19}    Get Length    ${number_stringl19}
        ${last_two_indexl19}    Evaluate    ${lengthl19}-2
        ${last_two_digitsl19}    Get Substring    ${number_stringl19}    ${last_two_indexl19}    ${lengthl19}
        ${other_digitsl19Dot}    Get Substring    ${number_stringl19}    0    ${last_two_indexl19}
        ${other_digitsl19}    Replace String    ${other_digitsl19Dot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line19Cents}'!='None'   Should Be Equal    ${vtxt941Line19Cents}    ${last_two_digitsl19}
        Run Keyword If  '${vtxt941Line19Dollers}'!='None'   Should Be Equal    ${vtxt941Line19Dollers}    ${other_digitsl19}

        ${vtxt941Line23Cents}=    Get From Dictionary   ${pdf_values}   txt941Line23Cents
        ${vtxt941Line23Dollers}=    Get From Dictionary   ${pdf_values}  txt941Line23Dollers
        ${original_numberl23}    Set Variable    ${Line23}
        ${number_stringl23}    Convert To String    ${original_numberl23}
        ${lengthl23}    Get Length    ${number_stringl23}
        ${last_two_indexl23}    Evaluate    ${lengthl23}-2
        ${last_two_digitsl23}    Get Substring    ${number_stringl23}    ${last_two_indexl23}    ${lengthl23}
        ${other_digitsl23Dot}    Get Substring    ${number_stringl23}    0    ${last_two_indexl23}
        ${other_digitsl23}    Replace String    ${other_digitsl23Dot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line23Cents}'!='None'   Should Be Equal    ${vtxt941Line23Cents}    ${last_two_digitsl23}
        Run Keyword If  '${vtxt941Line23Dollers}'!='None'   Should Be Equal    ${vtxt941Line23Dollers}    ${other_digitsl23}

        ${vtxt941Line25Cents}=    Get From Dictionary   ${pdf_values}   txt941Line25Cents
        ${vtxt941Line25Dollers}=    Get From Dictionary   ${pdf_values}   txt941Line25Dollers
        ${original_numberl25}    Set Variable    ${Line25}
        ${number_stringl25}    Convert To String    ${original_numberl25}
        ${lengthl25}    Get Length    ${number_stringl25}
        ${last_two_indexl25}    Evaluate    ${lengthl25}-2
        ${last_two_digitsl25}    Get Substring    ${number_stringl25}    ${last_two_indexl25}    ${lengthl25}
        ${other_digitsl25Dot}    Get Substring    ${number_stringl25}    0    ${last_two_indexl25}
        ${other_digitsl25}    Replace String    ${other_digitsl25Dot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line25Cents}'!='None'   Should Be Equal    ${vtxt941Line25Cents}    ${last_two_digitsl25}
        Run Keyword If  '${vtxt941Line25Dollers}'!='None'   Should Be Equal    ${vtxt941Line25Dollers}    ${other_digitsl25}

        ${vtxt941Line26Cents}=    Get From Dictionary   ${pdf_values}   txt941Line26Cents
        ${vtxt941Line26Dollers}=    Get From Dictionary   ${pdf_values}   txt941Line26Dollers
        ${original_numberl26}    Set Variable    ${Line26}
        ${number_stringl26}    Convert To String    ${original_numberl26}
        ${lengthl26}    Get Length    ${number_stringl26}
        ${last_two_indexl26}    Evaluate    ${lengthl26}-2
        ${last_two_digitsl26}    Get Substring    ${number_stringl26}    ${last_two_indexl26}    ${lengthl26}
        ${other_digitsl26Dot}    Get Substring    ${number_stringl26}    0    ${last_two_indexl26}
        ${other_digitsl26}    Replace String    ${other_digitsl26Dot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line26Cents}'!='None'   Should Be Equal    ${vtxt941Line26Cents}    ${last_two_digitsl26}
        Run Keyword If  '${vtxt941Line26Dollers}'!='None'   Should Be Equal    ${vtxt941Line26Dollers}    ${other_digitsl26}

        ${vtxt941Line24Cents}=    Get From Dictionary   ${pdf_values}  txt941Line24Cents
        ${vtxt941Line24Dollers}=    Get From Dictionary   ${pdf_values}   txt941Line24Dollers
        ${original_numberl24}    Set Variable    ${Line24}
        ${number_stringl24}    Convert To String    ${original_numberl24}
        ${lengthl24}    Get Length    ${number_stringl24}
        ${last_two_indexl24}    Evaluate    ${lengthl24}-2
        ${last_two_digitsl24}    Get Substring    ${number_stringl24}    ${last_two_indexl24}    ${lengthl24}
        ${other_digitsl24Dot}    Get Substring    ${number_stringl24}    0    ${last_two_indexl24}
        ${other_digitsl24}    Replace String    ${other_digitsl24Dot}    .    ${EMPTY}
        Run Keyword If  '${vtxt941Line24Cents}'!='None'   Should Be Equal    ${vtxt941Line24Cents}    ${last_two_digitsl24}
        Run Keyword If  '${vtxt941Line24Dollers}'!='None'   Should Be Equal    ${vtxt941Line24Dollers}    ${other_digitsl24}



        ${vtxt941Line28Dollers}=    Get From Dictionary   ${pdf_values}   txt941Line28Dollers
        ${vtxt941ThirdPartyPIN5}=    Get From Dictionary   ${pdf_values}   txt941ThirdPartyPIN5
        ${vtxt941ThirdPartyPhoneNumber}=    Get From Dictionary   ${pdf_values}   txt941ThirdPartyPhoneNumber
        ${vtxt941ThirdPartyPIN1}=    Get From Dictionary   ${pdf_values}   txt941ThirdPartyPIN1
        ${vtxt941ThirdPartyPIN2}=    Get From Dictionary   ${pdf_values}   txt941ThirdPartyPIN2
        ${vtxt941ThirdPartyPIN3}=    Get From Dictionary   ${pdf_values}  txt941ThirdPartyPIN3
        
        ${vtxt941ThirdPartyPIN4}=    Get From Dictionary   ${pdf_values}   txt941ThirdPartyPIN4
        
        ${vchk941NoThirdPartyDesignee}=    Get From Dictionary   ${pdf_values}   chk941NoThirdPartyDesignee
        
        ${vtxt941Line28Cents}=    Get From Dictionary   ${pdf_values}   txt941Line28Cents
        
        ${vchk941IsThirdPartyDesignee}=    Get From Dictionary   ${pdf_values}   chk941IsThirdPartyDesignee
        
        ${vtxt941ThirdPartyDesigneeName}=    Get From Dictionary   ${pdf_values}   txt941ThirdPartyDesigneeName
        
        ${vtxt941Sign}=    Get From Dictionary   ${pdf_values}   txt941Sign
        
        ${vtxt941printTitle}=    Get From Dictionary   ${pdf_values}   txt941printTitle
        
        ${vtxt941printName}=    Get From Dictionary   ${pdf_values}  txt941printName
        
        ${vtxt941DayTimePhone}=    Get From Dictionary   ${pdf_values}   txt941DayTimePhone
        
        ${vtxt941SignDay}=    Get From Dictionary   ${pdf_values}   txt941SignDay
        
        ${vtxt941SignMonth}=    Get From Dictionary   ${pdf_values}   txt941SignMonth
        

        ${vtxt941SignYear}=    Get From Dictionary   ${pdf_values}   txt941SignYear
        
        ${vtxt941PreparerTIN}=    Get From Dictionary   ${pdf_values}   txt941PreparerTIN
        
        ${vtxt941PreparerName}=    Get From Dictionary   ${pdf_values}  txt941PreparerName
        
        ${vtxt941PreparerEIN}=    Get From Dictionary   ${pdf_values}   txt941PreparerEIN
        
        ${vtxt941PreparerSignMonth}=    Get From Dictionary   ${pdf_values}   txt941PreparerSignMonth

        ${vtxt941PreparerSignDay}=    Get From Dictionary   ${pdf_values}   txt941PreparerSignDay
  
        ${vtxt941PreparerSignYear}=    Get From Dictionary   ${pdf_values}   txt941PreparerSignYear

        ${vtxt941PreparerSign}=    Get From Dictionary   ${pdf_values}   txt941PreparerSign

        ${vtxt941FirmName}=    Get From Dictionary   ${pdf_values}  txt941FirmName

        ${vtxt941PreparerPhone}=    Get From Dictionary   ${pdf_values}   txt941PreparerPhone

        ${vtxt941PreparerAddress}=    Get From Dictionary   ${pdf_values}   txt941PreparerAddress

        ${vtxt941PreparerCity}=    Get From Dictionary   ${pdf_values}   txt941PreparerCity


        ${vtxt941PreparerState}=    Get From Dictionary   ${pdf_values}   txt941PreparerState

        ${vchk941IsSelfEmployed}=    Get From Dictionary   ${pdf_values}   chk941IsSelfEmployed

        ${vtxt941EINNumber3}=    Get From Dictionary   ${pdf_values}   txt941EINNumber3  
        Run Keyword If  '${vtxt941EINNumber3}'!='${Empty}'   Should Be Equal    ${vtxt941EINNumber3}    ${EINnumber}
 






