-------------------------------------------------------------------------------------------------------------------------------------------------------------------
LobbyLAR-ReadMe.txt


Flat File Architecture Record Listing  --  Generated 05/05/2016 05:27:41 PM


                                        TEXAS ETHICS COMMISSION
                                   DATA FROM LOBBY ACTIVITIES REPORTS


                                www.ethics.state.tx.us  *  512.463.5800




This file contains information from Lobby Activities reports filed electronically with the Texas Ethics
Commission beginning February 10, 2005, and totals from reports filed on paper from 1993. Most reports
have been filed electronically beginning February 10, 2005, but some are filed on paper. TEC staff enters
totals from the Cover Page of reports filed on paper but does not enter detailed information from the
Schedules. Information from reports which have been superseded by corrected reports is not included. 

   

The data is presented in Comma-separated value (csv) format.



   Record Name               File Contents                                              File Name(s)

   -----------------------   --------------------------------------------------------   ------------

   CoverSheetLaData          Form LA Cover Sheet (totals)                               LaCvr.csv

   IndividualReportingData   Individual Reporting for Entity                            LaI4E.csv

   SubjectMatterData         Subject Matter - Schedule A                                LaSub.csv

   DocketData                Dockets - Schedule A                                       LaDock.csv

   TransportationData        Transportation - Schedule B                                LaTran.csv

   FoodBeverageData          Food / Beverages - Schedule C                              LaFood.csv

   EntertainmentData         Entertainment - Schedule D                                 LaEnt.csv

   GiftData                  Gifts - Schedule E                                         LaGift.csv

   AwardMementoData          Awards / Mementos - Schedule F                             LaAwrd.csv

   EventData                 Events - Schedule G                                        LAEvnt.csv
   
   

