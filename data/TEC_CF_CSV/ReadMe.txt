-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

                        TEXAS ETHICS COMMISSION
         DATA FROM ELECTRONICALLY FILED CAMPAIGN FINANCE REPORTS
             www.ethics.state.tx.us  *   512.463.5800

This zip package contains detailed information from campaign finance reports
filed electronically with the Texas Ethics Commission beginning July 1, 2000.


Flat File Architecture Record Listing  --  Generated 07/19/2023 03:29:41 PM


   Record Name        File Contents                                                      File Name(s)

----------------   ----------------------------------------------------------------   ---------------------------------------------------------

AssetData          Assets - Schedule M                                                assets.csv

CandidateData      Direct Campaign Expenditure Candidates                             cand.csv

ContributionData   Contributions - Schedules A/C                                      contribs_##.csv, cont_ss.csv, cont_t.csv, returns.csv

CoverSheet1Data    Cover Sheet 1 - Cover sheet information and totals                 cover.csv, cover_ss.csv, cover_t.csv

CoverSheet2Data    Cover Sheet 2 - Notices received by candidates/office holders      notices.csv

CoverSheet3Data    Cover Sheet 3 - Committee purpose                                  purpose.csv

CreditData         Credits - Schedule K                                               credits.csv

DebtData           Debts - Schedule L                                                 debts.csv

ExpendData         Expenditures - Schedules F/G/H/I                                   expend_##.csv, expn_t.csv

ExpendCategory     Expenditure category codes                                         expn_catg.csv

FilerData          Filer index                                                        filers.csv

FinalData          Final reports                                                      final.csv

LoanData           Loans - Schedule E                                                 loans.csv

PledgeData         Pledges - Schedule B                                               pledges.csv, pldg_ss.csv, pldg_t.csv

SpacData           Index of Specific-purpose committees                               spacs.csv

