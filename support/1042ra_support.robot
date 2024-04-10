
*** Settings ***
Library      OperatingSystem
Library      associatelib.py
Library      Pdfvalidation.py
Library      OTAvalidation.py
Library      String 
Library      DateTime
Library      RPA.Excel.Files
Library      SeleniumLibrary
Library      XML
Library      Collections
Resource     common.resource
Resource     commonKeywords.resource
Resource     Form1042RA/1042ra.robot
Resource     Form1042/Form1042Locators.robot


*** Keywords ***
ssettings
  
  ${logid}=   logid
  Set Environment Variable     logid     ${logid}
  ${time}  time
  Set Environment Variable  starttime  ${time}