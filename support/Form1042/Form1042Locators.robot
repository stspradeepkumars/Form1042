***Keywords***

Locators_1042
    ${xml}=    Parse XML    ../../Object Repository/1042.xml
    ${logid}=     Get Environment Variable     logid
    ${OChapter3SC}  Get Element Text  ${xml}  Chapter3SC
    ${OWithholdingAgentName}  Get Element Text  ${xml}  WithholdingAgentName
    ${OWithholdingAgentEIN}  Get Element Text  ${xml}  OWithholdingAgentEIN
    ${OEIN}  Get Element Text  ${xml}  EIN
    ${OQI-EIN}  Get Element Text  ${xml}  QI-EIN
    ${OWP-EIN}  Get Element Text  ${xml}  WP-EIN
    ${OWT-EIN}  Get Element Text  ${xml}  WT-EIN
    ${ONQI-EIN}  Get Element Text  ${xml}  NQI-EIN
    ${OIsForeignAddr}  Get Element Text  ${xml}  IsForeignAddr
    ${OWHAddress1}  Get Element Text  ${xml}  WHAddress1
    ${OWHAddress2}  Get Element Text  ${xml}  WHAddress2
    ${OWHCity}  Get Element Text  ${xml}  WHCity
    ${OWHState}  Get Element Text  ${xml}  WHState
    ${OWHCountry}  Get Element Text  ${xml}  WHCountry
    ${OWHZipCode}  Get Element Text  ${xml}  WHZipCode
    ${OWHPostalCode}  Get Element Text  ${xml}  WHPostalCode
    ${OWHContactName}  Get Element Text  ${xml}  WHContactName
    ${OWHEmail}  Get Element Text  ${xml}  WHEmail
    ${OWHPhone}  Get Element Text  ${xml}  WHPhone
    ${OWHFax}  Get Element Text  ${xml}  WHFax
    ${OWHSignatoryName}  Get Element Text  ${xml}  WHSignatoryName
    ${OWHTitle}  Get Element Text  ${xml}  WHTitle
    ${OWHDaytimePhone}  Get Element Text  ${xml}  WHDaytimePhone
    ${OWHContactNameF}  Get Element Text  ${xml}  WHContactNameF
    ${OWHEmailF}  Get Element Text  ${xml}  WHEmailF
    ${OWHPhoneF}  Get Element Text  ${xml}  WHPhoneF
    ${OWHFaxF}  Get Element Text  ${xml}  WHFaxF
    ${OWHSignatoryNameF}  Get Element Text  ${xml}  WHSignatoryNameF
    ${OWHTitleF}  Get Element Text  ${xml}  WHTitleF
    ${OWHDaytimePhoneF}  Get Element Text  ${xml}  WHDaytimePhoneF
    ${OJan7}  Get Element Text  ${xml}  Jan07
    ${OJan15}  Get Element Text  ${xml}  Jan15
    ${OJan22}  Get Element Text  ${xml}  Jan22
    ${OJan31}  Get Element Text  ${xml}  Jan31
    ${OJanTotal}  Get Element Text  ${xml}  JanTotal
    ${OFeb07}  Get Element Text  ${xml}  Feb07
    ${OFeb15}  Get Element Text  ${xml}  Feb15
    ${OFeb22}  Get Element Text  ${xml}  Feb22
    ${OFeb28}  Get Element Text  ${xml}  Feb28
    ${OFebTotal}  Get Element Text  ${xml}  FebTotal
    ${OMar07}  Get Element Text  ${xml}  Mar07
    ${OMar15}  Get Element Text  ${xml}  Mar15
    ${OMar22}  Get Element Text  ${xml}  Mar22
    ${OMar31}  Get Element Text  ${xml}  Mar31
    ${OMarTotal}  Get Element Text  ${xml}  MarTotal
    ${OApr07}  Get Element Text  ${xml}  Apr07
    ${OApr15}  Get Element Text  ${xml}  Apr15
    ${OApr22}  Get Element Text  ${xml}  Apr22
    ${OApr30}  Get Element Text  ${xml}  Apr30
    ${OAprTotal}  Get Element Text  ${xml}  AprTotal
    ${OMay07}  Get Element Text  ${xml}  May07
    ${OMay15}  Get Element Text  ${xml}  May15
    ${OMay22}  Get Element Text  ${xml}  May22
    ${OMay31}  Get Element Text  ${xml}  May31
    ${OMayTotal}  Get Element Text  ${xml}  MayTotal
    ${OJune07}  Get Element Text  ${xml}  June07
    ${OJune15}  Get Element Text  ${xml}  June15
    ${OJune22}  Get Element Text  ${xml}  June22
    ${OJune30}  Get Element Text  ${xml}  June30
    ${OJuneTotal}  Get Element Text  ${xml}  JuneTotal
    ${OJuly07}  Get Element Text  ${xml}  July07
    ${OJuly15}  Get Element Text  ${xml}  July15
    ${OJuly22}  Get Element Text  ${xml}  July22
    ${OJuly31}  Get Element Text  ${xml}  July31
    ${OJulyTotal}  Get Element Text  ${xml}  JulyTotal
    ${OAug07}  Get Element Text  ${xml}  Aug07
    ${OAug15}  Get Element Text  ${xml}  Aug15
    ${OAug22}  Get Element Text  ${xml}  Aug22
    ${OAug31}  Get Element Text  ${xml}  Aug31
    ${OAugTotal}  Get Element Text  ${xml}  AugTotal
    ${OSep07}  Get Element Text  ${xml}  Sep07
    ${OSep15}  Get Element Text  ${xml}  Sep15
    ${OSep22}  Get Element Text  ${xml}  Sep22
    ${OSep31}  Get Element Text  ${xml}  Sep31
    ${OSepTotal}  Get Element Text  ${xml}  SepTotal
    ${OOct07}  Get Element Text  ${xml}  Oct07
    ${OOct15}  Get Element Text  ${xml}  Oct15
    ${OOct22}  Get Element Text  ${xml}  Oct22
    ${OOct31}  Get Element Text  ${xml}  Oct31
    ${OOctTotal}  Get Element Text  ${xml}  OctTotal
    ${ONov07}  Get Element Text  ${xml}  Nov07
    ${ONov15}  Get Element Text  ${xml}  Nov15
    ${ONov22}  Get Element Text  ${xml}  Nov22
    ${ONov30}  Get Element Text  ${xml}  Nov30
    ${ONovTotal}  Get Element Text  ${xml}  NovTotal
    ${ODec07}  Get Element Text  ${xml}  Dec07
    ${ODec15}  Get Element Text  ${xml}  Dec15
    ${ODec22}  Get Element Text  ${xml}  Dec22
    ${ODec31}  Get Element Text  ${xml}  Dec31
    ${ODecTotal}  Get Element Text  ${xml}  DecTotal
    ${OLine61Onpaper}  Get Element Text  ${xml}  Line61Onpaper
    ${OLine61Electronically}  Get Element Text  ${xml}  Line61Electronically
    ${OLine62}  Get Element Text  ${xml}  Line62
    ${OLine62a}  Get Element Text  ${xml}  Line62a
    ${OLine62b}  Get Element Text  ${xml}  Line62b
    ${OLine62b1}  Get Element Text  ${xml}  Line62b1
    ${OLine62b2}  Get Element Text  ${xml}  Line62b2
    ${OLine62c}  Get Element Text  ${xml}  Line62c
    ${OLine62d}  Get Element Text  ${xml}  Line62d
    ${OThirdPartyDesigneeYes}  Get Element Text  ${xml}  ThirdPartyDesigneeYes
    ${OThirdPartyDesigneeNo}  Get Element Text  ${xml}  ThirdPartyDesigneeNo
    ${ODesigneeName}  Get Element Text  ${xml}  DesigneeName
    ${ODesigneePhoneNumber}  Get Element Text  ${xml}  DesigneePhoneNumber
    ${OPIN1}  Get Element Text  ${xml}  PIN1
    ${OPIN2}  Get Element Text  ${xml}  PIN2
    ${OPIN3}  Get Element Text  ${xml}  PIN3
    ${OPIN4}  Get Element Text  ${xml}  PIN4
    ${OPIN5}  Get Element Text  ${xml}  PIN5
    ${OSaveandContinue}  Get Element Text  ${xml}  SaveandContinue
    ${OLine63a}  Get Element Text  ${xml}  Line63a
    ${OLine63b1}  Get Element Text  ${xml}  Line63b1
    ${OLine63b2}  Get Element Text  ${xml}  Line63b2
    ${OLine63c1}  Get Element Text  ${xml}  Line63c1
    ${OLine63c2}  Get Element Text  ${xml}  Line63c2
    ${OLine63d}  Get Element Text  ${xml}  Line63d
    ${OLine63e}  Get Element Text  ${xml}  Line63e
    ${OLine64a}  Get Element Text  ${xml}  Line64a
    ${OLine64b}  Get Element Text  ${xml}  Line64b
    ${OLine64c}  Get Element Text  ${xml}  Line64c
    ${OLine64d}  Get Element Text  ${xml}  Line64d
    ${OLine64e}  Get Element Text  ${xml}  Line64e
    ${OLine65a}  Get Element Text  ${xml}  Line65a
    ${OLine65b}  Get Element Text  ${xml}  Line65b
    ${OLine66}  Get Element Text  ${xml}  Line66   	
    ${OLine67a}  Get Element Text  ${xml}  Line67a
    ${OLine67b}  Get Element Text  ${xml}  Line67b
    ${OLine68}  Get Element Text  ${xml}  Line68
    ${OLine69}  Get Element Text  ${xml}  Line69
    ${OLine70a}  Get Element Text  ${xml}  Line70a
    ${OLine70b}  Get Element Text  ${xml}  Line70b
    ${OLine71Credit}  Get Element Text  ${xml}  Line71Credit
    ${OLine71Refund}  Get Element Text  ${xml}  Line71Refund
    ${OSec2-1}  Get Element Text  ${xml}  Sec2-1
    ${OSec2-2a}  Get Element Text  ${xml}  Sec2-2a
    ${OSec2-2b}  Get Element Text  ${xml}  Sec2-2b
    ${OSec2-2c}  Get Element Text  ${xml}  Sec2-2c
    ${OSec2-2d}  Get Element Text  ${xml}  Sec2-2d
    ${OSec2-2e}  Get Element Text  ${xml}  Sec2-2e
    ${OSec2-3}  Get Element Text  ${xml}  Sec2-3
    ${OSec2-4}  Get Element Text  ${xml}  Sec2-4
    ${OSec2-5}  Get Element Text  ${xml}  Sec2-5
    ${OSec3-871m}  Get Element Text  ${xml}  Sec3-871m
    ${OSec4-QDD}  Get Element Text  ${xml}  Sec4-QDD
    ${OSec4-1}  Get Element Text  ${xml}  Sec4-1
    ${OSec4-2EIN}  Get Element Text  ${xml}  Sec4-2EIN
    ${obtnsave} =	Get Element Text    	${xml}   	btnsave
    ${oCompleteFiling} =	Get Element Text    	${xml}   	CompleteFiling
    ${startnew} =	Get Element Text    	${xml}   	startnew
    ${choose1042A} =	Get Element Text    	${xml}   	choose1042A
    ${amdreason} =	Get Element Text    	${xml}   	amdreason

    Set Suite Variable    ${startnew}
    Set Suite Variable    ${choose1042A}
    Set Suite Variable    ${amdreason}
    Set Suite Variable    ${oCompleteFiling}
    Set Suite Variable    ${OLine66}
    Set Suite Variable    ${obtnsave}
    Set Suite Variable    ${OChapter3SC}
    Set Suite Variable  ${OWithholdingAgentName}
    Set Suite Variable  ${OWithholdingAgentEIN}
    Set Suite Variable  ${OEIN}
    Set Suite Variable  ${OQI-EIN}
    Set Suite Variable  ${OWP-EIN}
    Set Suite Variable  ${OWT-EIN}
    Set Suite Variable  ${ONQI-EIN}
    Set Suite Variable  ${OIsForeignAddr}
    Set Suite Variable  ${OWHAddress1}
    Set Suite Variable  ${OWHAddress2}
    Set Suite Variable  ${OWHCity}
    Set Suite Variable  ${OWHState}
    Set Suite Variable  ${OWHZipCode}
    Set Suite Variable  ${OWHCountry}
    Set Suite Variable  ${OWHPostalCode}
    Set Suite Variable  ${OWHContactName}
    Set Suite Variable  ${OWHEmail}
    Set Suite Variable  ${OWHPhone}
    Set Suite Variable  ${OWHFax}
    Set Suite Variable  ${OWHSignatoryName}
    Set Suite Variable  ${OWHTitle}
    Set Suite Variable  ${OWHDaytimePhone}
    Set Suite Variable  ${OWHContactNameF}
    Set Suite Variable  ${OWHEmailF}
    Set Suite Variable  ${OWHPhoneF}
    Set Suite Variable  ${OWHFaxF}
    Set Suite Variable  ${OWHSignatoryNameF}
    Set Suite Variable  ${OWHTitleF}
    Set Suite Variable  ${OWHDaytimePhoneF}
    Set Suite Variable  ${OJan7}
    Set Suite Variable  ${OJan15}
    Set Suite Variable  ${OJan22}
    Set Suite Variable  ${OJan31}
    Set Suite Variable  ${OJanTotal}
    Set Suite Variable  ${OFeb07}
    Set Suite Variable  ${OFeb15}
    Set Suite Variable  ${OFeb22}
    Set Suite Variable  ${OFeb28}
    Set Suite Variable  ${OFebTotal}
    Set Suite Variable  ${OMar07}
    Set Suite Variable  ${OMar15}
    Set Suite Variable  ${OMar22}
    Set Suite Variable  ${OMar31}
    Set Suite Variable  ${OMarTotal}
    Set Suite Variable  ${OApr07}
    Set Suite Variable  ${OApr15}
    Set Suite Variable  ${OApr22}
    Set Suite Variable  ${OApr30}
    Set Suite Variable  ${OAprTotal}
    Set Suite Variable  ${OMay07}
    Set Suite Variable  ${OMay15}
    Set Suite Variable  ${OMay22}
    Set Suite Variable  ${OMay31}
    Set Suite Variable  ${OMayTotal}
    Set Suite Variable  ${OJune07}
    Set Suite Variable  ${OJune15}
    Set Suite Variable  ${OJune22}
    Set Suite Variable  ${OJune30}
    Set Suite Variable  ${OJuneTotal}
    Set Suite Variable  ${OJuly07}
    Set Suite Variable  ${OJuly15}
    Set Suite Variable  ${OJuly22}
    Set Suite Variable  ${OJuly31}
    Set Suite Variable  ${OJulyTotal}
    Set Suite Variable  ${OAug07}
    Set Suite Variable  ${OAug15}
    Set Suite Variable  ${OAug22}
    Set Suite Variable  ${OAug31}
    Set Suite Variable  ${OAugTotal}
    Set Suite Variable  ${OSep07}
    Set Suite Variable  ${OSep15}
    Set Suite Variable  ${OSep22}
    Set Suite Variable  ${OSep31}
    Set Suite Variable  ${OSepTotal}
    Set Suite Variable  ${OOct07}
    Set Suite Variable  ${OOct15}
    Set Suite Variable  ${OOct22}
    Set Suite Variable  ${OOct31}
    Set Suite Variable  ${OOctTotal}
    Set Suite Variable  ${ONov07}
    Set Suite Variable  ${ONov15}
    Set Suite Variable  ${ONov22}
    Set Suite Variable  ${ONov30}
    Set Suite Variable  ${ONovTotal}
    Set Suite Variable  ${ODec07}
    Set Suite Variable  ${ODec15}
    Set Suite Variable  ${ODec22}
    Set Suite Variable  ${ODec31}
    Set Suite Variable  ${ODecTotal}
    Set Suite Variable  ${OLine61Onpaper}
    Set Suite Variable  ${OLine61Electronically}
    Set Suite Variable  ${OLine62}
    Set Suite Variable  ${OLine62a}
    Set Suite Variable  ${OLine62b}
    Set Suite Variable  ${OLine62b1}
    Set Suite Variable  ${OLine62b2}
    Set Suite Variable  ${OLine62c}
    Set Suite Variable  ${OLine62d}
    Set Suite Variable  ${OThirdPartyDesigneeYes}
    Set Suite Variable  ${OThirdPartyDesigneeNo}
    Set Suite Variable  ${ODesigneeName}
    Set Suite Variable  ${ODesigneePhoneNumber}
    Set Suite Variable  ${OPIN1}
    Set Suite Variable  ${OPIN2}
    Set Suite Variable  ${OPIN3}
    Set Suite Variable  ${OPIN4}
    Set Suite Variable  ${OPIN5}
    Set Suite Variable  ${OSaveandContinue}
    Set Suite Variable  ${OLine63a}
    Set Suite Variable  ${OLine63b1}
    Set Suite Variable  ${OLine63b2}
    Set Suite Variable  ${OLine63c1}
    Set Suite Variable  ${OLine63c2}
    Set Suite Variable  ${OLine63d}
    Set Suite Variable  ${OLine63e}
    Set Suite Variable  ${OLine64a}
    Set Suite Variable  ${OLine64b}
    Set Suite Variable  ${OLine64c}
    Set Suite Variable  ${OLine64d}
    Set Suite Variable  ${OLine64e}
    Set Suite Variable  ${OLine65a}
    Set Suite Variable  ${OLine65b}
    Set Suite Variable  ${OLine67a}
    Set Suite Variable  ${OLine67b}
    Set Suite Variable  ${OLine68}
    Set Suite Variable  ${OLine69}
    Set Suite Variable  ${OLine70a}
    Set Suite Variable  ${OLine70b}
    Set Suite Variable  ${OLine71Credit}
    Set Suite Variable  ${OLine71Refund}
    Set Suite Variable  ${OSec2-1}
    Set Suite Variable  ${OSec2-2a}
    Set Suite Variable  ${OSec2-2b}
    Set Suite Variable  ${OSec2-2c}
    Set Suite Variable  ${OSec2-2d}
    Set Suite Variable  ${OSec2-2e}
    Set Suite Variable  ${OSec2-3}
    Set Suite Variable  ${OSec2-4}
    Set Suite Variable  ${OSec2-5}
    Set Suite Variable  ${OSec3-871m}
    Set Suite Variable  ${OSec4-QDD}
    Set Suite Variable  ${OSec4-1}
    Set Suite Variable  ${OSec4-2EIN}