TravelData         Travel outside the State of Texas - Schedule T                     travel.csv
	

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 1     Record Name: AssetData     Length: 521
Description: Assets - Schedule M - Assets valued at $500 or more for judicial filers only.
             File: assets.csv

 #  Field Name                                    Type       Mask                           Start   Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- ----- -----------------------------------------------------------------
  1 recordType                                    String                                        1    20 Record type code - always ASSET                                  
  2 formTypeCd                                    String                                       21    20 TEC form used                                                    
  3 schedFormTypeCd                               String                                       41    20 TEC Schedule Used                                                
  4 reportInfoIdent                               Long       00000000000                       61    11 Unique report #                                                  
  5 receivedDt                                    Date       yyyyMMdd                          72     8 Date report received by TEC                                      
  6 infoOnlyFlag                                  String                                       80     1 Superseded by other report                                       
  7 filerIdent                                    String                                       81   100 Filer account #                                                  
  8 filerTypeCd                                   String                                      181    30 Type of filer                                                    
  9 filerName                                     String                                      211   200 Filer name                                                       
 10 assetInfoId                                   Long       00000000000                      411    11 Asset unique identifier                                          
 11 assetDescr                                    String                                      422   100 Description of asset                                             

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 2     Record Name: CandidateData     Length: 1590
Description: Candidate benefiting from a direct campaign expenditure. A direct campaign expenditure to benefit a candidate is not a political 
             contribution to that candidate. Instead, a direct campaign expenditure is a campaign expenditure made on someone else's behalf and
             without the prior consent or approval of that person. A given EXPN record can have zero or more related CAND records. Any CAND 
             records are written to the file immediately after their related EXPN record.
             File: cand.csv

 #  Field Name                                    Type       Mask                           Start   Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- ----- -----------------------------------------------------------------
  1 recordType                                    String                                        1    20 Record type code - always CAND                                   
  2 formTypeCd                                    String                                       21    20 TEC form used                                                    
  3 schedFormTypeCd                               String                                       41    20 TEC Schedule Used                                                
  4 reportInfoIdent                               Long       00000000000                       61    11 Unique report #                                                  
  5 receivedDt                                    Date       yyyyMMdd                          72     8 Date report received by TEC                                      
  6 infoOnlyFlag                                  String                                       80     1 Superseded by other report                                       
  7 filerIdent                                    String                                       81   100 Filer account #                                                  
  8 filerTypeCd                                   String                                      181    30 Type of filer                                                    
  9 filerName                                     String                                      211   200 Filer name                                                       
 10 expendInfoId                                  Long       00000000000                      411    11 Expenditure unique identifier                                    
 11 expendPersentId                               Long       00000000000                      422    11 Candidate unique identifier                                      
 12 expendDt                                      Date       yyyyMMdd                         433     8 Expenditure date                                                 
 13 expendAmount                                  BigDecimal 0000000000.00                    441    12 Expenditure amount                                               
 14 expendDescr                                   String                                      453   100 Expenditure description                                          
 15 expendCatCd                                   String                                      553    30 Expenditure category code                                        
 16 expendCatDescr                                String                                      583   100 Expenditure category description                                 
 17 itemizeFlag                                   String                                      683     1 Y indicates that the expenditure is itemized                     
 18 politicalExpendCd                             String                                      684    30 Political expenditure indicator                                  
 19 reimburseIntendedFlag                         String                                      714     1 Reimbursement intended indicator                                 
 20 srcCorpContribFlag                            String                                      715     1 Expenditure from corporate funds indicator                       
 21 capitalLivingexpFlag                          String                                      716     1 Austin living expense indicator                                  
 22 candidatePersentTypeCd                        String                                      717    30 Type of candidate name data - INDIVIDUAL or ENTITY               
 23 candidateNameOrganization                     String                                      747   100 For ENTITY, the candidate organization name                      
 24 candidateNameLast                             String                                      847   100 For INDIVIDUAL, the candidate last name                          
 25 candidateNameSuffixCd                         String                                      947    30 For INDIVIDUAL, the candidate name suffix (e.g. JR, MD, II)      
 26 candidateNameFirst                            String                                      977    45 For INDIVIDUAL, the candidate first name                         
 27 candidateNamePrefixCd                         String                                     1022    30 For INDIVIDUAL, the candidate name prefix (e.g. MR, MRS, MS)     
 28 candidateNameShort                            String                                     1052    25 For INDIVIDUAL, the candidate short name (nickname)              
 29 candidateHoldOfficeCd                         String                                     1077    30 Candidate office held                                            
 30 candidateHoldOfficeDistrict                   String                                     1107    11 Candidate office held district                                   
 31 candidateHoldOfficePlace                      String                                     1118    11 Candidate office held place                                      
 32 candidateHoldOfficeDescr                      String                                     1129   100 Candidate office held description                                
 33 candidateHoldOfficeCountyCd                   String                                     1229     5 Candidate office held country code                               
 34 candidateHoldOfficeCountyDescr                String                                     1234   100 Candidate office help county description                         
 35 candidateSeekOfficeCd                         String                                     1334    30 Candidate office sought                                          
 36 candidateSeekOfficeDistrict                   String                                     1364    11 Candidate office sought district                                 
 37 candidateSeekOfficePlace                      String                                     1375    11 Candidate office sought place                                    
 38 candidateSeekOfficeDescr                      String                                     1386   100 Candidate office sought description                              
 39 candidateSeekOfficeCountyCd                   String                                     1486     5 Candidate office sought county code                              
 40 candidateSeekOfficeCountyDescr                String                                     1491   100 Candidate office sought county description                       

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 3     Record Name: ContributionData     Length: 1426
Description: Contributions - Schedules A/C - Contributions from special session and special pre-election (formerly Telegram) reports are stored
             in the file cont_ss and cont_t. These records are kept separate from the contribs files to avoid creating duplicates, because they
             are supposed to be re-reported on the next regular campaign finance report.
             Files: contribs_##.csv, cont_ss.csv, cont_t.csv

 #  Field Name                                    Type       Mask                           Start   Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- ----- -----------------------------------------------------------------
  1 recordType                                    String                                        1    20 Record type code - always RCPT                                   
  2 formTypeCd                                    String                                       21    20 TEC form used                                                    
  3 schedFormTypeCd                               String                                       41    20 TEC Schedule Used                                                
  4 reportInfoIdent                               Long       00000000000                       61    11 Unique report #                                                  
  5 receivedDt                                    Date       yyyyMMdd                          72     8 Date report received by TEC                                      
  6 infoOnlyFlag                                  String                                       80     1 Superseded by other report                                       
  7 filerIdent                                    String                                       81   100 Filer account #                                                  
  8 filerTypeCd                                   String                                      181    30 Type of filer                                                    
  9 filerName                                     String                                      211   200 Filer name                                                       
 10 contributionInfoId                            Long       00000000000                      411    11 Contribution unique identifier                                   
 11 contributionDt                                Date       yyyyMMdd                         422     8 Contribution date                                                
 12 contributionAmount                            BigDecimal 0000000000.00                    430    12 Contribution amount                                              
 13 contributionDescr                             String                                      442   100 Contribution description                                         
 14 itemizeFlag                                   String                                      542     1 Y indicates that the contribution is itemized                    
 15 travelFlag                                    String                                      543     1 Y indicates that the contribution has associated travel          
 16 contributorPersentTypeCd                      String                                      544    30 Type of contributor name data - INDIVIDUAL or ENTITY             
 17 contributorNameOrganization                   String                                      574   100 For ENTITY, the contributor organization name                    
 18 contributorNameLast                           String                                      674   100 For INDIVIDUAL, the contributor last name                        
 19 contributorNameSuffixCd                       String                                      774    30 For INDIVIDUAL, the contributor name suffix (e.g. JR, MD, II)    
 20 contributorNameFirst                          String                                      804    45 For INDIVIDUAL, the contributor first name                       
 21 contributorNamePrefixCd                       String                                      849    30 For INDIVIDUAL, the contributor name prefix (e.g. MR, MRS, MS)   
 22 contributorNameShort                          String                                      879    25 For INDIVIDUAL, the contributor short name (nickname)            
 23 contributorStreetCity                         String                                      904    30 Contributor street address - city                                
 24 contributorStreetStateCd                      String                                      934     2 Contributor street address - state code (e.g. TX, CA) - for      
                                                                                                  country=USA/UMI only
 25 contributorStreetCountyCd                     String                                      936     5 Contributor street address - Texas county                        
 26 contributorStreetCountryCd                    String                                      941     3 Contributor street address - country (e.g. USA, UMI, MEX, CAN)   
 27 contributorStreetPostalCode                   String                                      944    20 Contributor street address - postal code - for USA addresses only
 28 contributorStreetRegion                       String                                      964    30 Contributor street address - region for country other than USA   
 29 contributorEmployer                           String                                      994    60 Contributor employer                                             
 30 contributorOccupation                         String                                     1054    60 Contributor occupation                                           
 31 contributorJobTitle                           String                                     1114    60 Contributor job title                                            
 32 contributorPacFein                            String                                     1174    12 FEC ID of out-of-state PAC contributor                           
 33 contributorOosPacFlag                         String                                     1186     1 Indicates if contributor is an out-of-state PAC                  
 34 contributorLawFirmName                        String                                     1187    60 Contributor law firm name                                        
 35 contributorSpouseLawFirmName                  String                                     1247    60 Contributor spouse law firm name                                 
 36 contributorParent1LawFirmName                 String                                     1307    60 Contributor parent #1 law firm name                              
 37 contributorParent2LawFirmName                 String                                     1367    60 Contributor parent #2 law firm name                              

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 4     Record Name: CoverSheet1Data     Length: 4001
Description: Cover Sheet 1 - Cover sheet information and totals. cover_ss and cover_t contain cover sheet information for special session 
             reports and special pre-election (formerly Telegram) Reports. Cover sheets for these reports do not contain totals.
             Files: cover.csv, cover_ss.csv, cover_t.csv

 #  Field Name                                    Type       Mask                           Start   Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- ----- -----------------------------------------------------------------
  1 recordType                                    String                                        1    20 Record type code - always CVR1                                   
  2 formTypeCd                                    String                                       21    20 TEC form used                                                    
  3 reportInfoIdent                               Long       00000000000                       41    11 Unique report #                                                  
  4 receivedDt                                    Date       yyyyMMdd                          52     8 Date report received by TEC                                      
  5 infoOnlyFlag                                  String                                       60     1 Superseded by other report                                       
  6 filerIdent                                    String                                       61   100 Filer account #                                                  
  7 filerTypeCd                                   String                                      161    30 Type of filer                                                    
  8 filerName                                     String                                      191   200 Filer name                                                       

    Array                                                                                           300
    reportTypeCd[10]                              String                                             30 Report types covered (maximum 10)                                
  9    reportTypeCd                               String                                      391    30 Report type covered                                              
 10 sourceCategoryCd                              String                                      691    30 Source of report (ELECTRONIC, KEYED)                             
 11 dueDt                                         Date       yyyyMMdd                         721     8 Report due date                                                  
 12 filedDt                                       Date       yyyyMMdd                         729     8 Date report was filed (postmark)                                 
 13 periodStartDt                                 Date       yyyyMMdd                         737     8 Beginning of period covered                                      
 14 periodEndDt                                   Date       yyyyMMdd                         745     8 Ending of period covered                                         
 15 unitemizedContribAmount                       BigDecimal 0000000000.00                    753    12 Total unitemized political contribs                              
 16 totalContribAmount                            BigDecimal 0000000000.00                    765    12 Total political contribs                                         
 17 unitemizedExpendAmount                        BigDecimal 0000000000.00                    777    12 Total unitemized political expend below threshold                
 18 totalExpendAmount                             BigDecimal 0000000000.00                    789    12 Total political expend                                           
 19 loanBalanceAmount                             BigDecimal 0000000000.00                    801    12 Total principal amount of all outstanding loans as of the last   
                                                                                                  day of the reporting period
 20 contribsMaintainedAmount                      BigDecimal 0000000000.00                    813    12 Total contributions maintained as of the last day of the         
                                                                                                  reporting period
 21 unitemizedPledgeAmount                        BigDecimal 0000000000.00                    825    12 Total unitemized pledges                                         
 22 unitemizedLoanAmount                          BigDecimal 0000000000.00                    837    12 Total unitemized loans                                           
 23 totalInterestEarnedAmount                     BigDecimal 0000000000.00                    849    12 Total amount of interest and other income earned on unexpended   
                                                                                                  political contributions during the previous year
 24 electionDt                                    Date       yyyyMMdd                         861     8 Election date                                                    
 25 electionTypeCd                                String                                      869    30 Election type (PRIMARY, GENERAL, etc)                            
 26 electionTypeDescr                             String                                      899   100 Election type description (electionTypeCd=OTHER)                 
 27 noActivityFlag                                String                                      999     1 No activity indicator                                            
 28 politicalPartyCd                              String                                     1000    30 Political party (DEM, REP, LIB, etc)                             
 29 politicalDivisionCd                           String                                     1030    30 Political division (STATE, COUNTY, etc)                          
 30 politicalPartyOtherDescr                      String                                     1060   100 Political party description (politicalPartyCd=OTHER)             
 31 politicalPartyCountyCd                        String                                     1160    30 Political party county                                           
 32 timelyCorrectionFlag                          String                                     1190     1 Correction aff timely indicator                                  
 33 semiannualCheckboxFlag                        String                                     1191     1 Correction aff semiannual indicator                              
 34 highContribThreshholdCd                       String                                     1192    30 High itemization threshold indicator                             
 35 softwareRelease                               String                                     1222    20 Software release (version)                                       
 36 internetVisibleFlag                           String                                     1242     1 Internet visible indicator                                       
 37 signerPrintedName                             String                                     1243   100 Document signer name                                             
 38 addrChangeFilerFlag                           String                                     1343     1 Filer address change indicator                                   
 39 addrChangeTreasFlag                           String                                     1344     1 Treasurer address change indicator                               
 40 addrChangeChairFlag                           String                                     1345     1 Chair address change indicator                                   
 41 filerPersentTypeCd                            String                                     1346    30 Type of filer name data - INDIVIDUAL or ENTITY                   
 42 filerNameOrganization                         String                                     1376   100 For ENTITY, the filer organization name                          
 43 filerNameLast                                 String                                     1476   100 For INDIVIDUAL, the filer last name                              
 44 filerNameSuffixCd                             String                                     1576    30 For INDIVIDUAL, the filer name suffix (e.g. JR, MD, II)          
 45 filerNameFirst                                String                                     1606    45 For INDIVIDUAL, the filer first name                             
 46 filerNamePrefixCd                             String                                     1651    30 For INDIVIDUAL, the filer name prefix (e.g. MR, MRS, MS)         
 47 filerNameShort                                String                                     1681    25 For INDIVIDUAL, the filer short name (nickname)                  
 48 filerStreetAddr1                              String                                     1706    55 Filer street address - line 1                                    
 49 filerStreetAddr2                              String                                     1761    55 Filer street address - line 2                                    
 50 filerStreetCity                               String                                     1816    30 Filer street address - city                                      
 51 filerStreetStateCd                            String                                     1846     2 Filer street address - state code (e.g. TX, CA) - for            
                                                                                                  country=USA/UMI only
 52 filerStreetCountyCd                           String                                     1848     5 Filer street address - Texas county                              
 53 filerStreetCountryCd                          String                                     1853     3 Filer street address - country (e.g. USA, UMI, MEX, CAN)         
 54 filerStreetPostalCode                         String                                     1856    20 Filer street address - postal code - for USA addresses only      
 55 filerStreetRegion                             String                                     1876    30 Filer street address - region for country other than USA         
 56 filerHoldOfficeCd                             String                                     1906    30 Filer office held                                                
 57 filerHoldOfficeDistrict                       String                                     1936    11 Filer office held district                                       
 58 filerHoldOfficePlace                          String                                     1947    11 Filer office held place                                          
 59 filerHoldOfficeDescr                          String                                     1958   100 Filer office held description                                    
 60 filerHoldOfficeCountyCd                       String                                     2058     5 Filer office held country code                                   
 61 filerHoldOfficeCountyDescr                    String                                     2063   100 Filer office help county description                             
 62 filerSeekOfficeCd                             String                                     2163    30 Filer office sought                                              
 63 filerSeekOfficeDistrict                       String                                     2193    11 Filer office sought district                                     
 64 filerSeekOfficePlace                          String                                     2204    11 Filer office sought place                                        
 65 filerSeekOfficeDescr                          String                                     2215   100 Filer office sought description                                  
 66 filerSeekOfficeCountyCd                       String                                     2315     5 Filer office sought county code                                  
 67 filerSeekOfficeCountyDescr                    String                                     2320   100 Filer office sought county description                           
 68 treasPersentTypeCd                            String                                     2420    30 Type of treasurer name data - INDIVIDUAL or ENTITY               
 69 treasNameOrganization                         String                                     2450   100 For ENTITY, the treasurer organization name                      
 70 treasNameLast                                 String                                     2550   100 For INDIVIDUAL, the treasurer last name                          
 71 treasNameSuffixCd                             String                                     2650    30 For INDIVIDUAL, the treasurer name suffix (e.g. JR, MD, II)      
 72 treasNameFirst                                String                                     2680    45 For INDIVIDUAL, the treasurer first name                         
 73 treasNamePrefixCd                             String                                     2725    30 For INDIVIDUAL, the treasurer name prefix (e.g. MR, MRS, MS)     
 74 treasNameShort                                String                                     2755    25 For INDIVIDUAL, the treasurer short name (nickname)              
 75 treasStreetAddr1                              String                                     2780    55 Treasurer street address - line 1                                
 76 treasStreetAddr2                              String                                     2835    55 Treasurer street address - line 2                                
 77 treasStreetCity                               String                                     2890    30 Treasurer street address - city                                  
 78 treasStreetStateCd                            String                                     2920     2 Treasurer street address - state code (e.g. TX, CA) - for        
                                                                                                  country=USA/UMI only
 79 treasStreetCountyCd                           String                                     2922     5 Treasurer street address - Texas county                          
 80 treasStreetCountryCd                          String                                     2927     3 Treasurer street address - country (e.g. USA, UMI, MEX, CAN)     
 81 treasStreetPostalCode                         String                                     2930    20 Treasurer street address - postal code - for USA addresses only  
 82 treasStreetRegion                             String                                     2950    30 Treasurer street address - region for country other than USA     
 83 treasMailingAddr1                             String                                     2980    55 Treasurer mailing address - line 1                               
 84 treasMailingAddr2                             String                                     3035    55 Treasurer mailing address - line 2                               
 85 treasMailingCity                              String                                     3090    30 Treasurer mailing address - city                                 
 86 treasMailingStateCd                           String                                     3120     2 Treasurer mailing address - state code (e.g. TX, CA) - for       
                                                                                                  country=USA/UMI only
 87 treasMailingCountyCd                          String                                     3122     5 Treasurer mailing address - Texas county                         
 88 treasMailingCountryCd                         String                                     3127     3 Treasurer mailing address - country (e.g. USA, UMI, MEX, CAN)    
 89 treasMailingPostalCode                        String                                     3130    20 Treasurer mailing address - postal code - USA addresses only     
 90 treasMailingRegion                            String                                     3150    30 Treasurer mailing address - region for country other than USA    
 91 treasPrimaryUsaPhoneFlag                      String                                     3180     1 Treasurer primary phone number - Y if number is a USA phone, N   
                                                                                                  otherwise
 92 treasPrimaryPhoneNumber                       String                                     3181    20 Treasurer primary phone number                                   
 93 treasPrimaryPhoneExt                          String                                     3201    10 Treasurer primary phone extension                                
 94 chairPersentTypeCd                            String                                     3211    30 Type of chair name data - INDIVIDUAL or ENTITY                   
 95 chairNameOrganization                         String                                     3241   100 For ENTITY, the chair organization name                          
 96 chairNameLast                                 String                                     3341   100 For INDIVIDUAL, the chair last name                              
 97 chairNameSuffixCd                             String                                     3441    30 For INDIVIDUAL, the chair name suffix (e.g. JR, MD, II)          
 98 chairNameFirst                                String                                     3471    45 For INDIVIDUAL, the chair first name                             
 99 chairNamePrefixCd                             String                                     3516    30 For INDIVIDUAL, the chair name prefix (e.g. MR, MRS, MS)         
