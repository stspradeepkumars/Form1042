
*** Settings ***
Resource   ../../support/1042_support.robot

*** Test Cases ***
Login to Account
  ssettings 
  ${logid}=     Get Environment Variable     logid
  ${apwd}=    	fndbget      select pcode from tb_autodata where SiteName='UAT-Form941'
  ${siteURL}=    	set Variable    https://tbs-secure.spanstage.com/login
  ${uid}=    	set Variable    puvanasri.j+1042STG@spantechnologyservices.com 
  ${pwd}=    	fndbget      select pwd from tb_autodata where SiteName='UAT-Form941'
  
  ${xml}=    Parse XML    ../../Object Repository/1042.xml
  ${osigin}=       Get Element Text    	${xml}   	signin
  ${ouid}=         Get Element Text    	${xml}   	uid
  ${opwd}=         Get Element Text    	${xml}   	pwd
  ${start}=       Get Element Text    	${xml}   	start
  ${form}=       Get Element Text    	${xml}   	form
  ${1042}=    	set Variable    (//span[contains(text(),"Form 1042")])[4] 

  Open Window   ${siteURL} 
  #${a}  BackupFiles  ${EXECDIR} 
  Sleep  2s
  TestingPopUp
  Singin_Page   ${ouid}     ${uid}  ${opwd}     ${pwd}  ${osigin}
  sleep   30s   
  ${windowsize}  Get Window Size
  log to console    ${windowsize}
  ${passed} =    Run Keyword And Return Status         SeleniumLibrary.Page Should Contain 	 Verify your Email to Sign-In  15s
  Run Keyword If	${passed}    OTAvalidation
  Two Factor Authentication
  sleep   10s   
  ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled 	 //button[contains(@class,"text-capitalize")]/span[contains(text(),"Start Filling")]  15s
  Run Keyword If	${passed}    Click Element 	 //button[contains(@class,"text-capitalize")]/span[contains(text(),"Start Filling")]  Remove Files   ../../Test suite/Form1042/1042Screenshot/*.png

GenerateReturn-Form1042
  ProcessReturn-Form1042

Generate Report
  createh
  

***Keywords***
OTAvalidation
  ${ota}   email_ota
  log to console    ${ota}

  ${OTAnumber} =    Set Variable    ${ota}
  ${digit_1} =    Evaluate    int(str(${OTAnumber})[0])
  ${digit_2} =    Evaluate    int(str(${OTAnumber})[1])
  ${digit_3} =    Evaluate    int(str(${OTAnumber})[2])
  ${digit_4} =    Evaluate    int(str(${OTAnumber})[3])
  ${digit_5} =    Evaluate    int(str(${OTAnumber})[4])
  ${digit_6} =    Evaluate    int(str(${OTAnumber})[5])
  Log Many    ${digit_1}    ${digit_2}    ${digit_3}    ${digit_4}    ${digit_5}    ${digit_6}


  #OTA
  Input Text    (//div[@class="v-text-field__slot"])[1]/input   ${digit_1}
  Input Text    (//div[@class="v-text-field__slot"])[2]/input   ${digit_2}
  Input Text    (//div[@class="v-text-field__slot"])[3]/input   ${digit_3} 
  Input Text    (//div[@class="v-text-field__slot"])[4]/input   ${digit_4} 
  Input Text    (//div[@class="v-text-field__slot"])[5]/input   ${digit_5} 
  Input Text    (//div[@class="v-text-field__slot"])[6]/input   ${digit_6}

  Click Element   //span[contains(text(),"Verify")]   
  sleep   15s