NOTES:



   (1)  reportInfoIdent: Unique Report Number assigned by TEC.



   (2)  sourceCategoryCd: ELECTRONIC = Electronic, KEYED = Paper (totals entered by TEC)



   (3)  filerIdent: The filer's account number (assigned by TEC)



   (4)  filerName: The lobbyist name as currently stored in the TEC database. It may have been reported
        differently on the Lobby Activity Report.


 
  (5)  filedDt: The date the report was filed. If filed by U.S. Mail or common carrier, this is the
        postmark date. If the date is not present or illegible, it is blank. If the report is a
        correction, this is the date the correction was filed. Thus, a report with a filedDt after the
        due date is NOT NECESSARILY LATE.


   (6)  receivedDt: The date the report was actually received by the TexasEthics Commission. There are
        circumstances in which a report received after the due date is NOT CONSIDERED LATE. For example,
        a report filed on diskette is timely filed if it is postmarked by the deadline regardless of when
        it is received.



   (7)  filerPersentTypeCd: Lobbyist Entity Code on report:  ENTITY = Entity; INDIVIDUAL = Individual



   (8)  filerNameOrganization: For ENTITY, Lobbyist Entity name as reported in Lobby ActivtiesReport.
 
       filerNameLast/First/Suffix/Prefix: For INDIVIDUAL, Lobbyist person name as reported in Lobby
        ActivtiesReport. The Lobbyist name may have changed since this report. See #4 filerName above
        for most recent name.



   (9)  signerPrintedName: Lobbyist signature



  (10)  onbehalfFlag: Individual Reporting for Entity. Y = Yes; N = No. This field corresponds to the
        checkbox in box 9 on the Cover Sheet of Form LA.



  (11)  regReportInfoIdent:  Report Number of the most recently filed Registration or Amended
        Registration. If regReportInfoIdent is higher than the reportInfoIdent of the LA, then the
        Subject Matter may be superseded. Form LA, Schedule A, Box 4 states "If your lobby 
        communications pertained to subject matters not marked on your original lobby registration 
        or on a previous amendment, check the appropriate boxes."


  (12)  formTypeCd: Type of Form: LOBBYACT (Lobby Activities Report) or CORLOBBYACT (Corrected 
        Lobby Activities Report)



  (13)  reportTypeCd: Type of Report:

              LOBBYACT1000EX - Lobby Activities Exceeded $1000 Report

              LOBBYACTANNUAL - Modified Lobby Activities Report (Annual)

              LOBBYACTmmm - Regular Lobby Activities Report - month

              LOBBYFINAL - Lobby Final Report

              UNKNOWN - Unknown



  (14)  creditCardFlag:  Expenditure made by credit card. (Y=true)

        The LA Instruction Guide states "check this box if the expenditure was made with a credit card.
        This information is required because an expenditure made with a credit card may appear in either
        the report covering the period in which the charge is made or the report covering the period in
        which the credit card statement is received."
        This checkbox was added to Schedules B - G effective August, 2005. If checked, it explains why
        the expenditure date may be outside the period covered by the report. On schedules with no
        expenditure date (B, E, F) an additional box was added to indicate the reporting period in which
        the expenditure was made (see note 15.)


  (15)  lobbyActivityPeriodCd:  The month in which a credit card expenditure was made (see note 14.)
        Lobbyists who file activities reports using the regular (monthly) schedule enter the month in
        which the expenditure occurred. Lobbyists who file on the modified (annual) schedule may enter
        "ANNUAL" to indicate the expenditure was made during the previous year. 



  (16)  activityAmountRangeLow/activityAmountRangeHigh:  On schedules where the amount of the expenditure
        is required, it can be reported by choosing a range from a list. These amounts correspond to the
        lower and higher end of each range. For example, if the list item labeled "Less than than $100"
        was chosen, activityAmountRangeLow will be $0.00, and activityAmountRangeHigh will be $99.99. If
        the list item labeled "$450 but less than $500" was chosen, activityAmountRangeLow will be 
        $450.00, and activityAmountRangeHigh will be $499.99. If an exact amount was given, that amount
        will be in both activityAmountRangeLow and activityAmountRangeHigh.
   
	

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 1     Record Name: CoverSheetLaData     Length: 161353
Description: Form LA Cover Sheet information. 
             NOTE: Records are included only if the due date assigned by TEC staff is after January 10, 2005. Most Lobby Activities reports due
             01/10/2005 were filed on paper;  most reports due afterwards were filed electronically. TEC staff enters totals from the cover 
             page of paper reports, but does not enter any information from the schedules. 
             File: LaCvr.csv

 #  Field Name                                    Type       Mask                             Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- -----------------------------------------------------------------
  1 recordType                                    String                                       20 Record type code - always CVLA                                   
  2 formTypeCd                                    String                                       20 TEC form used                                                    
  3 reportTypeCd                                  String                                       30 Report type                                                      
  4 reportInfoIdent                               Long       00000000000                       11 Unique report #                                                  
  5 applicableYear                                String                                        4 Year applicable                                                  
  6 filerIdent                                    String                                      100 Filer account #                                                  
  7 filerTypeCd                                   String                                       30 Type of filer                                                    
  8 filerName                                     String                                      200 Filer name                                                       
  9 filerSort                                     String                                      200 Filer name for sorting                                           
 10 dueDt                                         Date       yyyyMMdd                           8 Report due date                                                  
 11 receivedDt                                    Date       yyyyMMdd                           8 Date report received by TEC                                      
 12 periodStartDt                                 Date       yyyyMMdd                           8 Beginning of period covered                                      
 13 periodEndDt                                   Date       yyyyMMdd                           8 Ending of period covered                                         
 14 filedDt                                       Date       yyyyMMdd                           8 Date report was filed (postmark)                                 
 15 regReportInfoIdent                            Long       00000000000                       11 Most recent registration report #                                
 16 sourceCategoryCd                              String                                       30 Source of report (ELECTRONIC, KEYED)                             
 17 filerPersentTypeCd                            String                                       30 Type of filer name data - INDIVIDUAL or ENTITY                   
 18 filerNameOrganization                         String                                      100 For ENTITY, the filer organization name                          
 19 filerNameLast                                 String                                      100 For INDIVIDUAL, the filer last name                              
 20 filerNameSuffixCd                             String                                       30 For INDIVIDUAL, the filer name suffix (e.g. JR, MD, II)          
 21 filerNameFirst                                String                                       45 For INDIVIDUAL, the filer first name                             
 22 filerNamePrefixCd                             String                                       30 For INDIVIDUAL, the filer name prefix (e.g. MR, MRS, MS)         
 23 filerNameShort                                String                                       25 For INDIVIDUAL, the filer short name (nickname)                  
 24 signerPrintedName                             String                                      100 Document signer name                                             
 25 onbehalfFlag                                  String                                        1 Indicates if filing on behalf of another entity                  
 26 totalExpendTransportation                     BigDecimal 0000000000.00                     12 Total expend: transportation                                     
 27 totalExpendFood                               BigDecimal 0000000000.00                     12 Total expend: food                                               
 28 totalExpendEntertainment                      BigDecimal 0000000000.00                     12 Total expend: entertainment                                      
 29 totalExpendGift                               BigDecimal 0000000000.00                     12 Total expend: gifts                                              
 30 totalExpendAward                              BigDecimal 0000000000.00                     12 Total expend: awards / mementos                                  
 31 totalExpendEvent                              BigDecimal 0000000000.00                     12 Total expend: pol fundraisers / charity events                   
 32 totalExpendMedia                              BigDecimal 0000000000.00                     12 Total expend: mass media communications                          
 33 totalBenefitStateSen                          BigDecimal 0000000000.00                     12 Total benefits: state senators                                   
 34 totalBenefitStateRep                          BigDecimal 0000000000.00                     12 Total benefits: state representatives                            
 35 totalBenefitOtherElected                      BigDecimal 0000000000.00                     12 Total benefits: other elected/appointed offcls                   
 36 totalBenefitLegEmpl                           BigDecimal 0000000000.00                     12 Total benefits: legislative branch employees                     
 37 totalBenefitExecEmpl                          BigDecimal 0000000000.00                     12 Total benefits: executive agency employees                       
 38 totalBenefitFamily                            BigDecimal 0000000000.00                     12 Total benefits: family of legis/exec branch                      
 39 totalBenefitEvent                             BigDecimal 0000000000.00                     12 Total benefits: events - all legis invited                       
 40 totalBenefitGuest                             BigDecimal 0000000000.00                     12 Total benefits: guests                                           
 41 lobbyistRegisteredDt                          Date       yyyyMMdd                           8 Date lobbyist registered                                         
 42 lobbyistTerminatedDt                          Date       yyyyMMdd                           8 Date lobbyist terminated                                         
 43 corrExplMemo                                  String                                    40000 Explanation of correction                                        
 44 coverSheetMemo                                String                                    40000 Cover sheet memo                                                 
 45 subjectMatterMemo                             String                                    40000 Subject matter memo                                              
 46 docketsMemo                                   String                                    40000 Dockets memo                                                     

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 2     Record Name: IndividualReportingData     Length: 989
Description: Form LA Cover Sheet Box 9 - Indivduals Reporting For Entity. 
             NOTE: Form LA Instructions for this box state Check 'YES' if you are reporting expenditures at the request of an entity that has 
             chosen not to register pursuant to Ethics Commission rule 34.45. If you check 'YES' provide the name, address and phone number of
             the entity. Checking  'YES' indicates that you are reporting not only expenditures attributable to you but also expenditures 
             attributable to the entity listed. 
             File: LaI4E.csv

 #  Field Name                                    Type       Mask                             Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- -----------------------------------------------------------------
  1 recordType                                    String                                       20 Record type code - always I4E                                    
  2 formTypeCd                                    String                                       20 TEC form used                                                    
  3 reportTypeCd                                  String                                       30 Report type                                                      
  4 reportInfoIdent                               Long       00000000000                       11 Unique report #                                                  
  5 applicableYear                                String                                        4 Year applicable                                                  
  6 filerIdent                                    String                                      100 Filer account #                                                  
  7 filerTypeCd                                   String                                       30 Type of filer                                                    
  8 filerName                                     String                                      200 Filer name                                                       
  9 filerSort                                     String                                      200 Filer name for sorting                                           
 10 dueDt                                         Date       yyyyMMdd                           8 Report due date                                                  
 11 receivedDt                                    Date       yyyyMMdd                           8 Date report received by TEC                                      
 12 periodStartDt                                 Date       yyyyMMdd                           8 Beginning of period covered                                      
 13 periodEndDt                                   Date       yyyyMMdd                           8 Ending of period covered                                         
 14 lobbyExpendOnbehalfId                         Long       00000000000                       11 Lobby expend-on-behalf unique identifier                         
 15 onbehalfName                                  String                                      100 Mashed on-behalf of name                                         
 16 onbehalfMailingAddr1                          String                                       55 On-behalf of mailing address - line 1                            
 17 onbehalfMailingAddr2                          String                                       55 On-behalf of mailing address - line 2                            
 18 onbehalfMailingCity                           String                                       30 On-behalf of mailing address - city                              
 19 onbehalfMailingStateCd                        String                                        2 On-behalf of mailing address - state code (e.g. TX, CA) - for    
                                                                                                  country=USA/UMI only
 20 onbehalfMailingCountyCd                       String                                        5 On-behalf of mailing address - Texas county                      
 21 onbehalfMailingCountryCd                      String                                        3 On-behalf of mailing address - country (e.g. USA, UMI, MEX, CAN) 
 22 onbehalfMailingPostalCode                     String                                       20 On-behalf of mailing address - postal code - USA addresses only  
 23 onbehalfMailingRegion                         String                                       30 On-behalf of mailing address - region for country other than USA 
 24 onbehalfPrimaryUsaPhoneFlag                   String                                        1 On-behalf of primary phone number - Y if number is a USA phone, N
                                                                                                  otherwise
 25 onbehalfPrimaryPhoneNumber                    String                                       20 On-behalf of primary phone number                                
 26 onbehalfPrimaryPhoneExt                       String                                       10 On-behalf of primary phone extension                             

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 3     Record Name: SubjectMatterData     Length: 908
Description: Form LA Schedule A - Subject Matter Categories. 
             NOTE: Form LA Schedule A Box 4 states If your lobby communications pertained to subject matters not marked on your original lobby
             registration or on a previous amendment, check the appropriate boxes. Unlike other tables in this document, subject matter is 
             based on the Year Applicable rather than due date. This information was not entered from paper reports prior to the year 2000. 
             File: LaSub.csv

 #  Field Name                                    Type       Mask                             Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- -----------------------------------------------------------------
  1 recordType                                    String                                       20 Record type code - always SUB                                    
  2 formTypeCd                                    String                                       20 TEC form used                                                    
  3 reportTypeCd                                  String                                       30 Report type                                                      
  4 reportInfoIdent                               Long       00000000000                       11 Unique report #                                                  
  5 applicableYear                                String                                        4 Year applicable                                                  
  6 filerIdent                                    String                                      100 Filer account #                                                  
  7 filerTypeCd                                   String                                       30 Type of filer                                                    
  8 filerName                                     String                                      200 Filer name                                                       
  9 filerSort                                     String                                      200 Filer name for sorting                                           
 10 dueDt                                         Date       yyyyMMdd                           8 Report due date                                                  
 11 receivedDt                                    Date       yyyyMMdd                           8 Date report received by TEC                                      
 12 periodStartDt                                 Date       yyyyMMdd                           8 Beginning of period covered                                      
 13 periodEndDt                                   Date       yyyyMMdd                           8 Ending of period covered                                         
 14 lobbyFormType                                 String                                       20 TEC Lobby Form Used                                              
 15 lobbySubjectmatterId                          Long       00000000000                       11 Lobby subject matter unique identifier                           
 16 subjectMatterCd                               String                                       30 Subject matter code                                              
 17 subjectMatterCodeValue                        String                                      100 Code table lookup of subject matter code                         
 18 subjectMatterDescr                            String                                      100 Description of other subject matter                              

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 4     Record Name: DocketData     Length: 878
Description: Form LA Schedule A - Docket Nos or Other Designation. 
             NOTE: Form LA Instructions for this box state List the docket number and the name of the state agency at which any administrative
             matter is pending about which you, anyone you retain or employ to appear on your behalf, or anyone who appears on your behalf 
             communicated with an officer of the executive or legislative branch of state government during the reporting period. 
             File: LaDock.csv

 #  Field Name                                    Type       Mask                             Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- -----------------------------------------------------------------
  1 recordType                                    String                                       20 Record type code - always DOCK                                   
  2 formTypeCd                                    String                                       20 TEC form used                                                    
  3 reportTypeCd                                  String                                       30 Report type                                                      
  4 reportInfoIdent                               Long       00000000000                       11 Unique report #                                                  
  5 applicableYear                                String                                        4 Year applicable                                                  
  6 filerIdent                                    String                                      100 Filer account #                                                  
  7 filerTypeCd                                   String                                       30 Type of filer                                                    
  8 filerName                                     String                                      200 Filer name                                                       
  9 filerSort                                     String                                      200 Filer name for sorting                                           
 10 dueDt                                         Date       yyyyMMdd                           8 Report due date                                                  
 11 receivedDt                                    Date       yyyyMMdd                           8 Date report received by TEC                                      
 12 periodStartDt                                 Date       yyyyMMdd                           8 Beginning of period covered                                      
 13 periodEndDt                                   Date       yyyyMMdd                           8 Ending of period covered                                         
 14 lobbyFormType                                 String                                       20 TEC Lobby Form Used                                              
 15 lobbyDocketdesigId                            Long       00000000000                       11 Lobby docket designation unique identifier                       
 16 designationText                               String                                      100 Docket designation text                                          
 17 agencyName                                    String                                      100 Agency name                                                      

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 5     Record Name: TransportationData     Length: 1872
Description: Form LA Schedule B - Transportation and Lodging. 
             File: LaTran.csv

 #  Field Name                                    Type       Mask                             Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- -----------------------------------------------------------------
  1 recordType                                    String                                       20 Record type code - always TRAN                                   
  2 formTypeCd                                    String                                       20 TEC form used                                                    
  3 reportTypeCd                                  String                                       30 Report type                                                      
  4 reportInfoIdent                               Long       00000000000                       11 Unique report #                                                  
  5 applicableYear                                String                                        4 Year applicable                                                  
  6 filerIdent                                    String                                      100 Filer account #                                                  
  7 filerTypeCd                                   String                                       30 Type of filer                                                    
  8 filerName                                     String                                      200 Filer name                                                       
  9 filerSort                                     String                                      200 Filer name for sorting                                           
 10 dueDt                                         Date       yyyyMMdd                           8 Report due date                                                  
 11 receivedDt                                    Date       yyyyMMdd                           8 Date report received by TEC                                      
 12 periodStartDt                                 Date       yyyyMMdd                           8 Beginning of period covered                                      
 13 periodEndDt                                   Date       yyyyMMdd                           8 Ending of period covered                                         
 14 lobbyActivityId                               Long       00000000000                       11 Lobby activity unique identifier                                 
 15 lobactivityTravelId                           Long       00000000000                       11 Lobby activity travel unique identifier                          
 16 creditCardFlag                                String                                        1 Credit card used                                                 
 17 lobbyActivityPeriodCd                         String                                       30 Lobby activity period                                            
 18 recipientPersentTypeCd                        String                                       30 Type of recipient name data - INDIVIDUAL or ENTITY               
 19 recipientNameOrganization                     String                                      100 For ENTITY, the recipient organization name                      
 20 recipientNameLast                             String                                      100 For INDIVIDUAL, the recipient last name                          
 21 recipientNameSuffixCd                         String                                       30 For INDIVIDUAL, the recipient name suffix (e.g. JR, MD, II)      
 22 recipientNameFirst                            String                                       45 For INDIVIDUAL, the recipient first name                         
 23 recipientNamePrefixCd                         String                                       30 For INDIVIDUAL, the recipient name prefix (e.g. MR, MRS, MS)     
 24 recipientNameShort                            String                                       25 For INDIVIDUAL, the recipient short name (nickname)              
 25 lodgingName                                   String                                      100 Name of lodging establishment                                    
 26 lodgingStreetAddr1                            String                                       55 Lodging street address - line 1                                  
 27 lodgingStreetAddr2                            String                                       55 Lodging street address - line 2                                  
 28 lodgingStreetCity                             String                                       30 Lodging street address - city                                    
 29 lodgingStreetStateCd                          String                                        2 Lodging street address - state code (e.g. TX, CA) - for          
                                                                                                  country=USA/UMI only
 30 lodgingStreetCountryCd                        String                                        3 Lodging street address - country (e.g. USA, UMI, MEX, CAN)       
 31 lodgingStreetPostalCode                       String                                       20 Lodging street address - postal code - for USA addresses only    
 32 lodgingStreetRegion                           String                                       30 Lodging street address - region for country other than USA       
 33 checkInDt                                     Date       yyyyMMdd                           8 Check in date                                                    
 34 checkOutDt                                    Date       yyyyMMdd                           8 Check out date                                                   
 35 transportationTypeCd                          String                                       30 Type of transportation (COMMAIR, PRIVAIR, etc)                   
 36 transportationTypeDescr                       String                                      100 Transporation type description                                   
 37 departureCity                                 String                                       50 Departure city                                                   
 38 departureDt                                   Date       yyyyMMdd                           8 Departure date                                                   
 39 arrivalCity                                   String                                       50 Arrival city                                                     
 40 arrivalDt                                     Date       yyyyMMdd                           8 Arrival date                                                     
 41 travelPurpose                                 String                                      255 Purpose of travel                                                

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 6     Record Name: FoodBeverageData     Length: 1278
Description: Form LA Schedule C - Food and Beverages. 
             File: LaFood.csv

 #  Field Name                                    Type       Mask                             Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- -----------------------------------------------------------------
  1 recordType                                    String                                       20 Record type code - always FOOD                                   
  2 formTypeCd                                    String                                       20 TEC form used                                                    
  3 reportTypeCd                                  String                                       30 Report type                                                      
  4 reportInfoIdent                               Long       00000000000                       11 Unique report #                                                  
  5 applicableYear                                String                                        4 Year applicable                                                  
  6 filerIdent                                    String                                      100 Filer account #                                                  
  7 filerTypeCd                                   String                                       30 Type of filer                                                    
  8 filerName                                     String                                      200 Filer name                                                       
  9 filerSort                                     String                                      200 Filer name for sorting                                           
 10 dueDt                                         Date       yyyyMMdd                           8 Report due date                                                  
 11 receivedDt                                    Date       yyyyMMdd                           8 Date report received by TEC                                      
 12 periodStartDt                                 Date       yyyyMMdd                           8 Beginning of period covered                                      
 13 periodEndDt                                   Date       yyyyMMdd                           8 Ending of period covered                                         
 14 lobbyActivityId                               Long       00000000000                       11 Lobby activity unique identifier                                 
 15 creditCardFlag                                String                                        1 Credit card used                                                 
 16 activityDate                                  Date       yyyyMMdd                           8 Activity Date                                                    
 17 activityAmountCd                              String                                       30 Activity amount range                                            
 18 activityExactAmount                           BigDecimal 0000000000.00                     12 Exact activity amount                                            
 19 activityAmountRangeLow                        BigDecimal 0000000000.00                     12 Low end of activity amount range                                 
 20 activityAmountRangeHigh                       BigDecimal 0000000000.00                     12 High end of activity amount range                                
 21 recipientPersentTypeCd                        String                                       30 Type of recipient name data - INDIVIDUAL or ENTITY               
 22 recipientNameOrganization                     String                                      100 For ENTITY, the recipient organization name                      
 23 recipientNameLast                             String                                      100 For INDIVIDUAL, the recipient last name                          
 24 recipientNameSuffixCd                         String                                       30 For INDIVIDUAL, the recipient name suffix (e.g. JR, MD, II)      
 25 recipientNameFirst                            String                                       45 For INDIVIDUAL, the recipient first name                         
 26 recipientNamePrefixCd                         String                                       30 For INDIVIDUAL, the recipient name prefix (e.g. MR, MRS, MS)     
 27 recipientNameShort                            String                                       25 For INDIVIDUAL, the recipient short name (nickname)              
 28 restaurantName                                String                                      100 Name of restaurant establishment                                 
 29 restaurantStreetCity                          String                                       30 Restaurant street address - city                                 
 30 restaurantStreetStateCd                       String                                        2 Restaurant street address - state code (e.g. TX, CA) - for       
                                                                                                  country=USA/UMI only
 31 restaurantStreetCountryCd                     String                                        3 Restaurant street address - country (e.g. USA, UMI, MEX, CAN)    
 32 restaurantStreetPostalCode                    String                                       20 Restaurant street address - postal code - for USA addresses only 
 33 restaurantStreetRegion                        String                                       30 Restaurant street address - region for country other than USA    

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 7     Record Name: EntertainmentData     Length: 1388
Description: Form LA Schedule D - Entertainment. 
             File: LaEnt.csv

 #  Field Name                                    Type       Mask                             Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- -----------------------------------------------------------------
  1 recordType                                    String                                       20 Record type code - always ENT                                    
  2 formTypeCd                                    String                                       20 TEC form used                                                    
  3 reportTypeCd                                  String                                       30 Report type                                                      
  4 reportInfoIdent                               Long       00000000000                       11 Unique report #                                                  
  5 applicableYear                                String                                        4 Year applicable                                                  
  6 filerIdent                                    String                                      100 Filer account #                                                  
  7 filerTypeCd                                   String                                       30 Type of filer                                                    
  8 filerName                                     String                                      200 Filer name                                                       
  9 filerSort                                     String                                      200 Filer name for sorting                                           
 10 dueDt                                         Date       yyyyMMdd                           8 Report due date                                                  
 11 receivedDt                                    Date       yyyyMMdd                           8 Date report received by TEC                                      
 12 periodStartDt                                 Date       yyyyMMdd                           8 Beginning of period covered                                      
 13 periodEndDt                                   Date       yyyyMMdd                           8 Ending of period covered                                         
 14 lobbyActivityId                               Long       00000000000                       11 Lobby activity unique identifier                                 
 15 creditCardFlag                                String                                        1 Credit card used                                                 
 16 activityDate                                  Date       yyyyMMdd                           8 Activity Date                                                    
 17 activityAmountCd                              String                                       30 Activity amount range                                            
 18 activityExactAmount                           BigDecimal 0000000000.00                     12 Exact activity amount                                            
 19 activityAmountRangeLow                        BigDecimal 0000000000.00                     12 Low end of activity amount range                                 
 20 activityAmountRangeHigh                       BigDecimal 0000000000.00                     12 High end of activity amount range                                
 21 recipientPersentTypeCd                        String                                       30 Type of recipient name data - INDIVIDUAL or ENTITY               
 22 recipientNameOrganization                     String                                      100 For ENTITY, the recipient organization name                      
 23 recipientNameLast                             String                                      100 For INDIVIDUAL, the recipient last name                          
 24 recipientNameSuffixCd                         String                                       30 For INDIVIDUAL, the recipient name suffix (e.g. JR, MD, II)      
 25 recipientNameFirst                            String                                       45 For INDIVIDUAL, the recipient first name                         
 26 recipientNamePrefixCd                         String                                       30 For INDIVIDUAL, the recipient name prefix (e.g. MR, MRS, MS)     
 27 recipientNameShort                            String                                       25 For INDIVIDUAL, the recipient short name (nickname)              
 28 entertainmentName                             String                                      100 Name of entertainment establishment                              
 29 entertainmentStreetAddr1                      String                                       55 Entertainment street address - line 1                            
 30 entertainmentStreetAddr2                      String                                       55 Entertainment street address - line 2                            
 31 entertainmentStreetCity                       String                                       30 Entertainment street address - city                              
 32 entertainmentStreetStateCd                    String                                        2 Entertainment street address - state code (e.g. TX, CA) - for    
                                                                                                  country=USA/UMI only
 33 entertainmentStreetCountryCd                  String                                        3 Entertainment street address - country (e.g. USA, UMI, MEX, CAN) 
 34 entertainmentStreetPostalCode                 String                                       20 Entertainment street address - postal code - for USA addresses   
                                                                                                  only
 35 entertainmentStreetRegion                     String                                       30 Entertainment street address - region for country other than USA 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 8     Record Name: GiftData     Length: 1215