100 chairNameShort                                String                                     3546    25 For INDIVIDUAL, the chair short name (nickname)                  
101 chairStreetAddr1                              String                                     3571    55 Chair street address - line 1                                    
102 chairStreetAddr2                              String                                     3626    55 Chair street address - line 2                                    
103 chairStreetCity                               String                                     3681    30 Chair street address - city                                      
104 chairStreetStateCd                            String                                     3711     2 Chair street address - state code (e.g. TX, CA) - for            
                                                                                                  country=USA/UMI only
105 chairStreetCountyCd                           String                                     3713     5 Chair street address - Texas county                              
106 chairStreetCountryCd                          String                                     3718     3 Chair street address - country (e.g. USA, UMI, MEX, CAN)         
107 chairStreetPostalCode                         String                                     3721    20 Chair street address - postal code - for USA addresses only      
108 chairStreetRegion                             String                                     3741    30 Chair street address - region for country other than USA         
109 chairMailingAddr1                             String                                     3771    55 Chair mailing address - line 1                                   
110 chairMailingAddr2                             String                                     3826    55 Chair mailing address - line 2                                   
111 chairMailingCity                              String                                     3881    30 Chair mailing address - city                                     
112 chairMailingStateCd                           String                                     3911     2 Chair mailing address - state code (e.g. TX, CA) - for           
                                                                                                  country=USA/UMI only
113 chairMailingCountyCd                          String                                     3913     5 Chair mailing address - Texas county                             
114 chairMailingCountryCd                         String                                     3918     3 Chair mailing address - country (e.g. USA, UMI, MEX, CAN)        
115 chairMailingPostalCode                        String                                     3921    20 Chair mailing address - postal code - USA addresses only         
116 chairMailingRegion                            String                                     3941    30 Chair mailing address - region for country other than USA        
117 chairPrimaryUsaPhoneFlag                      String                                     3971     1 Chair primary phone number - Y if number is a USA phone, N       
                                                                                                  otherwise
