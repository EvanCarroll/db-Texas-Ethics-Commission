-- Schema generation for the Texas Ethics Commission
-- Copyright (C) 2018  Evan Carroll
-- 
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Affero General Public License as
-- published by the Free Software Foundation, either version 3 of the
-- License, or (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Affero General Public License for more details.
-- 
-- You should have received a copy of the GNU Affero General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.

\echo LOADING LoanData



CREATE TABLE tec.loandata (
	recordType                              text,
	formTypeCd                              text,
	schedFormTypeCd                         text,
	reportInfoIdent                         int,
	receivedDt                              date,
	infoOnlyFlag                            bool,
	filerIdent                              int,
	filerTypeCd                             text,
	filerName                               text,
	loanInfoId                              bigint              PRIMARY KEY,
	loanDt                                  date,
	loanAmount                              numeric(10,2),
	loanDescr                               text,
	interestRate                            text,
	maturityDt                              date,
	collateralFlag                          bool,
	collateralDescr                         text,
	loanStatusCd                            text,
	paymentMadeFlag                         bool,
	paymentAmount                           numeric(10,2),
	paymentSource                           text,
	loanGuaranteedFlag                      bool,
	financialInstitutionFlag                bool,
	loanGuaranteeAmount                     numeric(10,2),
	lenderPersentTypeCd                     text,
	lenderNameOrganization                  text,
	lenderNameLast                          text,
	lenderNameSuffixCd                      text,
	lenderNameFirst                         text,
	lenderNamePrefixCd                      text,
	lenderNameShort                         text,
	lenderStreetCity                        text,
	lenderStreetStateCd                     text,
	lenderStreetCountyCd                    text,
	lenderStreetCountryCd                   text,
	lenderStreetPostalCode                  text,
	lenderStreetRegion                      text,
	lenderEmployer                          text,
	lenderOccupation                        text,
	lenderJobTitle                          text,
	lenderPacFein                           text,
	lenderOosPacFlag                        bool,
	lenderSpouseLawFirmName                 text,
	lenderParent1LawFirmName                text,
	lenderParent2LawFirmName                text,
	guarantorPersentTypeCd1                 text,
	guarantorNameOrganization1              text,
	guarantorNameLast1                      text,
	guarantorNameSuffixCd1                  text,
	guarantorNameFirst1                     text,
	guarantorNamePrefixCd1                  text,
	guarantorNameShort1                     text,
	guarantorStreetCity1                    text,
	guarantorStreetStateCd1                 text,
	guarantorStreetCountyCd1                text,
	guarantorStreetCountryCd1               text,
	guarantorStreetPostalCode1              text,
	guarantorStreetRegion1                  text,
	guarantorEmployer1                      text,
	guarantorOccupation1                    text,
	guarantorJobTitle1                      text,
	guarantorSpouseLawFirmName1             text,
	guarantorParent1LawFirmName1            text,
	guarantorParent2LawFirmName1            text,
	guarantorPersentTypeCd2                 text,
	guarantorNameOrganization2              text,
	guarantorNameLast2                      text,
	guarantorNameSuffixCd2                  text,
	guarantorNameFirst2                     text,
	guarantorNamePrefixCd2                  text,
	guarantorNameShort2                     text,
	guarantorStreetCity2                    text,
	guarantorStreetStateCd2                 text,
	guarantorStreetCountyCd2                text,
	guarantorStreetCountryCd2               text,
	guarantorStreetPostalCode2              text,
	guarantorStreetRegion2                  text,
	guarantorEmployer2                      text,
	guarantorOccupation2                    text,
	guarantorJobTitle2                      text,
	guarantorSpouseLawFirmName2             text,
	guarantorParent1LawFirmName2            text,
	guarantorParent2LawFirmName2            text,
	guarantorPersentTypeCd3                 text,
	guarantorNameOrganization3              text,
	guarantorNameLast3                      text,
	guarantorNameSuffixCd3                  text,
	guarantorNameFirst3                     text,
	guarantorNamePrefixCd3                  text,
	guarantorNameShort3                     text,
	guarantorStreetCity3                    text,
	guarantorStreetStateCd3                 text,
	guarantorStreetCountyCd3                text,
	guarantorStreetCountryCd3               text,
	guarantorStreetPostalCode3              text,
	guarantorStreetRegion3                  text,
	guarantorEmployer3                      text,
	guarantorOccupation3                    text,
	guarantorJobTitle3                      text,
	guarantorSpouseLawFirmName3             text,
	guarantorParent1LawFirmName3            text,
	guarantorParent2LawFirmName3            text,
	guarantorPersentTypeCd4                 text,
	guarantorNameOrganization4              text,
	guarantorNameLast4                      text,
	guarantorNameSuffixCd4                  text,
	guarantorNameFirst4                     text,
	guarantorNamePrefixCd4                  text,
	guarantorNameShort4                     text,
	guarantorStreetCity4                    text,
	guarantorStreetStateCd4                 text,
	guarantorStreetCountyCd4                text,
	guarantorStreetCountryCd4               text,
	guarantorStreetPostalCode4              text,
	guarantorStreetRegion4                  text,
	guarantorEmployer4                      text,
	guarantorOccupation4                    text,
	guarantorJobTitle4                      text,
	guarantorSpouseLawFirmName4             text,
	guarantorParent1LawFirmName4            text,
	guarantorParent2LawFirmName4            text,
	guarantorPersentTypeCd5                 text,
	guarantorNameOrganization5              text,
	guarantorNameLast5                      text,
	guarantorNameSuffixCd5                  text,
	guarantorNameFirst5                     text,
	guarantorNamePrefixCd5                  text,
	guarantorNameShort5                     text,
	guarantorStreetCity5                    text,
	guarantorStreetStateCd5                 text,
	guarantorStreetCountyCd5                text,
	guarantorStreetCountryCd5               text,
	guarantorStreetPostalCode5              text,
	guarantorStreetRegion5                  text,
	guarantorEmployer5                      text,
	guarantorOccupation5                    text,
	guarantorJobTitle5                      text,
	guarantorSpouseLawFirmName5             text,
	guarantorParent1LawFirmName5            text,
	guarantorParent2LawFirmName5            text,
	FOREIGN KEY (filerIdent, filerTypeCd) REFERENCES tec.FilerData
);

COMMENT ON TABLE tec.loandata IS $$Loans - Schedule E. File: loans.csv$$;
COMMENT ON COLUMN tec.loandata.recordtype IS $$Record type code - always LOAN$$;
COMMENT ON COLUMN tec.loandata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.loandata.schedformtypecd IS $$TEC Schedule Used$$;
COMMENT ON COLUMN tec.loandata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.loandata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.loandata.infoonlyflag IS $$Superseded by other report$$;
COMMENT ON COLUMN tec.loandata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.loandata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.loandata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.loandata.loaninfoid IS $$Loan unique identifier$$;
COMMENT ON COLUMN tec.loandata.loandt IS $$Loan date$$;
COMMENT ON COLUMN tec.loandata.loanamount IS $$Loan amount$$;
COMMENT ON COLUMN tec.loandata.loandescr IS $$Loan description$$;
COMMENT ON COLUMN tec.loandata.interestrate IS $$Interest rate$$;
COMMENT ON COLUMN tec.loandata.maturitydt IS $$Loan maturity date$$;
COMMENT ON COLUMN tec.loandata.collateralflag IS $$Collateral indicator$$;
COMMENT ON COLUMN tec.loandata.collateraldescr IS $$Collateral description$$;
COMMENT ON COLUMN tec.loandata.loanstatuscd IS $$Loan status (1STRPT, RPTUNPAID, RPTPAID)$$;
COMMENT ON COLUMN tec.loandata.paymentmadeflag IS $$Payment made indicator$$;
COMMENT ON COLUMN tec.loandata.paymentamount IS $$Payment amount$$;
COMMENT ON COLUMN tec.loandata.paymentsource IS $$Source of payment$$;
COMMENT ON COLUMN tec.loandata.loanguaranteedflag IS $$Loan guaranteed indicator$$;
COMMENT ON COLUMN tec.loandata.financialinstitutionflag IS $$Financial institution indicator$$;
COMMENT ON COLUMN tec.loandata.loanguaranteeamount IS $$Loan guarantee amount$$;
COMMENT ON COLUMN tec.loandata.lenderpersenttypecd IS $$Type of lender name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.loandata.lendernameorganization IS $$For ENTITY, the lender organization name$$;
COMMENT ON COLUMN tec.loandata.lendernamelast IS $$For INDIVIDUAL, the lender last name$$;
COMMENT ON COLUMN tec.loandata.lendernamesuffixcd IS $$For INDIVIDUAL, the lender name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.loandata.lendernamefirst IS $$For INDIVIDUAL, the lender first name$$;
COMMENT ON COLUMN tec.loandata.lendernameprefixcd IS $$For INDIVIDUAL, the lender name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.loandata.lendernameshort IS $$For INDIVIDUAL, the lender short name (nickname)$$;
COMMENT ON COLUMN tec.loandata.lenderstreetcity IS $$Lender street address - city$$;
COMMENT ON COLUMN tec.loandata.lenderstreetstatecd IS $$Lender street address - state code (e.g. TX, CA) - for           country=USA/UMI only$$;
COMMENT ON COLUMN tec.loandata.lenderstreetcountycd IS $$Lender street address - Texas county$$;
COMMENT ON COLUMN tec.loandata.lenderstreetcountrycd IS $$Lender street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.loandata.lenderstreetpostalcode IS $$Lender street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.loandata.lenderstreetregion IS $$Lender street address - region for country other than USA$$;
COMMENT ON COLUMN tec.loandata.lenderemployer IS $$Lender employer$$;
COMMENT ON COLUMN tec.loandata.lenderoccupation IS $$Lender occupation$$;
COMMENT ON COLUMN tec.loandata.lenderjobtitle IS $$Lender job title$$;
COMMENT ON COLUMN tec.loandata.lenderpacfein IS $$FEC ID of out-of-state PAC lender$$;
COMMENT ON COLUMN tec.loandata.lenderoospacflag IS $$Indicates if lender is an out-of-state PAC$$;
COMMENT ON COLUMN tec.loandata.lenderspouselawfirmname IS $$Lender spouse law firm name$$;
COMMENT ON COLUMN tec.loandata.lenderparent1lawfirmname IS $$Lender parent #1 law firm name$$;
COMMENT ON COLUMN tec.loandata.lenderparent2lawfirmname IS $$Lender parent #2 law firm name$$;
COMMENT ON COLUMN tec.loandata.guarantorpersenttypecd1 IS $$1: Type of guarantor name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.loandata.guarantornameorganization1 IS $$1: For ENTITY, the guarantor organization name$$;
COMMENT ON COLUMN tec.loandata.guarantornamelast1 IS $$1: For INDIVIDUAL, the guarantor last name$$;
COMMENT ON COLUMN tec.loandata.guarantornamesuffixcd1 IS $$1: For INDIVIDUAL, the guarantor name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.loandata.guarantornamefirst1 IS $$1: For INDIVIDUAL, the guarantor first name$$;
COMMENT ON COLUMN tec.loandata.guarantornameprefixcd1 IS $$1: For INDIVIDUAL, the guarantor name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.loandata.guarantornameshort1 IS $$1: For INDIVIDUAL, the guarantor short name (nickname)$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetcity1 IS $$1: Guarantor street address - city$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetstatecd1 IS $$1: Guarantor street address - state code (e.g. TX, CA) - for        country=USA/UMI only$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetcountycd1 IS $$1: Guarantor street address - Texas county$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetcountrycd1 IS $$1: Guarantor street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetpostalcode1 IS $$1: Guarantor street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetregion1 IS $$1: Guarantor street address - region for country other than USA$$;
COMMENT ON COLUMN tec.loandata.guarantoremployer1 IS $$1: Guarantor employer$$;
COMMENT ON COLUMN tec.loandata.guarantoroccupation1 IS $$1: Guarantor occupation$$;
COMMENT ON COLUMN tec.loandata.guarantorjobtitle1 IS $$1: Guarantor job title$$;
COMMENT ON COLUMN tec.loandata.guarantorspouselawfirmname1 IS $$1: Guarantor spouse law firm name$$;
COMMENT ON COLUMN tec.loandata.guarantorparent1lawfirmname1 IS $$1: Guarantor parent #1 law firm name$$;
COMMENT ON COLUMN tec.loandata.guarantorparent2lawfirmname1 IS $$1: Guarantor parent #2 law firm name$$;
COMMENT ON COLUMN tec.loandata.guarantorpersenttypecd2 IS $$2: Type of guarantor name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.loandata.guarantornameorganization2 IS $$2: For ENTITY, the guarantor organization name$$;
COMMENT ON COLUMN tec.loandata.guarantornamelast2 IS $$2: For INDIVIDUAL, the guarantor last name$$;
COMMENT ON COLUMN tec.loandata.guarantornamesuffixcd2 IS $$2: For INDIVIDUAL, the guarantor name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.loandata.guarantornamefirst2 IS $$2: For INDIVIDUAL, the guarantor first name$$;
COMMENT ON COLUMN tec.loandata.guarantornameprefixcd2 IS $$2: For INDIVIDUAL, the guarantor name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.loandata.guarantornameshort2 IS $$2: For INDIVIDUAL, the guarantor short name (nickname)$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetcity2 IS $$2: Guarantor street address - city$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetstatecd2 IS $$2: Guarantor street address - state code (e.g. TX, CA) - for        country=USA/UMI only$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetcountycd2 IS $$2: Guarantor street address - Texas county$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetcountrycd2 IS $$2: Guarantor street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetpostalcode2 IS $$2: Guarantor street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetregion2 IS $$2: Guarantor street address - region for country other than USA$$;
COMMENT ON COLUMN tec.loandata.guarantoremployer2 IS $$2: Guarantor employer$$;
COMMENT ON COLUMN tec.loandata.guarantoroccupation2 IS $$2: Guarantor occupation$$;
COMMENT ON COLUMN tec.loandata.guarantorjobtitle2 IS $$2: Guarantor job title$$;
COMMENT ON COLUMN tec.loandata.guarantorspouselawfirmname2 IS $$2: Guarantor spouse law firm name$$;
COMMENT ON COLUMN tec.loandata.guarantorparent1lawfirmname2 IS $$2: Guarantor parent #1 law firm name$$;
COMMENT ON COLUMN tec.loandata.guarantorparent2lawfirmname2 IS $$2: Guarantor parent #2 law firm name$$;
COMMENT ON COLUMN tec.loandata.guarantorpersenttypecd3 IS $$3: Type of guarantor name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.loandata.guarantornameorganization3 IS $$3: For ENTITY, the guarantor organization name$$;
COMMENT ON COLUMN tec.loandata.guarantornamelast3 IS $$3: For INDIVIDUAL, the guarantor last name$$;
COMMENT ON COLUMN tec.loandata.guarantornamesuffixcd3 IS $$3: For INDIVIDUAL, the guarantor name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.loandata.guarantornamefirst3 IS $$3: For INDIVIDUAL, the guarantor first name$$;
COMMENT ON COLUMN tec.loandata.guarantornameprefixcd3 IS $$3: For INDIVIDUAL, the guarantor name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.loandata.guarantornameshort3 IS $$3: For INDIVIDUAL, the guarantor short name (nickname)$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetcity3 IS $$3: Guarantor street address - city$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetstatecd3 IS $$3: Guarantor street address - state code (e.g. TX, CA) - for        country=USA/UMI only$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetcountycd3 IS $$3: Guarantor street address - Texas county$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetcountrycd3 IS $$3: Guarantor street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetpostalcode3 IS $$3: Guarantor street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetregion3 IS $$3: Guarantor street address - region for country other than USA$$;
COMMENT ON COLUMN tec.loandata.guarantoremployer3 IS $$3: Guarantor employer$$;
COMMENT ON COLUMN tec.loandata.guarantoroccupation3 IS $$3: Guarantor occupation$$;
COMMENT ON COLUMN tec.loandata.guarantorjobtitle3 IS $$3: Guarantor job title$$;
COMMENT ON COLUMN tec.loandata.guarantorspouselawfirmname3 IS $$3: Guarantor spouse law firm name$$;
COMMENT ON COLUMN tec.loandata.guarantorparent1lawfirmname3 IS $$3: Guarantor parent #1 law firm name$$;
COMMENT ON COLUMN tec.loandata.guarantorparent2lawfirmname3 IS $$3: Guarantor parent #2 law firm name$$;
COMMENT ON COLUMN tec.loandata.guarantorpersenttypecd4 IS $$4: Type of guarantor name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.loandata.guarantornameorganization4 IS $$4: For ENTITY, the guarantor organization name$$;
COMMENT ON COLUMN tec.loandata.guarantornamelast4 IS $$4: For INDIVIDUAL, the guarantor last name$$;
COMMENT ON COLUMN tec.loandata.guarantornamesuffixcd4 IS $$4: For INDIVIDUAL, the guarantor name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.loandata.guarantornamefirst4 IS $$4: For INDIVIDUAL, the guarantor first name$$;
COMMENT ON COLUMN tec.loandata.guarantornameprefixcd4 IS $$4: For INDIVIDUAL, the guarantor name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.loandata.guarantornameshort4 IS $$4: For INDIVIDUAL, the guarantor short name (nickname)$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetcity4 IS $$4: Guarantor street address - city$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetstatecd4 IS $$4: Guarantor street address - state code (e.g. TX, CA) - for        country=USA/UMI only$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetcountycd4 IS $$4: Guarantor street address - Texas county$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetcountrycd4 IS $$4: Guarantor street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetpostalcode4 IS $$4: Guarantor street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetregion4 IS $$4: Guarantor street address - region for country other than USA$$;
COMMENT ON COLUMN tec.loandata.guarantoremployer4 IS $$4: Guarantor employer$$;
COMMENT ON COLUMN tec.loandata.guarantoroccupation4 IS $$4: Guarantor occupation$$;
COMMENT ON COLUMN tec.loandata.guarantorjobtitle4 IS $$4: Guarantor job title$$;
COMMENT ON COLUMN tec.loandata.guarantorspouselawfirmname4 IS $$4: Guarantor spouse law firm name$$;
COMMENT ON COLUMN tec.loandata.guarantorparent1lawfirmname4 IS $$4: Guarantor parent #1 law firm name$$;
COMMENT ON COLUMN tec.loandata.guarantorparent2lawfirmname4 IS $$4: Guarantor parent #2 law firm name$$;
COMMENT ON COLUMN tec.loandata.guarantorpersenttypecd5 IS $$5: Type of guarantor name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.loandata.guarantornameorganization5 IS $$5: For ENTITY, the guarantor organization name$$;
COMMENT ON COLUMN tec.loandata.guarantornamelast5 IS $$5: For INDIVIDUAL, the guarantor last name$$;
COMMENT ON COLUMN tec.loandata.guarantornamesuffixcd5 IS $$5: For INDIVIDUAL, the guarantor name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.loandata.guarantornamefirst5 IS $$5: For INDIVIDUAL, the guarantor first name$$;
COMMENT ON COLUMN tec.loandata.guarantornameprefixcd5 IS $$5: For INDIVIDUAL, the guarantor name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.loandata.guarantornameshort5 IS $$5: For INDIVIDUAL, the guarantor short name (nickname)$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetcity5 IS $$5: Guarantor street address - city$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetstatecd5 IS $$5: Guarantor street address - state code (e.g. TX, CA) - for        country=USA/UMI only$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetcountycd5 IS $$5: Guarantor street address - Texas county$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetcountrycd5 IS $$5: Guarantor street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetpostalcode5 IS $$5: Guarantor street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.loandata.guarantorstreetregion5 IS $$5: Guarantor street address - region for country other than USA$$;
COMMENT ON COLUMN tec.loandata.guarantoremployer5 IS $$5: Guarantor employer$$;
COMMENT ON COLUMN tec.loandata.guarantoroccupation5 IS $$5: Guarantor occupation$$;
COMMENT ON COLUMN tec.loandata.guarantorjobtitle5 IS $$5: Guarantor job title$$;
COMMENT ON COLUMN tec.loandata.guarantorspouselawfirmname5 IS $$5: Guarantor spouse law firm name$$;
COMMENT ON COLUMN tec.loandata.guarantorparent1lawfirmname5 IS $$5: Guarantor parent #1 law firm name$$;
COMMENT ON COLUMN tec.loandata.guarantorparent2lawfirmname5 IS $$5: Guarantor parent #2 law firm name$$;
\COPY tec.loandata FROM 'data/TEC_CF_CSV/loans.csv' WITH ( FORMAT CSV , HEADER true )