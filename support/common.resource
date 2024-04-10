*** Variables ***
@{Browser}    Chrome  

*** Keywords ***
Open Window
	[Arguments]     ${siteURL}
    ${browse}=  Evaluate    random.choice(@{Browser})   random
    Set Environment Variable     browser           Chrome
    Log To Console   ${browse}
    Set Environment Variable     url    ${siteURL}
    Open Browser    ${siteURL}     Chrome
TestingPopUp
    sleep   5s
    ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       (//input[@type="password"])[2]    10s
    Run Keyword If	${passed}    Input Text       (//input[@type="password"])[2]          spanqatesting
    Run Keyword If	${passed}    Click Element   //span[text()="Continue"]
Singin_Page
	[Arguments]     ${ouid}     ${uid}  ${opwd}     ${pwd}  ${osigin}	
    Input Text    ${ouid}          ${uid}
    Set Global Variable     ${uid}
    Set Environment Variable     EmailAddress           ${uid}
    Input Text    ${opwd}          ${pwd}
    Set Global Variable     ${pwd}
    Set Environment Variable     Password           ${pwd}
	${passed} =    Run Keyword And Return Status      Wait Until Element Is Enabled       ${osigin}     10s
	Click Element			${osigin}
    
Two Factor Authentication
    ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       (//div[@class="d-flex align-center justify-space-between flex-wrap v-card v-card--flat v-sheet theme--light"]/button)[1]    10s
	Run Keyword If	${passed}    Click Element      (//div[@class="d-flex align-center justify-space-between flex-wrap v-card v-card--flat v-sheet theme--light"]/button)[1]
SelectNewForm1042
	[Arguments]     ${start}    ${form}  ${1042}
    sleep	10s
    ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       //span[@class="v-btn__content" and contains(text(),"Start New Form")]    100s
	Run Keyword If	${passed}    Click Element    //span[@class="v-btn__content" and contains(text(),"Start New Form")]
    sleep	10s
    ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${1042}    100s
	Run Keyword If	${passed}       Execute JavaScript    document.evaluate('${1042}', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
    ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       (//span[contains(text(),"Form 1042")])    100s
	Run Keyword If	${passed}       Execute JavaScript    document.evaluate('(//span[contains(text(),"Form 1042")])', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();

SelectNewForm
	[Arguments]     ${start}    ${form}  ${941}
    sleep	15s
    ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       //span[@class="v-btn__content" and contains(text(),"Start New Form")]    100s
	Run Keyword If	${passed}    Click Element    //span[@class="v-btn__content" and contains(text(),"Start New Form")]
    sleep	10s
    Wait Until Element Is Enabled       ${941}      50s
    Execute JavaScript    document.evaluate('${941}', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
SelectFormIcon
	[Arguments]     ${start}    ${form}  ${941}
    sleep	15s
    ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       //button[contains(@class,"v-btn v-btn--is-elevated v-btn--fab v-btn--has-bg v-btn--round theme--dark v-size--default primary")]/span/i     100s
    Run Keyword If	${passed}    Click Element    //button[contains(@class,"v-btn v-btn--is-elevated v-btn--fab v-btn--has-bg v-btn--round theme--dark v-size--default primary")]/span/i
    sleep	10s
    Run Keyword If	${passed}    JavascriptClick  ${form}
    sleep	10s
    Wait Until Element Is Enabled       ${941}      50s
    Execute JavaScript    document.evaluate('${941}', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
SelectNewFormold
	[Arguments]     ${start}    ${form}  ${941}
    sleep	5s
    Wait Until Element Is Enabled       ${start}     99s
    Click Element       ${start}
    sleep	10s
    Wait Until Element Is Enabled       ${form}     50s
    Click Element       ${form}
    Wait Until Element Is Enabled       ${941}      50s
    Execute JavaScript    document.evaluate('${941}', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
IFFAILED
    [Arguments]   ${Page_id}   ${CURDIRs}   ${logid}    ${obj_ID}    ${obj_ID}   ${obj_Des}   ${Expected_Result}    ${Actual_Result}
    Set Screenshot Directory        ${CURDIRs}/reference
    ${passed} =    Run Keyword And Return Status      Wait Until Element Is Enabled       ${Page_id}      5s
    Run Keyword Unless   ${passed} == True    Capture Page Screenshot     emailattachments/${obj_ID}_${obj_ID}.png
    Run Keyword Unless   ${passed} == True    writelog    '${logid}','${obj_ID}','${obj_Des}','${obj_ID}','${Expected_Result}','${Actual_Result}','FAIL','${logid}_${obj_ID}_${obj_ID}.png'

Final Message
    [Arguments]   ${Elem}   ${logid}    ${obj_ID}   ${obj_Des}   ${Expected_Result}    ${Actual_Result1}   ${Actual_Result2}    ${screen}
    ${passed1} =    Run Keyword And Return Status      Wait Until Element Is Enabled       ${Elem}      5s
    Run Keyword If   ${passed1} == True    Capture Page Screenshot     ${screen}
    Run Keyword If   ${passed1} == False    Capture Page Screenshot     ${screen}
    sleep	5s 
    Run Keyword If	${passed1} == True	writelog    '${logid}','${obj_ID}','${obj_Des}','${Expected_Result}','${Actual_Result1}','Pass','${obj_ID}.png'
    Run Keyword If   ${passed1} == False   writelog      '${logid}','${obj_ID}','${obj_Des}','${Expected_Result}','${Actual_Result2}','Fail','${obj_ID}.png'

Final Message-RoleSystem
    [Arguments]   ${Elem}   ${logid}    ${obj_ID}   ${obj_Des}   ${RoleSystem}	${preparer}    ${Approver}   ${Transmitter}    ${screen}
    ${passed1} =    Run Keyword And Return Status      Wait Until Element Is Enabled       ${Elem}      5s
    Run Keyword If   ${passed1} == True    Capture Page Screenshot     ${screen}
    Run Keyword If   ${passed1} == False    Capture Page Screenshot     ${screen}
    sleep	5s 
    Run Keyword If	${passed1} == True	writelogRoleSystem    '${logid}','${obj_ID}','${obj_Des}','${RoleSystem}','${preparer}','${Approver}','${Transmitter}','Pass','${obj_ID}.png'
    Run Keyword If   ${passed1} == False   writelogRoleSystem      '${logid}','${obj_ID}','${obj_Des}','${RoleSystem}','${preparer}','${Approver}','${Transmitter}','Fail','${obj_ID}.png'
WaitUntilClick     
    [Arguments]   ${Xpath}
    Wait Until Element Is Enabled 		${Xpath}    		50s
    Execute Javascript  document.evaluate('${Xpath}', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
WaitUntilSimpleClick     
    [Arguments]   ${Xpath}
    Wait Until Element Is Enabled 		${Xpath}    		50s
    Click Element       ${Xpath}

RunIfWaitUntilClickExe 
    [Arguments]   ${Xpath}  ${Xpath1}
    ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${Xpath}     50s
    Run Keyword If    ${passed}    Click Element        ${Xpath}
    Run Keyword If    ${passed}    Execute Javascript  document.evaluate('${Xpath1}', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();

RunIfWaitUntilExe
    [Arguments]   ${Xpath}
    ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${Xpath}     50s
    Run Keyword If    ${passed}    Execute Javascript  document.evaluate('${Xpath}', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
    
RunIfWaitUntilClick
    [Arguments]   ${Xpath}
    ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${Xpath}     50s
    Run Keyword If    ${passed}    Click Element        ${Xpath}
RunIfWaitUntilExeInput
    [Arguments]   ${Xpath}  ${Object}   ${value} 
    ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${Xpath}     50s
    Run Keyword If    ${passed}    Execute Javascript  document.evaluate('${Xpath}', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
    Run Keyword If    ${passed}     Input Text      ${Object}   ${value}    
GetVisibleText
    [Arguments]   ${Vname}  ${Xpath}
    ${Vname}    Get Text   ${Xpath}

JavascriptClick
    [Arguments]   ${Xpath}
  Execute Javascript  document.evaluate('${Xpath}', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();

ToastValidation
  [Arguments]   ${BusinessN}    ${ErrorInput}   ${AuditErr}     ${ErrorMsg}
    #completingForm941
    sleep  5s
    ${passed} =    Run Keyword And Return Status         Wait Until Element Is Visible 		//label[@for="businessconsent"]    		50s	  
    Run Keyword If    ${passed}   Click Element   //label[@for="businessconsent"]
    IF    '${AuditErr}' == 'YES'
        ${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       //input[@id='AuthorityBusinessName']    20s
        Run Keyword If    ${passed}     Input Text  //input[@id='AuthorityBusinessName']    ${ErrorInput}
        sleep  7s
        Run Keyword If    ${passed}		Page Should Contain     ${ErrorMsg}
        sleep  5s
        Run Keyword If    ${passed}		Input Text  //input[@id='AuthorityBusinessName']    ${BusinessN}
    ELSE
        ${passed} =    Run Keyword And Return Status         Wait Until Element Is Visible 		//input[@id='AuthorityBusinessName']    		50s	  
        Run Keyword If    ${passed}	Input Text  //input[@id='AuthorityBusinessName']    ${BusinessN}
    END
    sleep   1s
    Wait Until Element Is Enabled 		//button[contains(text(),'I Consent')]    		50s
    Run Keyword If    ${passed}	Click Element   //button[contains(text(),'I Consent')]