118 chairPrimaryPhoneNumber                       String                                     3972    20 Chair primary phone number                                       
119 chairPrimaryPhoneExt                          String                                     3992    10 Chair primary phone extension                                    

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 5     Record Name: CoverSheet2Data     Length: 1551
Description: Cover Sheet 2 - Notices received by candidates/office holders. These notices are reported at the bottom of Cover Sheet Page 1 and
             the top of Cover Sheet Page 2 for FORMNAME = COH, COHFR, CORCOH, JCOH, SCCOH, SCSPAC.
             File: notices.csv

 #  Field Name                                    Type       Mask                           Start   Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- ----- -----------------------------------------------------------------
  1 recordType                                    String                                        1    20 Record type code - always CVR2                                   
  2 formTypeCd                                    String                                       21    20 TEC form used                                                    
  3 reportInfoIdent                               Long       00000000000                       41    11 Unique report #                                                  
  4 receivedDt                                    Date       yyyyMMdd                          52     8 Date report received by TEC                                      
  5 infoOnlyFlag                                  String                                       60     1 Superseded by other report                                       
  6 filerIdent                                    String                                       61   100 Filer account #                                                  
  7 filerTypeCd                                   String                                      161    30 Type of filer                                                    
  8 filerName                                     String                                      191   200 Filer name                                                       
  9 committeeActivityId                           Long       00000000000                      391    11 Contribution unique identifier                                   
 10 notifierCommactPersentKindCd                  String                                      402    30 Committee activity person/entity kind                            
 11 notifierPersentTypeCd                         String                                      432    30 Type of notifier name data - INDIVIDUAL or ENTITY                
 12 notifierNameOrganization                      String                                      462   100 For ENTITY, the notifier organization name                       
 13 notifierNameLast                              String                                      562   100 For INDIVIDUAL, the notifier last name                           
 14 notifierNameSuffixCd                          String                                      662    30 For INDIVIDUAL, the notifier name suffix (e.g. JR, MD, II)       
 15 notifierNameFirst                             String                                      692    45 For INDIVIDUAL, the notifier first name                          
 16 notifierNamePrefixCd                          String                                      737    30 For INDIVIDUAL, the notifier name prefix (e.g. MR, MRS, MS)      
 17 notifierNameShort                             String                                      767    25 For INDIVIDUAL, the notifier short name (nickname)               
 18 notifierStreetAddr1                           String                                      792    55 Notifier street address - line 1                                 
 19 notifierStreetAddr2                           String                                      847    55 Notifier street address - line 2                                 
 20 notifierStreetCity                            String                                      902    30 Notifier street address - city                                   
 21 notifierStreetStateCd                         String                                      932     2 Notifier street address - state code (e.g. TX, CA) - for         
                                                                                                  country=USA/UMI only
 22 notifierStreetCountyCd                        String                                      934     5 Notifier street address - Texas county                           
 23 notifierStreetCountryCd                       String                                      939     3 Notifier street address - country (e.g. USA, UMI, MEX, CAN)      
 24 notifierStreetPostalCode                      String                                      942    20 Notifier street address - postal code - for USA addresses only   
 25 notifierStreetRegion                          String                                      962    30 Notifier street address - region for country other than USA      
 26 treasPersentTypeCd                            String                                      992    30 Type of treasurer name data - INDIVIDUAL or ENTITY               
 27 treasNameOrganization                         String                                     1022   100 For ENTITY, the treasurer organization name                      
 28 treasNameLast                                 String                                     1122   100 For INDIVIDUAL, the treasurer last name                          
 29 treasNameSuffixCd                             String                                     1222    30 For INDIVIDUAL, the treasurer name suffix (e.g. JR, MD, II)      
 30 treasNameFirst                                String                                     1252    45 For INDIVIDUAL, the treasurer first name                         
 31 treasNamePrefixCd                             String                                     1297    30 For INDIVIDUAL, the treasurer name prefix (e.g. MR, MRS, MS)     
 32 treasNameShort                                String                                     1327    25 For INDIVIDUAL, the treasurer short name (nickname)              
 33 treasStreetAddr1                              String                                     1352    55 Treasurer street address - line 1                                
 34 treasStreetAddr2                              String                                     1407    55 Treasurer street address - line 2                                
 35 treasStreetCity                               String                                     1462    30 Treasurer street address - city                                  
 36 treasStreetStateCd                            String                                     1492     2 Treasurer street address - state code (e.g. TX, CA) - for        
                                                                                                  country=USA/UMI only
 37 treasStreetCountyCd                           String                                     1494     5 Treasurer street address - Texas county                          
 38 treasStreetCountryCd                          String                                     1499     3 Treasurer street address - country (e.g. USA, UMI, MEX, CAN)     
 39 treasStreetPostalCode                         String                                     1502    20 Treasurer street address - postal code - for USA addresses only  
 40 treasStreetRegion                             String                                     1522    30 Treasurer street address - region for country other than USA     

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 6     Record Name: CoverSheet3Data     Length: 1093
Description: Cover Sheet 3 - Committee purpose. The committee purpose is reported at the top of Cover Sheet Page 2 FORMNAME = CEC, GPAC, JSPAC,
             MCEC, MPAC, SCSPAC, SPAC, SPACSS.
             File: purpose.csv

 #  Field Name                                    Type       Mask                           Start   Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- ----- -----------------------------------------------------------------
  1 recordType                                    String                                        1    20 Record type code - always CVR3                                   
  2 formTypeCd                                    String                                       21    20 TEC form used                                                    
  3 reportInfoIdent                               Long       00000000000                       41    11 Unique report #                                                  
  4 receivedDt                                    Date       yyyyMMdd                          52     8 Date report received by TEC                                      
  5 infoOnlyFlag                                  String                                       60     1 Superseded by other report                                       
  6 filerIdent                                    String                                       61   100 Filer account #                                                  
  7 filerTypeCd                                   String                                      161    30 Type of filer                                                    
  8 filerName                                     String                                      191   200 Filer name                                                       
  9 committeeActivityId                           Long       00000000000                      391    11 Committee activity unique identifier                             
 10 subjectCategoryCd                             String                                      402    30 Subject Category ()                                              
 11 subjectPositionCd                             String                                      432    30 Subject Position (SUPPORT, OPPOSE, ASSIST)                       
 12 subjectDescr                                  String                                      462   100 Subject description                                              
 13 subjectBallotNumber                           String                                      562    10 Ballot number                                                    
 14 subjectElectionDt                             Date       yyyyMMdd                         572     8 Election date                                                    
 15 activityHoldOfficeCd                          String                                      580    30 Activity office held                                             
 16 activityHoldOfficeDistrict                    String                                      610    11 Activity office held district                                    
 17 activityHoldOfficePlace                       String                                      621    11 Activity office held place                                       
 18 activityHoldOfficeDescr                       String                                      632   100 Activity office held description                                 
 19 activityHoldOfficeCountyCd                    String                                      732     5 Activity office held country code                                
 20 activityHoldOfficeCountyDescr                 String                                      737   100 Activity office help county description                          
 21 activitySeekOfficeCd                          String                                      837    30 Activity office sought                                           
 22 activitySeekOfficeDistrict                    String                                      867    11 Activity office sought district                                  
 23 activitySeekOfficePlace                       String                                      878    11 Activity office sought place                                     
 24 activitySeekOfficeDescr                       String                                      889   100 Activity office sought description                               
 25 activitySeekOfficeCountyCd                    String                                      989     5 Activity office sought county code                               
 26 activitySeekOfficeCountyDescr                 String                                      994   100 Activity office sought county description                        

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 7     Record Name: CreditData     Length: 1101
Description: Credits - Schedule K - Interest, credits, gains, refunds, and contributions returned to filer.
             File: credits.csv

 #  Field Name                                    Type       Mask                           Start   Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- ----- -----------------------------------------------------------------
  1 recordType                                    String                                        1    20 Record type code - always CRED                                   
  2 formTypeCd                                    String                                       21    20 TEC form used                                                    
  3 schedFormTypeCd                               String                                       41    20 TEC Schedule Used                                                
  4 reportInfoIdent                               Long       00000000000                       61    11 Unique report #                                                  
  5 receivedDt                                    Date       yyyyMMdd                          72     8 Date report received by TEC                                      
  6 infoOnlyFlag                                  String                                       80     1 Superseded by other report                                       
  7 filerIdent                                    String                                       81   100 Filer account #                                                  
  8 filerTypeCd                                   String                                      181    30 Type of filer                                                    
  9 filerName                                     String                                      211   200 Filer name                                                       
 10 creditInfoId                                  Long       00000000000                      411    11 Credit unique identifier                                         
 11 creditDt                                      Date       yyyyMMdd                         422     8 Credit date                                                      
 12 creditAmount                                  BigDecimal 0000000000.00                    430    12 Credit amount                                                    
 13 creditDescr                                   String                                      442   100 Credit description                                               
 14 payorPersentTypeCd                            String                                      542    30 Type of payor name data - INDIVIDUAL or ENTITY                   
 15 payorNameOrganization                         String                                      572   100 For ENTITY, the payor organization name                          
 16 payorNameLast                                 String                                      672   100 For INDIVIDUAL, the payor last name                              
 17 payorNameSuffixCd                             String                                      772    30 For INDIVIDUAL, the payor name suffix (e.g. JR, MD, II)          
 18 payorNameFirst                                String                                      802    45 For INDIVIDUAL, the payor first name                             
 19 payorNamePrefixCd                             String                                      847    30 For INDIVIDUAL, the payor name prefix (e.g. MR, MRS, MS)         
 20 payorNameShort                                String                                      877    25 For INDIVIDUAL, the payor short name (nickname)                  
 21 payorStreetAddr1                              String                                      902    55 Payor street address - line 1                                    
 22 payorStreetAddr2                              String                                      957    55 Payor street address - line 2                                    
 23 payorStreetCity                               String                                     1012    30 Payor street address - city                                      
 24 payorStreetStateCd                            String                                     1042     2 Payor street address - state code (e.g. TX, CA) - for            
                                                                                                  country=USA/UMI only
 25 payorStreetCountyCd                           String                                     1044     5 Payor street address - Texas county                              
 26 payorStreetCountryCd                          String                                     1049     3 Payor street address - country (e.g. USA, UMI, MEX, CAN)         
 27 payorStreetPostalCode                         String                                     1052    20 Payor street address - postal code - for USA addresses only      
 28 payorStreetRegion                             String                                     1072    30 Payor street address - region for country other than USA         

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 8     Record Name: DebtData     Length: 3122
Description: Debts - Schedule L - Outstanding judicial loans.
             File: debts.csv

 #  Field Name                                    Type       Mask                           Start   Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- ----- -----------------------------------------------------------------
  1 recordType                                    String                                        1    20 Record type code - always DEBT                                   
  2 formTypeCd                                    String                                       21    20 TEC form used                                                    
  3 schedFormTypeCd                               String                                       41    20 TEC Schedule Used                                                
  4 reportInfoIdent                               Long       00000000000                       61    11 Unique report #                                                  
  5 receivedDt                                    Date       yyyyMMdd                          72     8 Date report received by TEC                                      
  6 infoOnlyFlag                                  String                                       80     1 Superseded by other report                                       
  7 filerIdent                                    String                                       81   100 Filer account #                                                  
  8 filerTypeCd                                   String                                      181    30 Type of filer                                                    
  9 filerName                                     String                                      211   200 Filer name                                                       
 10 loanInfoId                                    Long       00000000000                      411    11 Loan unique identifier                                           
 11 loanGuaranteedFlag                            String                                      422     1 Loan guaranteed indicator                                        
 12 lenderPersentTypeCd                           String                                      423    30 Type of lender name data - INDIVIDUAL or ENTITY                  
 13 lenderNameOrganization                        String                                      453   100 For ENTITY, the lender organization name                         
 14 lenderNameLast                                String                                      553   100 For INDIVIDUAL, the lender last name                             
 15 lenderNameSuffixCd                            String                                      653    30 For INDIVIDUAL, the lender name suffix (e.g. JR, MD, II)         
 16 lenderNameFirst                               String                                      683    45 For INDIVIDUAL, the lender first name                            
 17 lenderNamePrefixCd                            String                                      728    30 For INDIVIDUAL, the lender name prefix (e.g. MR, MRS, MS)        
 18 lenderNameShort                               String                                      758    25 For INDIVIDUAL, the lender short name (nickname)                 
 19 lenderStreetCity                              String                                      783    30 Lender street address - city                                     
 20 lenderStreetStateCd                           String                                      813     2 Lender street address - state code (e.g. TX, CA) - for           
                                                                                                  country=USA/UMI only
 21 lenderStreetCountyCd                          String                                      815     5 Lender street address - Texas county                             
 22 lenderStreetCountryCd                         String                                      820     3 Lender street address - country (e.g. USA, UMI, MEX, CAN)        
 23 lenderStreetPostalCode                        String                                      823    20 Lender street address - postal code - for USA addresses only     
 24 lenderStreetRegion                            String                                      843    30 Lender street address - region for country other than USA        

    Array                                                                                          2250
    debtGuarantorLoanPersent[5/ROW_MAJOR]         CsvPublicExportDebtGuarantorLoanPersent           450 Loan guarantors (maxiumum 5)                                     
 25    guarantorPersentTypeCd                     String                                      873    30 Type of guarantor name data - INDIVIDUAL or ENTITY               
 26    guarantorNameOrganization                  String                                      903   100 For ENTITY, the guarantor organization name                      
 27    guarantorNameLast                          String                                     1003   100 For INDIVIDUAL, the guarantor last name                          
 28    guarantorNameSuffixCd                      String                                     1103    30 For INDIVIDUAL, the guarantor name suffix (e.g. JR, MD, II)      
 29    guarantorNameFirst                         String                                     1133    45 For INDIVIDUAL, the guarantor first name                         
 30    guarantorNamePrefixCd                      String                                     1178    30 For INDIVIDUAL, the guarantor name prefix (e.g. MR, MRS, MS)     
 31    guarantorNameShort                         String                                     1208    25 For INDIVIDUAL, the guarantor short name (nickname)              
 32    guarantorStreetCity                        String                                     1233    30 Guarantor street address - city                                  
 33    guarantorStreetStateCd                     String                                     1263     2 Guarantor street address - state code (e.g. TX, CA) - for        
                                                                                                  country=USA/UMI only
 34    guarantorStreetCountyCd                    String                                     1265     5 Guarantor street address - Texas county                          
 35    guarantorStreetCountryCd                   String                                     1270     3 Guarantor street address - country (e.g. USA, UMI, MEX, CAN)     
 36    guarantorStreetPostalCode                  String                                     1273    20 Guarantor street address - postal code - for USA addresses only  
 37    guarantorStreetRegion                      String                                     1293    30 Guarantor street address - region for country other than USA     

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 9     Record Name: ExpendData     Length: 1374
Description: Expenditures - Schedules F/G/H/I - Expenditures from special pre-election (formerly Telegram) reports are stored in the file 
             expn_t. They are kept separate from the expends file to avoid creating duplicates, because they are supposed to be re-reported on
             the next regular campaign finance report.
             Files: expend_##.csv, expn_t.csv

 #  Field Name                                    Type       Mask                           Start   Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- ----- -----------------------------------------------------------------
  1 recordType                                    String                                        1    20 Record type code - always EXPN                                   
  2 formTypeCd                                    String                                       21    20 TEC form used                                                    
  3 schedFormTypeCd                               String                                       41    20 TEC Schedule Used                                                
  4 reportInfoIdent                               Long       00000000000                       61    11 Unique report #                                                  
  5 receivedDt                                    Date       yyyyMMdd                          72     8 Date report received by TEC                                      
  6 infoOnlyFlag                                  String                                       80     1 Superseded by other report                                       
  7 filerIdent                                    String                                       81   100 Filer account #                                                  
  8 filerTypeCd                                   String                                      181    30 Type of filer                                                    
  9 filerName                                     String                                      211   200 Filer name                                                       
 10 expendInfoId                                  Long       00000000000                      411    11 Expenditure unique identifier                                    
 11 expendDt                                      Date       yyyyMMdd                         422     8 Expenditure date                                                 
 12 expendAmount                                  BigDecimal 0000000000.00                    430    12 Expenditure amount                                               
 13 expendDescr                                   String                                      442   100 Expenditure description                                          
 14 expendCatCd                                   String                                      542    30 Expenditure category code                                        
 15 expendCatDescr                                String                                      572   100 Expenditure category description                                 
 16 itemizeFlag                                   String                                      672     1 Y indicates that the expenditure is itemized                     
 17 travelFlag                                    String                                      673     1 Y indicates that the expenditure has associated travel           
 18 politicalExpendCd                             String                                      674    30 Political expenditure indicator                                  
 19 reimburseIntendedFlag                         String                                      704     1 Reimbursement intended indicator                                 
 20 srcCorpContribFlag                            String                                      705     1 Expenditure from corporate funds indicator                       
 21 capitalLivingexpFlag                          String                                      706     1 Austin living expense indicator                                  
 22 payeePersentTypeCd                            String                                      707    30 Type of payee name data - INDIVIDUAL or ENTITY                   
 23 payeeNameOrganization                         String                                      737   100 For ENTITY, the payee organization name                          
 24 payeeNameLast                                 String                                      837   100 For INDIVIDUAL, the payee last name                              
 25 payeeNameSuffixCd                             String                                      937    30 For INDIVIDUAL, the payee name suffix (e.g. JR, MD, II)          
 26 payeeNameFirst                                String                                      967    45 For INDIVIDUAL, the payee first name                             
 27 payeeNamePrefixCd                             String                                     1012    30 For INDIVIDUAL, the payee name prefix (e.g. MR, MRS, MS)         
 28 payeeNameShort                                String                                     1042    25 For INDIVIDUAL, the payee short name (nickname)                  
 29 payeeStreetAddr1                              String                                     1067    55 Payee street address - line 1                                    
 30 payeeStreetAddr2                              String                                     1122    55 Payee street address - line 2                                    
 31 payeeStreetCity                               String                                     1177    30 Payee street address - city                                      
 32 payeeStreetStateCd                            String                                     1207     2 Payee street address - state code (e.g. TX, CA) - for            
                                                                                                  country=USA/UMI only
 33 payeeStreetCountyCd                           String                                     1209     5 Payee street address - Texas county                              
 34 payeeStreetCountryCd                          String                                     1214     3 Payee street address - country (e.g. USA, UMI, MEX, CAN)         
 35 payeeStreetPostalCode                         String                                     1217    20 Payee street address - postal code - for USA addresses only      
 36 payeeStreetRegion                             String                                     1237    30 Payee street address - region for country other than USA         
 37 creditCardIssuer                              String                                     1267   100 Financial institution issuing credit card                        
 38 repaymentDt                                   Date       yyyyMMdd                        1367     8 Repayment date                                                   

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 10     Record Name: ExpendRepayment     Length: 440
Description: Expenditures Repayment dates

 #  Field Name                                    Type       Mask                           Start   Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- ----- -----------------------------------------------------------------
  1 recordType                                    String                                        1    20 Record type code - always EXPN                                   
  2 formTypeCd                                    String                                       21    20 TEC form used                                                    
  3 schedFormTypeCd                               String                                       41    20 TEC Schedule Used                                                
  4 reportInfoIdent                               Long       00000000000                       61    11 Unique report #                                                  
  5 receivedDt                                    Date       yyyyMMdd                          72     8 Date report received by TEC                                      
  6 infoOnlyFlag                                  String                                       80     1 Superseded by other report                                       
  7 filerIdent                                    String                                       81   100 Filer account #                                                  
  8 filerTypeCd                                   String                                      181    30 Type of filer                                                    
  9 filerName                                     String                                      211   200 Filer name                                                       
 10 expendInfoId                                  Long       00000000000                      411    11 Expenditure unique identifier                                    
 11 expendRepaymentId                             Long       00000000000                      422    11 Expenditure Repayment unique identifier                          
 12 repaymentDt                                   Date       yyyyMMdd                         433     8 Repayment date                                                   

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 11     Record Name: ExpendCategory     Length: 150
Description: Expenditure category codes.
             File: expn_catg.csv

 #  Field Name                                    Type       Mask                           Start   Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- ----- -----------------------------------------------------------------
  1 recordType                                    String                                        1    20 Record type code - always EXCAT                                  
  2 expendCategoryCodeValue                       String                                       21    30 Expenditure category code                                        
  3 expendCategoryCodeLabel                       String                                       51   100 Expenditure category description                                 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 12     Record Name: FilerData     Length: 4529