Description: Form LA Schedule E - Gifts. 
             File: LaGift.csv

 #  Field Name                                    Type       Mask                             Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- -----------------------------------------------------------------
  1 recordType                                    String                                       20 Record type code - always GIFT                                   
  2 formTypeCd                                    String                                       20 TEC form used                                                    
  3 reportTypeCd                                  String                                       30 Report type                                                      
  4 reportInfoIdent                               Long       00000000000                       11 Unique report #                                                  
  5 applicableYear                                String                                        4 Year applicable                                                  
  6 filerIdent                                    String                                      100 Filer account #                                                  
  7 filerTypeCd                                   String                                       30 Type of filer                                                    
  8 filerName                                     String                                      200 Filer name                                                       
  9 filerSort                                     String                                      200 Filer name for sorting                                           
 10 dueDt                                         Date       yyyyMMdd                           8 Report due date                                                  
 11 receivedDt                                    Date       yyyyMMdd                           8 Date report received by TEC                                      
 12 periodStartDt                                 Date       yyyyMMdd                           8 Beginning of period covered                                      
 13 periodEndDt                                   Date       yyyyMMdd                           8 Ending of period covered                                         
 14 lobbyActivityId                               Long       00000000000                       11 Lobby activity unique identifier                                 
 15 creditCardFlag                                String                                        1 Credit card used                                                 
 16 lobbyActivityPeriodCd                         String                                       30 Lobby activity period                                            
 17 activityDescription                           String                                      100 Activity description                                             
 18 activityAmountCd                              String                                       30 Activity amount range                                            
 19 activityExactAmount                           BigDecimal 0000000000.00                     12 Exact activity amount                                            
 20 activityAmountRangeLow                        BigDecimal 0000000000.00                     12 Low end of activity amount range                                 
 21 activityAmountRangeHigh                       BigDecimal 0000000000.00                     12 High end of activity amount range                                
 22 recipientPersentTypeCd                        String                                       30 Type of recipient name data - INDIVIDUAL or ENTITY               
 23 recipientNameOrganization                     String                                      100 For ENTITY, the recipient organization name                      
 24 recipientNameLast                             String                                      100 For INDIVIDUAL, the recipient last name                          
 25 recipientNameSuffixCd                         String                                       30 For INDIVIDUAL, the recipient name suffix (e.g. JR, MD, II)      
 26 recipientNameFirst                            String                                       45 For INDIVIDUAL, the recipient first name                         
 27 recipientNamePrefixCd                         String                                       30 For INDIVIDUAL, the recipient name prefix (e.g. MR, MRS, MS)     
 28 recipientNameShort                            String                                       25 For INDIVIDUAL, the recipient short name (nickname)              

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 9     Record Name: AwardMementoData     Length: 1215
Description: Form LA Schedule F - Awards / Mementos. 
             File: LaAwrd.csv

 #  Field Name                                    Type       Mask                             Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- -----------------------------------------------------------------
  1 recordType                                    String                                       20 Record type code - always AWRD                                   
  2 formTypeCd                                    String                                       20 TEC form used                                                    
  3 reportTypeCd                                  String                                       30 Report type                                                      
  4 reportInfoIdent                               Long       00000000000                       11 Unique report #                                                  
  5 applicableYear                                String                                        4 Year applicable                                                  
  6 filerIdent                                    String                                      100 Filer account #                                                  
  7 filerTypeCd                                   String                                       30 Type of filer                                                    
  8 filerName                                     String                                      200 Filer name                                                       
  9 filerSort                                     String                                      200 Filer name for sorting                                           
 10 dueDt                                         Date       yyyyMMdd                           8 Report due date                                                  
 11 receivedDt                                    Date       yyyyMMdd                           8 Date report received by TEC                                      
 12 periodStartDt                                 Date       yyyyMMdd                           8 Beginning of period covered                                      
 13 periodEndDt                                   Date       yyyyMMdd                           8 Ending of period covered                                         
 14 lobbyActivityId                               Long       00000000000                       11 Lobby activity unique identifier                                 
 15 creditCardFlag                                String                                        1 Credit card used                                                 
 16 lobbyActivityPeriodCd                         String                                       30 Lobby activity period                                            
 17 activityDescription                           String                                      100 Activity description                                             
 18 activityAmountCd                              String                                       30 Activity amount range                                            
 19 activityExactAmount                           BigDecimal 0000000000.00                     12 Exact activity amount                                            
 20 activityAmountRangeLow                        BigDecimal 0000000000.00                     12 Low end of activity amount range                                 
 21 activityAmountRangeHigh                       BigDecimal 0000000000.00                     12 High end of activity amount range                                
 22 recipientPersentTypeCd                        String                                       30 Type of recipient name data - INDIVIDUAL or ENTITY               
 23 recipientNameOrganization                     String                                      100 For ENTITY, the recipient organization name                      
 24 recipientNameLast                             String                                      100 For INDIVIDUAL, the recipient last name                          
 25 recipientNameSuffixCd                         String                                       30 For INDIVIDUAL, the recipient name suffix (e.g. JR, MD, II)      
 26 recipientNameFirst                            String                                       45 For INDIVIDUAL, the recipient first name                         
 27 recipientNamePrefixCd                         String                                       30 For INDIVIDUAL, the recipient name prefix (e.g. MR, MRS, MS)     
 28 recipientNameShort                            String                                       25 For INDIVIDUAL, the recipient short name (nickname)              

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 10     Record Name: EventData     Length: 1517
Description: Form LA Schedule G - Pol. Fundraisers and Charity Events. 
             File: LaEvnt.csv

 #  Field Name                                    Type       Mask                             Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- -----------------------------------------------------------------
  1 recordType                                    String                                       20 Record type code - always EVNT                                   
  2 formTypeCd                                    String                                       20 TEC form used                                                    
  3 reportTypeCd                                  String                                       30 Report type                                                      
  4 reportInfoIdent                               Long       00000000000                       11 Unique report #                                                  
  5 applicableYear                                String                                        4 Year applicable                                                  
  6 filerIdent                                    String                                      100 Filer account #                                                  
  7 filerTypeCd                                   String                                       30 Type of filer                                                    
  8 filerName                                     String                                      200 Filer name                                                       
  9 filerSort                                     String                                      200 Filer name for sorting                                           
 10 dueDt                                         Date       yyyyMMdd                           8 Report due date                                                  
 11 receivedDt                                    Date       yyyyMMdd                           8 Date report received by TEC                                      
 12 periodStartDt                                 Date       yyyyMMdd                           8 Beginning of period covered                                      
 13 periodEndDt                                   Date       yyyyMMdd                           8 Ending of period covered                                         
 14 lobbyActivityId                               Long       00000000000                       11 Lobby activity unique identifier                                 
 15 creditCardFlag                                String                                        1 Credit card used                                                 
 16 activityDate                                  Date       yyyyMMdd                           8 Activity Date                                                    
 17 activityDescription                           String                                      100 Activity description                                             
 18 lobbyEventKindCd                              String                                       30 Fundraiser/charity indicator                                     
 19 recipientPersentTypeCd                        String                                       30 Type of recipient name data - INDIVIDUAL or ENTITY               
 20 recipientNameOrganization                     String                                      100 For ENTITY, the recipient organization name                      
 21 recipientNameLast                             String                                      100 For INDIVIDUAL, the recipient last name                          
 22 recipientNameSuffixCd                         String                                       30 For INDIVIDUAL, the recipient name suffix (e.g. JR, MD, II)      
 23 recipientNameFirst                            String                                       45 For INDIVIDUAL, the recipient first name                         
 24 recipientNamePrefixCd                         String                                       30 For INDIVIDUAL, the recipient name prefix (e.g. MR, MRS, MS)     
 25 recipientNameShort                            String                                       25 For INDIVIDUAL, the recipient short name (nickname)              
 26 beneficiaryPersentTypeCd                      String                                       30 Type of beneficiary name data - INDIVIDUAL or ENTITY             
 27 beneficiaryNameOrganization                   String                                      100 For ENTITY, the beneficiary organization name                    
 28 beneficiaryNameLast                           String                                      100 For INDIVIDUAL, the beneficiary last name                        
 29 beneficiaryNameSuffixCd                       String                                       30 For INDIVIDUAL, the beneficiary name suffix (e.g. JR, MD, II)    
 30 beneficiaryNameFirst                          String                                       45 For INDIVIDUAL, the beneficiary first name                       
 31 beneficiaryNamePrefixCd                       String                                       30 For INDIVIDUAL, the beneficiary name prefix (e.g. MR, MRS, MS)   
 32 beneficiaryNameShort                          String                                       25 For INDIVIDUAL, the beneficiary short name (nickname)            

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Legend:
 Type: Data type for the field.
 Mask: For numeric and date fields, a DecimalFormat or SimpleDateFormat mask. BWZ indicates 'Blank When Zero'
 Len: Length of the field.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