Description: Filer index. The names, addresses and offices in this file are entered by TEC staff from various sources; e.g., amended campaign 
             treasurer appointments, change-of-address notices, and ballot information from the Texas Secretary of State.
             File: filers.csv

 #  Field Name                                    Type       Mask                           Start   Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- ----- -----------------------------------------------------------------
  1 recordType                                    String                                        1    20 Record type code - always FILER                                  
  2 filerIdent                                    String                                       21   100 Filer account #                                                  
  3 filerTypeCd                                   String                                      121    30 Type of filer                                                    
  4 filerName                                     String                                      151   200 Filer name                                                       
  5 unexpendContribFilerFlag                      String                                      351     1 Unexpended contributions indicator                               
  6 modifiedElectCycleFlag                        String                                      352     1 Modified for election cycle indicator                            
  7 filerJdiCd                                    String                                      353    30 Judicial declaration of intent code                              
  8 committeeStatusCd                             String                                      383    30 PAC filing status code                                           
  9 ctaSeekOfficeCd                               String                                      413    30 CTA office sought                                                
 10 ctaSeekOfficeDistrict                         String                                      443    11 CTA office sought district                                       
 11 ctaSeekOfficePlace                            String                                      454    11 CTA office sought place                                          
 12 ctaSeekOfficeDescr                            String                                      465   100 CTA office sought description                                    
 13 ctaSeekOfficeCountyCd                         String                                      565     5 CTA office sought county code                                    
 14 ctaSeekOfficeCountyDescr                      String                                      570   100 CTA office sought county description                             
 15 filerPersentTypeCd                            String                                      670    30 Type of filer name data - INDIVIDUAL or ENTITY                   
 16 filerNameOrganization                         String                                      700   100 For ENTITY, the filer organization name                          
 17 filerNameLast                                 String                                      800   100 For INDIVIDUAL, the filer last name                              
 18 filerNameSuffixCd                             String                                      900    30 For INDIVIDUAL, the filer name suffix (e.g. JR, MD, II)          
 19 filerNameFirst                                String                                      930    45 For INDIVIDUAL, the filer first name                             
 20 filerNamePrefixCd                             String                                      975    30 For INDIVIDUAL, the filer name prefix (e.g. MR, MRS, MS)         
 21 filerNameShort                                String                                     1005    25 For INDIVIDUAL, the filer short name (nickname)                  
 22 filerStreetAddr1                              String                                     1030    55 Filer street address - line 1                                    
 23 filerStreetAddr2                              String                                     1085    55 Filer street address - line 2                                    
 24 filerStreetCity                               String                                     1140    30 Filer street address - city                                      
 25 filerStreetStateCd                            String                                     1170     2 Filer street address - state code (e.g. TX, CA) - for            
                                                                                                  country=USA/UMI only
 26 filerStreetCountyCd                           String                                     1172     5 Filer street address - Texas county                              
 27 filerStreetCountryCd                          String                                     1177     3 Filer street address - country (e.g. USA, UMI, MEX, CAN)         
 28 filerStreetPostalCode                         String                                     1180    20 Filer street address - postal code - for USA addresses only      
 29 filerStreetRegion                             String                                     1200    30 Filer street address - region for country other than USA         
 30 filerMailingAddr1                             String                                     1230    55 Filer mailing address - line 1                                   
 31 filerMailingAddr2                             String                                     1285    55 Filer mailing address - line 2                                   
 32 filerMailingCity                              String                                     1340    30 Filer mailing address - city                                     
 33 filerMailingStateCd                           String                                     1370     2 Filer mailing address - state code (e.g. TX, CA) - for           
                                                                                                  country=USA/UMI only
 34 filerMailingCountyCd                          String                                     1372     5 Filer mailing address - Texas county                             
 35 filerMailingCountryCd                         String                                     1377     3 Filer mailing address - country (e.g. USA, UMI, MEX, CAN)        
 36 filerMailingPostalCode                        String                                     1380    20 Filer mailing address - postal code - USA addresses only         
 37 filerMailingRegion                            String                                     1400    30 Filer mailing address - region for country other than USA        
 38 filerPrimaryUsaPhoneFlag                      String                                     1430     1 Filer primary phone number - Y if number is a USA phone, N       
                                                                                                  otherwise
 39 filerPrimaryPhoneNumber                       String                                     1431    20 Filer primary phone number                                       
 40 filerPrimaryPhoneExt                          String                                     1451    10 Filer primary phone extension                                    
 41 filerHoldOfficeCd                             String                                     1461    30 Filer office held                                                
 42 filerHoldOfficeDistrict                       String                                     1491    11 Filer office held district                                       
 43 filerHoldOfficePlace                          String                                     1502    11 Filer office held place                                          
 44 filerHoldOfficeDescr                          String                                     1513   100 Filer office held description                                    
 45 filerHoldOfficeCountyCd                       String                                     1613     5 Filer office held country code                                   
 46 filerHoldOfficeCountyDescr                    String                                     1618   100 Filer office help county description                             
 47 filerFilerpersStatusCd                        String                                     1718    30 Filer status (CURRENT, etc)                                      
 48 filerEffStartDt                               Date       yyyyMMdd                        1748     8 Filer start date                                                 
 49 filerEffStopDt                                Date       yyyyMMdd                        1756     8 Filer end date                                                   
 50 contestSeekOfficeCd                           String                                     1764    30 Filer office sought                                              
 51 contestSeekOfficeDistrict                     String                                     1794    11 Filer office sought district                                     
 52 contestSeekOfficePlace                        String                                     1805    11 Filer office sought place                                        
 53 contestSeekOfficeDescr                        String                                     1816   100 Filer office sought description                                  
 54 contestSeekOfficeCountyCd                     String                                     1916     5 Filer office sought county code                                  
 55 contestSeekOfficeCountyDescr                  String                                     1921   100 Filer office sought county description                           
 56 treasPersentTypeCd                            String                                     2021    30 Type of treasurer name data - INDIVIDUAL or ENTITY               
 57 treasNameOrganization                         String                                     2051   100 For ENTITY, the treasurer organization name                      
 58 treasNameLast                                 String                                     2151   100 For INDIVIDUAL, the treasurer last name                          
 59 treasNameSuffixCd                             String                                     2251    30 For INDIVIDUAL, the treasurer name suffix (e.g. JR, MD, II)      
 60 treasNameFirst                                String                                     2281    45 For INDIVIDUAL, the treasurer first name                         
 61 treasNamePrefixCd                             String                                     2326    30 For INDIVIDUAL, the treasurer name prefix (e.g. MR, MRS, MS)     
 62 treasNameShort                                String                                     2356    25 For INDIVIDUAL, the treasurer short name (nickname)              
 63 treasStreetAddr1                              String                                     2381    55 Treasurer street address - line 1                                
 64 treasStreetAddr2                              String                                     2436    55 Treasurer street address - line 2                                
 65 treasStreetCity                               String                                     2491    30 Treasurer street address - city                                  
 66 treasStreetStateCd                            String                                     2521     2 Treasurer street address - state code (e.g. TX, CA) - for        
                                                                                                  country=USA/UMI only
 67 treasStreetCountyCd                           String                                     2523     5 Treasurer street address - Texas county                          
 68 treasStreetCountryCd                          String                                     2528     3 Treasurer street address - country (e.g. USA, UMI, MEX, CAN)     
 69 treasStreetPostalCode                         String                                     2531    20 Treasurer street address - postal code - for USA addresses only  
 70 treasStreetRegion                             String                                     2551    30 Treasurer street address - region for country other than USA     
 71 treasMailingAddr1                             String                                     2581    55 Treasurer mailing address - line 1                               
 72 treasMailingAddr2                             String                                     2636    55 Treasurer mailing address - line 2                               
 73 treasMailingCity                              String                                     2691    30 Treasurer mailing address - city                                 
 74 treasMailingStateCd                           String                                     2721     2 Treasurer mailing address - state code (e.g. TX, CA) - for       
                                                                                                  country=USA/UMI only
 75 treasMailingCountyCd                          String                                     2723     5 Treasurer mailing address - Texas county                         
 76 treasMailingCountryCd                         String                                     2728     3 Treasurer mailing address - country (e.g. USA, UMI, MEX, CAN)    
 77 treasMailingPostalCode                        String                                     2731    20 Treasurer mailing address - postal code - USA addresses only     
 78 treasMailingRegion                            String                                     2751    30 Treasurer mailing address - region for country other than USA    
 79 treasPrimaryUsaPhoneFlag                      String                                     2781     1 Treasurer primary phone number - Y if number is a USA phone, N   
                                                                                                  otherwise
 80 treasPrimaryPhoneNumber                       String                                     2782    20 Treasurer primary phone number                                   
 81 treasPrimaryPhoneExt                          String                                     2802    10 Treasurer primary phone extension                                
 82 treasAppointorNameLast                        String                                     2812   100 For INDIVIDUAL, the treasurer last name                          
 83 treasAppointorNameFirst                       String                                     2912    45 For INDIVIDUAL, the treasurer first name                         
 84 treasFilerpersStatusCd                        String                                     2957    30 Treasurer status (CURRENT, etc)                                  
 85 treasEffStartDt                               Date       yyyyMMdd                        2987     8 Treasurer start date                                             
 86 treasEffStopDt                                Date       yyyyMMdd                        2995     8 Treasurer end date                                               
 87 assttreasPersentTypeCd                        String                                     3003    30 Type of asst treasurer name data - INDIVIDUAL or ENTITY          
 88 assttreasNameOrganization                     String                                     3033   100 For ENTITY, the asst treasurer organization name                 
 89 assttreasNameLast                             String                                     3133   100 For INDIVIDUAL, the asst treasurer last name                     
 90 assttreasNameSuffixCd                         String                                     3233    30 For INDIVIDUAL, the asst treasurer name suffix (e.g. JR, MD, II) 
 91 assttreasNameFirst                            String                                     3263    45 For INDIVIDUAL, the asst treasurer first name                    
 92 assttreasNamePrefixCd                         String                                     3308    30 For INDIVIDUAL, the asst treasurer name prefix (e.g. MR, MRS, MS)
 93 assttreasNameShort                            String                                     3338    25 For INDIVIDUAL, the asst treasurer short name (nickname)         
 94 assttreasStreetAddr1                          String                                     3363    55 Asst treasurer street address - line 1                           
 95 assttreasStreetAddr2                          String                                     3418    55 Asst treasurer street address - line 2                           
 96 assttreasStreetCity                           String                                     3473    30 Asst treasurer street address - city                             
 97 assttreasStreetStateCd                        String                                     3503     2 Asst treasurer street address - state code (e.g. TX, CA) - for   
                                                                                                  country=USA/UMI only
 98 assttreasStreetCountyCd                       String                                     3505     5 Asst treasurer street address - Texas county                     
 99 assttreasStreetCountryCd                      String                                     3510     3 Asst treasurer street address - country (e.g. USA, UMI, MEX, CAN)
100 assttreasStreetPostalCode                     String                                     3513    20 Asst treasurer street address - postal code - for USA addresses  
                                                                                                  only
101 assttreasStreetRegion                         String                                     3533    30 Asst treasurer street address - region for country other than USA
102 assttreasPrimaryUsaPhoneFlag                  String                                     3563     1 Asst treasurer primary phone number - Y if number is a USA phone,
                                                                                                  N otherwise
103 assttreasPrimaryPhoneNumber                   String                                     3564    20 Asst treasurer primary phone number                              
104 assttreasPrimaryPhoneExt                      String                                     3584    10 Asst treasurer primary phone extension                           
105 assttreasAppointorNameLast                    String                                     3594   100 For INDIVIDUAL, the asst treasurer last name                     
106 assttreasAppointorNameFirst                   String                                     3694    45 For INDIVIDUAL, the asst treasurer first name                    
107 chairPersentTypeCd                            String                                     3739    30 Type of chair name data - INDIVIDUAL or ENTITY                   
108 chairNameOrganization                         String                                     3769   100 For ENTITY, the chair organization name                          
109 chairNameLast                                 String                                     3869   100 For INDIVIDUAL, the chair last name                              
110 chairNameSuffixCd                             String                                     3969    30 For INDIVIDUAL, the chair name suffix (e.g. JR, MD, II)          
111 chairNameFirst                                String                                     3999    45 For INDIVIDUAL, the chair first name                             
112 chairNamePrefixCd                             String                                     4044    30 For INDIVIDUAL, the chair name prefix (e.g. MR, MRS, MS)         
113 chairNameShort                                String                                     4074    25 For INDIVIDUAL, the chair short name (nickname)                  
114 chairStreetAddr1                              String                                     4099    55 Chair street address - line 1                                    
115 chairStreetAddr2                              String                                     4154    55 Chair street address - line 2                                    
116 chairStreetCity                               String                                     4209    30 Chair street address - city                                      
117 chairStreetStateCd                            String                                     4239     2 Chair street address - state code (e.g. TX, CA) - for            
                                                                                                  country=USA/UMI only
118 chairStreetCountyCd                           String                                     4241     5 Chair street address - Texas county                              
119 chairStreetCountryCd                          String                                     4246     3 Chair street address - country (e.g. USA, UMI, MEX, CAN)         
120 chairStreetPostalCode                         String                                     4249    20 Chair street address - postal code - for USA addresses only      
121 chairStreetRegion                             String                                     4269    30 Chair street address - region for country other than USA         
122 chairMailingAddr1                             String                                     4299    55 Chair mailing address - line 1                                   
123 chairMailingAddr2                             String                                     4354    55 Chair mailing address - line 2                                   
124 chairMailingCity                              String                                     4409    30 Chair mailing address - city                                     
125 chairMailingStateCd                           String                                     4439     2 Chair mailing address - state code (e.g. TX, CA) - for           
                                                                                                  country=USA/UMI only
126 chairMailingCountyCd                          String                                     4441     5 Chair mailing address - Texas county                             
127 chairMailingCountryCd                         String                                     4446     3 Chair mailing address - country (e.g. USA, UMI, MEX, CAN)        
128 chairMailingPostalCode                        String                                     4449    20 Chair mailing address - postal code - USA addresses only         
129 chairMailingRegion                            String                                     4469    30 Chair mailing address - region for country other than USA        
130 chairPrimaryUsaPhoneFlag                      String                                     4499     1 Chair primary phone number - Y if number is a USA phone, N       
                                                                                                  otherwise
131 chairPrimaryPhoneNumber                       String                                     4500    20 Chair primary phone number                                       
132 chairPrimaryPhoneExt                          String                                     4520    10 Chair primary phone extension                                    

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 13     Record Name: FinalData     Length: 393
Description: Final reports.
             File: final.csv

 #  Field Name                                    Type       Mask                           Start   Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- ----- -----------------------------------------------------------------
  1 recordType                                    String                                        1    20 Record type code - always FINL                                   
  2 formTypeCd                                    String                                       21    20 TEC form used                                                    
  3 reportInfoIdent                               Long       00000000000                       41    11 Unique report #                                                  
  4 receivedDt                                    Date       yyyyMMdd                          52     8 Date report received by TEC                                      
  5 infoOnlyFlag                                  String                                       60     1 Superseded by other report                                       
  6 filerIdent                                    String                                       61   100 Filer account #                                                  
  7 filerTypeCd                                   String                                      161    30 Type of filer                                                    
  8 filerName                                     String                                      191   200 Filer name                                                       
  9 finalUnexpendContribFlag                      String                                      391     1 Unexpended contributions indicator                               
 10 finalRetainedAssetsFlag                       String                                      392     1 Retained assets indicator                                        
 11 finalOfficeholderAckFlag                      String                                      393     1 Office holder ack indicator                                      

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 14     Record Name: LoanData     Length: 6055
Description: Loans - Schedule E.
             File: loans.csv

 #  Field Name                                    Type       Mask                           Start   Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- ----- -----------------------------------------------------------------
  1 recordType                                    String                                        1    20 Record type code - always LOAN                                   
  2 formTypeCd                                    String                                       21    20 TEC form used                                                    
  3 schedFormTypeCd                               String                                       41    20 TEC Schedule Used                                                
  4 reportInfoIdent                               Long       00000000000                       61    11 Unique report #                                                  
  5 receivedDt                                    Date       yyyyMMdd                          72     8 Date report received by TEC                                      
  6 infoOnlyFlag                                  String                                       80     1 Superseded by other report                                       
  7 filerIdent                                    String                                       81   100 Filer account #                                                  
  8 filerTypeCd                                   String                                      181    30 Type of filer                                                    
  9 filerName                                     String                                      211   200 Filer name                                                       
 10 loanInfoId                                    Long       00000000000                      411    11 Loan unique identifier                                           
 11 loanDt                                        Date       yyyyMMdd                         422     8 Loan date                                                        
 12 loanAmount                                    BigDecimal 0000000000.00                    430    12 Loan amount                                                      
 13 loanDescr                                     String                                      442   100 Loan description                                                 
 14 interestRate                                  String                                      542    15 Interest rate                                                    
 15 maturityDt                                    Date       yyyyMMdd                         557     8 Loan maturity date                                               
 16 collateralFlag                                String                                      565     1 Collateral indicator                                             
 17 collateralDescr                               String                                      566   100 Collateral description                                           
 18 loanStatusCd                                  String                                      666    30 Loan status (1STRPT, RPTUNPAID, RPTPAID)                         
 19 paymentMadeFlag                               String                                      696     1 Payment made indicator                                           
 20 paymentAmount                                 BigDecimal 0000000000.00                    697    12 Payment amount                                                   
 21 paymentSource                                 String                                      709   100 Source of payment                                                
 22 loanGuaranteedFlag                            String                                      809     1 Loan guaranteed indicator                                        
 23 financialInstitutionFlag                      String                                      810     1 Financial institution indicator                                  
 24 loanGuaranteeAmount                           BigDecimal 0000000000.00                    811    12 Loan guarantee amount                                            
 25 lenderPersentTypeCd                           String                                      823    30 Type of lender name data - INDIVIDUAL or ENTITY                  
 26 lenderNameOrganization                        String                                      853   100 For ENTITY, the lender organization name                         
 27 lenderNameLast                                String                                      953   100 For INDIVIDUAL, the lender last name                             
 28 lenderNameSuffixCd                            String                                     1053    30 For INDIVIDUAL, the lender name suffix (e.g. JR, MD, II)         
 29 lenderNameFirst                               String                                     1083    45 For INDIVIDUAL, the lender first name                            
 30 lenderNamePrefixCd                            String                                     1128    30 For INDIVIDUAL, the lender name prefix (e.g. MR, MRS, MS)        
 31 lenderNameShort                               String                                     1158    25 For INDIVIDUAL, the lender short name (nickname)                 
 32 lenderStreetCity                              String                                     1183    30 Lender street address - city                                     
 33 lenderStreetStateCd                           String                                     1213     2 Lender street address - state code (e.g. TX, CA) - for           
                                                                                                  country=USA/UMI only
 34 lenderStreetCountyCd                          String                                     1215     5 Lender street address - Texas county                             
 35 lenderStreetCountryCd                         String                                     1220     3 Lender street address - country (e.g. USA, UMI, MEX, CAN)        
 36 lenderStreetPostalCode                        String                                     1223    20 Lender street address - postal code - for USA addresses only     
 37 lenderStreetRegion                            String                                     1243    30 Lender street address - region for country other than USA        
 38 lenderEmployer                                String                                     1273    60 Lender employer                                                  
 39 lenderOccupation                              String                                     1333    60 Lender occupation                                                
 40 lenderJobTitle                                String                                     1393    60 Lender job title                                                 
 41 lenderPacFein                                 String                                     1453    12 FEC ID of out-of-state PAC lender                                
 42 lenderOosPacFlag                              String                                     1465     1 Indicates if lender is an out-of-state PAC                       
 43 lenderLawFirmName                             String                                     1466    60 Lender law firm name                                             
 44 lenderSpouseLawFirmName                       String                                     1526    60 Lender spouse law firm name                                      
 45 lenderParent1LawFirmName                      String                                     1586    60 Lender parent #1 law firm name                                   
 46 lenderParent2LawFirmName                      String                                     1646    60 Lender parent #2 law firm name                                   

    Array                                                                                          4350
    loanGuarantorLoanPersent[5/ROW_MAJOR]         CsvPublicExportLoanGuarantorLoanPersent           870 Guarantors for the loan (maximum 5)                              
 47    guarantorPersentTypeCd                     String                                     1706    30 Type of guarantor name data - INDIVIDUAL or ENTITY               
 48    guarantorNameOrganization                  String                                     1736   100 For ENTITY, the guarantor organization name                      
 49    guarantorNameLast                          String                                     1836   100 For INDIVIDUAL, the guarantor last name                          
 50    guarantorNameSuffixCd                      String                                     1936    30 For INDIVIDUAL, the guarantor name suffix (e.g. JR, MD, II)      
 51    guarantorNameFirst                         String                                     1966    45 For INDIVIDUAL, the guarantor first name                         
 52    guarantorNamePrefixCd                      String                                     2011    30 For INDIVIDUAL, the guarantor name prefix (e.g. MR, MRS, MS)     
 53    guarantorNameShort                         String                                     2041    25 For INDIVIDUAL, the guarantor short name (nickname)              
 54    guarantorStreetCity                        String                                     2066    30 Guarantor street address - city                                  
 55    guarantorStreetStateCd                     String                                     2096     2 Guarantor street address - state code (e.g. TX, CA) - for        
                                                                                                  country=USA/UMI only
 56    guarantorStreetCountyCd                    String                                     2098     5 Guarantor street address - Texas county                          
 57    guarantorStreetCountryCd                   String                                     2103     3 Guarantor street address - country (e.g. USA, UMI, MEX, CAN)     
 58    guarantorStreetPostalCode                  String                                     2106    20 Guarantor street address - postal code - for USA addresses only  
 59    guarantorStreetRegion                      String                                     2126    30 Guarantor street address - region for country other than USA     
 60    guarantorEmployer                          String                                     2156    60 Guarantor employer                                               
 61    guarantorOccupation                        String                                     2216    60 Guarantor occupation                                             
 62    guarantorJobTitle                          String                                     2276    60 Guarantor job title                                              
 63    guarantorLawFirmName                       String                                     2336    60 Guarantor law firm name                                          
 64    guarantorSpouseLawFirmName                 String                                     2396    60 Guarantor spouse law firm name                                   
 65    guarantorParent1LawFirmName                String                                     2456    60 Guarantor parent #1 law firm name                                
 66    guarantorParent2LawFirmName                String                                     2516    60 Guarantor parent #2 law firm name                                

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 15     Record Name: PledgeData     Length: 1426
Description: Pledges - Schedule B - Pledges from special session and special pre-election (formerly Telegram) reports are stored in the file 
             pldg_ss and pldg_t. These records are kept separate from the pledges files to avoid creating duplicates, because they are supposed
             to be re-reported on the next regular campaign finance report.
             Files: pledges.csv, pldg_ss.csv, pldg_t.csv

 #  Field Name                                    Type       Mask                           Start   Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- ----- -----------------------------------------------------------------
  1 recordType                                    String                                        1    20 Record type code - always PLDG                                   
  2 formTypeCd                                    String                                       21    20 TEC form used                                                    
  3 schedFormTypeCd                               String                                       41    20 TEC Schedule Used                                                
  4 reportInfoIdent                               Long       00000000000                       61    11 Unique report #                                                  
  5 receivedDt                                    Date       yyyyMMdd                          72     8 Date report received by TEC                                      
  6 infoOnlyFlag                                  String                                       80     1 Superseded by other report                                       
  7 filerIdent                                    String                                       81   100 Filer account #                                                  
  8 filerTypeCd                                   String                                      181    30 Type of filer                                                    
  9 filerName                                     String                                      211   200 Filer name                                                       
 10 pledgeInfoId                                  Long       00000000000                      411    11 Pledge unique identifier                                         
 11 pledgeDt                                      Date       yyyyMMdd                         422     8 Pledge data                                                      
 12 pledgeAmount                                  BigDecimal 0000000000.00                    430    12 Pledge amount                                                    
 13 pledgeDescr                                   String                                      442   100 Pledge description                                               
 14 itemizeFlag                                   String                                      542     1 Y indicates that the pledge is itemized                          
 15 travelFlag                                    String                                      543     1 Y indicates that the pledge has associated travel                
 16 pledgerPersentTypeCd                          String                                      544    30 Type of pledger name data - INDIVIDUAL or ENTITY                 
 17 pledgerNameOrganization                       String                                      574   100 For ENTITY, the pledger organization name                        
 18 pledgerNameLast                               String                                      674   100 For INDIVIDUAL, the pledger last name                            
 19 pledgerNameSuffixCd                           String                                      774    30 For INDIVIDUAL, the pledger name suffix (e.g. JR, MD, II)        
 20 pledgerNameFirst                              String                                      804    45 For INDIVIDUAL, the pledger first name                           
 21 pledgerNamePrefixCd                           String                                      849    30 For INDIVIDUAL, the pledger name prefix (e.g. MR, MRS, MS)       
 22 pledgerNameShort                              String                                      879    25 For INDIVIDUAL, the pledger short name (nickname)                
 23 pledgerStreetCity                             String                                      904    30 Pledger street address - city                                    
 24 pledgerStreetStateCd                          String                                      934     2 Pledger street address - state code (e.g. TX, CA) - for          
                                                                                                  country=USA/UMI only
 25 pledgerStreetCountyCd                         String                                      936     5 Pledger street address - Texas county                            
 26 pledgerStreetCountryCd                        String                                      941     3 Pledger street address - country (e.g. USA, UMI, MEX, CAN)       
 27 pledgerStreetPostalCode                       String                                      944    20 Pledger street address - postal code - for USA addresses only    
 28 pledgerStreetRegion                           String                                      964    30 Pledger street address - region for country other than USA       
 29 pledgerEmployer                               String                                      994    60 Pledger employer                                                 
 30 pledgerOccupation                             String                                     1054    60 Pledger occupation                                               
 31 pledgerJobTitle                               String                                     1114    60 Pledger job title                                                
 32 pledgerPacFein                                String                                     1174    12 For PAC pledger the FEIN                                         
 33 pledgerOosPacFlag                             String                                     1186     1 Indicates if pledger is an out-of-state PAC                      
 34 pledgerLawFirmName                            String                                     1187    60 Pledger law firm name                                            
 35 pledgerSpouseLawFirmName                      String                                     1247    60 Pledger spouse law firm name                                     
 36 pledgerParent1LawFirmName                     String                                     1307    60 Pledger parent #1 law firm name                                  
 37 pledgerParent2LawFirmName                     String                                     1367    60 Pledger parent #2 law firm name                                  

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 16     Record Name: SpacData     Length: 1644
Description: Index of Specific-purpose committees. This file contains links between specific-purpose committees (FILER_TYPE = SPAC, JSPC and 
             SCPC) and the candidates/office holders they support, oppose or assist. The information is entered by TEC staff from the paper 
             Form STA (treasurer appointment for a speficic- purpose committee) and amendments thereto (Form ASTA). TEC staff does not enter 
             links based on information from campaign finance reports. The links are not broken when the STA is terminated.
             File: spacs.csv

 #  Field Name                                    Type       Mask                           Start   Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- ----- -----------------------------------------------------------------
  1 recordType                                    String                                        1    20 Record type code - always SPAC                                   
  2 spacFilerIdent                                String                                       21   100 SPAC filer account #                                             
  3 spacFilerTypeCd                               String                                      121    30 SPAC type of filer                                               
  4 spacFilerName                                 String                                      151   200 SPAC filer name                                                  
  5 spacFilerNameShort                            String                                      351    25 SPAC acronym                                                     
  6 spacCommitteeStatusCd                         String                                      376    30 SPAC committee status (ACTIVE, TERMINATED)                       
  7 spactreasEffStartDt                           Date       yyyyMMdd                         406     8 SPAC treasurer start date                                        
  8 spactreasEffStopDt                            Date       yyyyMMdd                         414     8 SPAC treasurer end date                                          
  9 spacPositionCd                                String                                      422    30 SPAC position (SUPPORT, OPPOSE, ASSIST)                          
 10 candidateFilerIdent                           String                                      452   100 Candidate filer account #                                        
 11 candidateFilerTypeCd                          String                                      552    30 Candidate type of filer                                          
 12 candidateFilerName                            String                                      582   200 Candidate filer name                                             
 13 candidateFilerpersStatusCd                    String                                      782    30 Candidate status (CURRENT, etc)                                  
 14 candidateEffStartDt                           Date       yyyyMMdd                         812     8 Candidate start date                                             
 15 candidateEffStopDt                            Date       yyyyMMdd                         820     8 Candidate end date                                               
 16 candidateHoldOfficeCd                         String                                      828    30 Candidate office held                                            
 17 candidateHoldOfficeDistrict                   String                                      858    11 Candidate office held district                                   
 18 candidateHoldOfficePlace                      String                                      869    11 Candidate office held place                                      
 19 candidateHoldOfficeDescr                      String                                      880   100 Candidate office held description                                
 20 candidateHoldOfficeCountyCd                   String                                      980     5 Candidate office held country code                               
 21 candidateHoldOfficeCountyDescr                String                                      985   100 Candidate office help county description                         
 22 candidateSeekOfficeCd                         String                                     1085    30 Candidate office sought                                          
 23 candidateSeekOfficeDistrict                   String                                     1115    11 Candidate office sought district                                 
 24 candidateSeekOfficePlace                      String                                     1126    11 Candidate office sought place                                    
 25 candidateSeekOfficeDescr                      String                                     1137   100 Candidate office sought description                              
 26 candidateSeekOfficeCountyCd                   String                                     1237     5 Candidate office sought county code                              
 27 candidateSeekOfficeCountyDescr                String                                     1242   100 Candidate office sought county description                       
 28 ctaSeekOfficeCd                               String                                     1342    30 CTA office sought                                                
 29 ctaSeekOfficeDistrict                         String                                     1372    11 CTA office sought district                                       
 30 ctaSeekOfficePlace                            String                                     1383    11 CTA office sought place                                          
 31 ctaSeekOfficeDescr                            String                                     1394   100 CTA office sought description                                    
 32 ctaSeekOfficeCountyCd                         String                                     1494     5 CTA office sought county code                                    
 33 ctaSeekOfficeCountyDescr                      String                                     1499   100 CTA office sought county description                             
 34 candtreasFilerpersStatusCd                    String                                     1599    30 Candidate treasurer status (CURRENT, etc)                        
 35 candtreasEffStartDt                           Date       yyyyMMdd                        1629     8 Candidate treasurer start date                                   
 36 candtreasEffStopDt                            Date       yyyyMMdd                        1637     8 Candidate treasurer end date                                     

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Record #: 17     Record Name: TravelData     Length: 1433
Description: Travel outside the State of Texas - Schedule T - Travel records are linked to records in contribs, pledges and expenditure files 
             through the fields parentType and parentId. They store information about in-kind contributions accepted for travel outside the 
             State of Texas and for expenditures made for travel outside the State of Texas.
             File: travel.csv

 #  Field Name                                    Type       Mask                           Start   Len Description
--- --------------------------------------------- ---------- ------------------------------ ----- ----- -----------------------------------------------------------------
  1 recordType                                    String                                        1    20 Record type code - always TRVL                                   
  2 formTypeCd                                    String                                       21    20 TEC form used                                                    
  3 schedFormTypeCd                               String                                       41    20 TEC Schedule Used                                                
  4 reportInfoIdent                               Long       00000000000                       61    11 Unique report #                                                  
  5 receivedDt                                    Date       yyyyMMdd                          72     8 Date report received by TEC                                      
  6 infoOnlyFlag                                  String                                       80     1 Superseded by other report                                       
  7 filerIdent                                    String                                       81   100 Filer account #                                                  
  8 filerTypeCd                                   String                                      181    30 Type of filer                                                    
  9 filerName                                     String                                      211   200 Filer name                                                       
 10 travelInfoId                                  Long       00000000000                      411    11 Travel unique identifier                                         
 11 parentType                                    String                                      422    20 Parent record type (CONTRIB, EXPEND, PLEDGE)                     
 12 parentId                                      Long       00000000000                      442    11 Parent unique identifier                                         
 13 parentDt                                      Date       yyyyMMdd                         453     8 Date of parent transaction                                       
 14 parentAmount                                  BigDecimal 0000000000.00                    461    12 Amount of parent transaction                                     
 15 parentFullName                                String                                      473   100 Full name associated with parent                                 
 16 transportationTypeCd                          String                                      573    30 Type of transportation (COMMAIR, PRIVAIR, etc)                   
 17 transportationTypeDescr                       String                                      603   100 Transporation type description                                   
 18 departureCity                                 String                                      703    50 Departure city                                                   
 19 arrivalCity                                   String                                      753    50 Arrival city                                                     
 20 departureDt                                   Date       yyyyMMdd                         803     8 Departure date                                                   
 21 arrivalDt                                     Date       yyyyMMdd                         811     8 Arrival date                                                     
 22 travelPurpose                                 String                                      819   255 Purpose of travel                                                
 23 travellerPersentTypeCd                        String                                     1074    30 Type of traveller name data - INDIVIDUAL or ENTITY               
 24 travellerNameOrganization                     String                                     1104   100 For ENTITY, the traveller organization name                      
 25 travellerNameLast                             String                                     1204   100 For INDIVIDUAL, the traveller last name                          
 26 travellerNameSuffixCd                         String                                     1304    30 For INDIVIDUAL, the traveller name suffix (e.g. JR, MD, II)      
 27 travellerNameFirst                            String                                     1334    45 For INDIVIDUAL, the traveller first name                         
 28 travellerNamePrefixCd                         String                                     1379    30 For INDIVIDUAL, the traveller name prefix (e.g. MR, MRS, MS)     
 29 travellerNameShort                            String                                     1409    25 For INDIVIDUAL, the traveller short name (nickname)              

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Legend:
 Type: Data type for the field.
 Mask: For numeric and date fields, a DecimalFormat or SimpleDateFormat mask. BWZ indicates 'Blank When Zero'.
 Start: Starting position of the field on fixed width records.
 Len: Length of the field.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

