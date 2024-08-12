-- Schema generation for the Texas Ethics Commission
-- Copyright (C) 2024  Evan Carroll
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

\echo LOADING c_CoverSheet1Data


CREATE TABLE tec.c_CoverSheet1Data (
	recordType                              text,
	formTypeCd                              text,
	reportInfoIdent                         int,
	receivedDt                              date,
	infoOnlyFlag                            bool,
	filerIdent                              int,
	filerTypeCd                             text,
	filerName                               text,
	reportTypeCd1                           text,
	reportTypeCd2                           text,
	reportTypeCd3                           text,
	reportTypeCd4                           text,
	reportTypeCd5                           text,
	reportTypeCd6                           text,
	reportTypeCd7                           text,
	reportTypeCd8                           text,
	reportTypeCd9                           text,
	reportTypeCd10                          text,
	sourceCategoryCd                        text,
	dueDt                                   date,
	filedDt                                 date,
	periodStartDt                           date,
	periodEndDt                             date,
	unitemizedContribAmount                 numeric(12,2),
	totalContribAmount                      numeric(12,2),
	unitemizedExpendAmount                  numeric(12,2),
	totalExpendAmount                       numeric(12,2),
	loanBalanceAmount                       numeric(12,2),
	contribsMaintainedAmount                numeric(12,2),
	unitemizedPledgeAmount                  numeric(12,2),
	unitemizedLoanAmount                    numeric(12,2),
	totalInterestEarnedAmount               numeric(12,2),
	electionDt                              date,
	electionTypeCd                          text,
	electionTypeDescr                       text,
	noActivityFlag                          bool,
	politicalPartyCd                        text,
	politicalDivisionCd                     text,
	politicalPartyOtherDescr                text,
	politicalPartyCountyCd                  text,
	timelyCorrectionFlag                    bool,
	semiannualCheckboxFlag                  bool,
	highContribThreshholdCd                 text,
	softwareRelease                         text,
	internetVisibleFlag                     bool,
	signerPrintedName                       text,
	addrChangeFilerFlag                     bool,
	addrChangeTreasFlag                     bool,
	addrChangeChairFlag                     bool,
	filerPersentTypeCd                      text,
	filerNameOrganization                   text,
	filerNameLast                           text,
	filerNameSuffixCd                       text,
	filerNameFirst                          text,
	filerNamePrefixCd                       text,
	filerNameShort                          text,
	filerStreetAddr1                        text,
	filerStreetAddr2                        text,
	filerStreetCity                         text,
	filerStreetStateCd                      text,
	filerStreetCountyCd                     text,
	filerStreetCountryCd                    char(3),
	filerStreetPostalCode                   text,
	filerStreetRegion                       text,
	filerHoldOfficeCd                       text,
	filerHoldOfficeDistrict                 text,
	filerHoldOfficePlace                    text,
	filerHoldOfficeDescr                    text,
	filerHoldOfficeCountyCd                 text,
	filerHoldOfficeCountyDescr              text,
	filerSeekOfficeCd                       text,
	filerSeekOfficeDistrict                 text,
	filerSeekOfficePlace                    text,
	filerSeekOfficeDescr                    text,
	filerSeekOfficeCountyCd                 text,
	filerSeekOfficeCountyDescr              text,
	treasPersentTypeCd                      text,
	treasNameOrganization                   text,
	treasNameLast                           text,
	treasNameSuffixCd                       text,
	treasNameFirst                          text,
	treasNamePrefixCd                       text,
	treasNameShort                          text,
	treasStreetAddr1                        text,
	treasStreetAddr2                        text,
	treasStreetCity                         text,
	treasStreetStateCd                      text,
	treasStreetCountyCd                     text,
	treasStreetCountryCd                    char(3),
	treasStreetPostalCode                   text,
	treasStreetRegion                       text,
	treasMailingAddr1                       text,
	treasMailingAddr2                       text,
	treasMailingCity                        text,
	treasMailingStateCd                     text,
	treasMailingCountyCd                    text,
	treasMailingCountryCd                   char(3),
	treasMailingPostalCode                  text,
	treasMailingRegion                      text,
	treasPrimaryUsaPhoneFlag                bool,
	treasPrimaryPhoneNumber                 text,
	treasPrimaryPhoneExt                    text,
	chairPersentTypeCd                      text,
	chairNameOrganization                   text,
	chairNameLast                           text,
	chairNameSuffixCd                       text,
	chairNameFirst                          text,
	chairNamePrefixCd                       text,
	chairNameShort                          text,
	chairStreetAddr1                        text,
	chairStreetAddr2                        text,
	chairStreetCity                         text,
	chairStreetStateCd                      text,
	chairStreetCountyCd                     text,
	chairStreetCountryCd                    char(3),
	chairStreetPostalCode                   text,
	chairStreetRegion                       text,
	chairMailingAddr1                       text,
	chairMailingAddr2                       text,
	chairMailingCity                        text,
	chairMailingStateCd                     text,
	chairMailingCountyCd                    text,
	chairMailingCountryCd                   char(3),
	chairMailingPostalCode                  text,
	chairMailingRegion                      text,
	chairPrimaryUsaPhoneFlag                bool,
	chairPrimaryPhoneNumber                 text,
	chairPrimaryPhoneExt                    text,
	PRIMARY KEY (reportInfoIdent)
);
COMMENT ON TABLE tec.c_CoverSheet1Data IS $$Cover Sheet 1 - Cover sheet information and totals. cover_ss and cover_t contain cover sheet information for special session reports and special pre-election (formerly Telegram) Reports. Cover sheets for these reports do not contain totals. Files: cover.csv, cover_ss.csv, cover_t.csv$$;
COMMENT ON COLUMN tec.c_coversheet1data.recordtype IS $$Record type code - always CVR1$$;
COMMENT ON COLUMN tec.c_coversheet1data.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.c_coversheet1data.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.c_coversheet1data.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.c_coversheet1data.infoonlyflag IS $$Superseded by other report$$;
COMMENT ON COLUMN tec.c_coversheet1data.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.c_coversheet1data.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.c_coversheet1data.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.c_coversheet1data.reporttypecd1 IS $$1: Report type covered$$;
COMMENT ON COLUMN tec.c_coversheet1data.reporttypecd2 IS $$2: Report type covered$$;
COMMENT ON COLUMN tec.c_coversheet1data.reporttypecd3 IS $$3: Report type covered$$;
COMMENT ON COLUMN tec.c_coversheet1data.reporttypecd4 IS $$4: Report type covered$$;
COMMENT ON COLUMN tec.c_coversheet1data.reporttypecd5 IS $$5: Report type covered$$;
COMMENT ON COLUMN tec.c_coversheet1data.reporttypecd6 IS $$6: Report type covered$$;
COMMENT ON COLUMN tec.c_coversheet1data.reporttypecd7 IS $$7: Report type covered$$;
COMMENT ON COLUMN tec.c_coversheet1data.reporttypecd8 IS $$8: Report type covered$$;
COMMENT ON COLUMN tec.c_coversheet1data.reporttypecd9 IS $$9: Report type covered$$;
COMMENT ON COLUMN tec.c_coversheet1data.reporttypecd10 IS $$10: Report type covered$$;
COMMENT ON COLUMN tec.c_coversheet1data.sourcecategorycd IS $$Source of report (ELECTRONIC, KEYED)$$;
COMMENT ON COLUMN tec.c_coversheet1data.duedt IS $$Report due date$$;
COMMENT ON COLUMN tec.c_coversheet1data.fileddt IS $$Date report was filed (postmark)$$;
COMMENT ON COLUMN tec.c_coversheet1data.periodstartdt IS $$Beginning of period covered$$;
COMMENT ON COLUMN tec.c_coversheet1data.periodenddt IS $$Ending of period covered$$;
COMMENT ON COLUMN tec.c_coversheet1data.unitemizedcontribamount IS $$Total unitemized political contribs$$;
COMMENT ON COLUMN tec.c_coversheet1data.totalcontribamount IS $$Total political contribs$$;
COMMENT ON COLUMN tec.c_coversheet1data.unitemizedexpendamount IS $$Total unitemized political expend below threshold$$;
COMMENT ON COLUMN tec.c_coversheet1data.totalexpendamount IS $$Total political expend$$;
COMMENT ON COLUMN tec.c_coversheet1data.loanbalanceamount IS $$Total principal amount of all outstanding loans as of the last   day of the reporting period$$;
COMMENT ON COLUMN tec.c_coversheet1data.contribsmaintainedamount IS $$Total contributions maintained as of the last day of the         reporting period$$;
COMMENT ON COLUMN tec.c_coversheet1data.unitemizedpledgeamount IS $$Total unitemized pledges$$;
COMMENT ON COLUMN tec.c_coversheet1data.unitemizedloanamount IS $$Total unitemized loans$$;
COMMENT ON COLUMN tec.c_coversheet1data.totalinterestearnedamount IS $$Total amount of interest and other income earned on unexpended   political contributions during the previous year$$;
COMMENT ON COLUMN tec.c_coversheet1data.electiondt IS $$Election date$$;
COMMENT ON COLUMN tec.c_coversheet1data.electiontypecd IS $$Election type (PRIMARY, GENERAL, etc)$$;
COMMENT ON COLUMN tec.c_coversheet1data.electiontypedescr IS $$Election type description (electionTypeCd=OTHER)$$;
COMMENT ON COLUMN tec.c_coversheet1data.noactivityflag IS $$No activity indicator$$;
COMMENT ON COLUMN tec.c_coversheet1data.politicalpartycd IS $$Political party (DEM, REP, LIB, etc)$$;
COMMENT ON COLUMN tec.c_coversheet1data.politicaldivisioncd IS $$Political division (STATE, COUNTY, etc)$$;
COMMENT ON COLUMN tec.c_coversheet1data.politicalpartyotherdescr IS $$Political party description (politicalPartyCd=OTHER)$$;
COMMENT ON COLUMN tec.c_coversheet1data.politicalpartycountycd IS $$Political party county$$;
COMMENT ON COLUMN tec.c_coversheet1data.timelycorrectionflag IS $$Correction aff timely indicator$$;
COMMENT ON COLUMN tec.c_coversheet1data.semiannualcheckboxflag IS $$Correction aff semiannual indicator$$;
COMMENT ON COLUMN tec.c_coversheet1data.highcontribthreshholdcd IS $$High itemization threshold indicator$$;
COMMENT ON COLUMN tec.c_coversheet1data.softwarerelease IS $$Software release (version)$$;
COMMENT ON COLUMN tec.c_coversheet1data.internetvisibleflag IS $$Internet visible indicator$$;
COMMENT ON COLUMN tec.c_coversheet1data.signerprintedname IS $$Document signer name$$;
COMMENT ON COLUMN tec.c_coversheet1data.addrchangefilerflag IS $$Filer address change indicator$$;
COMMENT ON COLUMN tec.c_coversheet1data.addrchangetreasflag IS $$Treasurer address change indicator$$;
COMMENT ON COLUMN tec.c_coversheet1data.addrchangechairflag IS $$Chair address change indicator$$;
COMMENT ON COLUMN tec.c_coversheet1data.filerpersenttypecd IS $$Type of filer name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.c_coversheet1data.filernameorganization IS $$For ENTITY, the filer organization name$$;
COMMENT ON COLUMN tec.c_coversheet1data.filernamelast IS $$For INDIVIDUAL, the filer last name$$;
COMMENT ON COLUMN tec.c_coversheet1data.filernamesuffixcd IS $$For INDIVIDUAL, the filer name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.c_coversheet1data.filernamefirst IS $$For INDIVIDUAL, the filer first name$$;
COMMENT ON COLUMN tec.c_coversheet1data.filernameprefixcd IS $$For INDIVIDUAL, the filer name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.c_coversheet1data.filernameshort IS $$For INDIVIDUAL, the filer short name (nickname)$$;
COMMENT ON COLUMN tec.c_coversheet1data.filerstreetaddr1 IS $$Filer street address - line 1$$;
COMMENT ON COLUMN tec.c_coversheet1data.filerstreetaddr2 IS $$Filer street address - line 2$$;
COMMENT ON COLUMN tec.c_coversheet1data.filerstreetcity IS $$Filer street address - city$$;
COMMENT ON COLUMN tec.c_coversheet1data.filerstreetstatecd IS $$Filer street address - state code (e.g. TX, CA) - for            country=USA/UMI only$$;
COMMENT ON COLUMN tec.c_coversheet1data.filerstreetcountycd IS $$Filer street address - Texas county$$;
COMMENT ON COLUMN tec.c_coversheet1data.filerstreetcountrycd IS $$Filer street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.c_coversheet1data.filerstreetpostalcode IS $$Filer street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.c_coversheet1data.filerstreetregion IS $$Filer street address - region for country other than USA$$;
COMMENT ON COLUMN tec.c_coversheet1data.filerholdofficecd IS $$Filer office held$$;
COMMENT ON COLUMN tec.c_coversheet1data.filerholdofficedistrict IS $$Filer office held district$$;
COMMENT ON COLUMN tec.c_coversheet1data.filerholdofficeplace IS $$Filer office held place$$;
COMMENT ON COLUMN tec.c_coversheet1data.filerholdofficedescr IS $$Filer office held description$$;
COMMENT ON COLUMN tec.c_coversheet1data.filerholdofficecountycd IS $$Filer office held country code$$;
COMMENT ON COLUMN tec.c_coversheet1data.filerholdofficecountydescr IS $$Filer office help county description$$;
COMMENT ON COLUMN tec.c_coversheet1data.filerseekofficecd IS $$Filer office sought$$;
COMMENT ON COLUMN tec.c_coversheet1data.filerseekofficedistrict IS $$Filer office sought district$$;
COMMENT ON COLUMN tec.c_coversheet1data.filerseekofficeplace IS $$Filer office sought place$$;
COMMENT ON COLUMN tec.c_coversheet1data.filerseekofficedescr IS $$Filer office sought description$$;
COMMENT ON COLUMN tec.c_coversheet1data.filerseekofficecountycd IS $$Filer office sought county code$$;
COMMENT ON COLUMN tec.c_coversheet1data.filerseekofficecountydescr IS $$Filer office sought county description$$;
COMMENT ON COLUMN tec.c_coversheet1data.treaspersenttypecd IS $$Type of treasurer name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.c_coversheet1data.treasnameorganization IS $$For ENTITY, the treasurer organization name$$;
COMMENT ON COLUMN tec.c_coversheet1data.treasnamelast IS $$For INDIVIDUAL, the treasurer last name$$;
COMMENT ON COLUMN tec.c_coversheet1data.treasnamesuffixcd IS $$For INDIVIDUAL, the treasurer name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.c_coversheet1data.treasnamefirst IS $$For INDIVIDUAL, the treasurer first name$$;
COMMENT ON COLUMN tec.c_coversheet1data.treasnameprefixcd IS $$For INDIVIDUAL, the treasurer name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.c_coversheet1data.treasnameshort IS $$For INDIVIDUAL, the treasurer short name (nickname)$$;
COMMENT ON COLUMN tec.c_coversheet1data.treasstreetaddr1 IS $$Treasurer street address - line 1$$;
COMMENT ON COLUMN tec.c_coversheet1data.treasstreetaddr2 IS $$Treasurer street address - line 2$$;
COMMENT ON COLUMN tec.c_coversheet1data.treasstreetcity IS $$Treasurer street address - city$$;
COMMENT ON COLUMN tec.c_coversheet1data.treasstreetstatecd IS $$Treasurer street address - state code (e.g. TX, CA) - for        country=USA/UMI only$$;
COMMENT ON COLUMN tec.c_coversheet1data.treasstreetcountycd IS $$Treasurer street address - Texas county$$;
COMMENT ON COLUMN tec.c_coversheet1data.treasstreetcountrycd IS $$Treasurer street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.c_coversheet1data.treasstreetpostalcode IS $$Treasurer street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.c_coversheet1data.treasstreetregion IS $$Treasurer street address - region for country other than USA$$;
COMMENT ON COLUMN tec.c_coversheet1data.treasmailingaddr1 IS $$Treasurer mailing address - line 1$$;
COMMENT ON COLUMN tec.c_coversheet1data.treasmailingaddr2 IS $$Treasurer mailing address - line 2$$;
COMMENT ON COLUMN tec.c_coversheet1data.treasmailingcity IS $$Treasurer mailing address - city$$;
COMMENT ON COLUMN tec.c_coversheet1data.treasmailingstatecd IS $$Treasurer mailing address - state code (e.g. TX, CA) - for       country=USA/UMI only$$;
COMMENT ON COLUMN tec.c_coversheet1data.treasmailingcountycd IS $$Treasurer mailing address - Texas county$$;
COMMENT ON COLUMN tec.c_coversheet1data.treasmailingcountrycd IS $$Treasurer mailing address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.c_coversheet1data.treasmailingpostalcode IS $$Treasurer mailing address - postal code - USA addresses only$$;
COMMENT ON COLUMN tec.c_coversheet1data.treasmailingregion IS $$Treasurer mailing address - region for country other than USA$$;
COMMENT ON COLUMN tec.c_coversheet1data.treasprimaryusaphoneflag IS $$Treasurer primary phone number - Y if number is a USA phone, N   otherwise$$;
COMMENT ON COLUMN tec.c_coversheet1data.treasprimaryphonenumber IS $$Treasurer primary phone number$$;
COMMENT ON COLUMN tec.c_coversheet1data.treasprimaryphoneext IS $$Treasurer primary phone extension$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairpersenttypecd IS $$Type of chair name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairnameorganization IS $$For ENTITY, the chair organization name$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairnamelast IS $$For INDIVIDUAL, the chair last name$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairnamesuffixcd IS $$For INDIVIDUAL, the chair name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairnamefirst IS $$For INDIVIDUAL, the chair first name$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairnameprefixcd IS $$For INDIVIDUAL, the chair name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairnameshort IS $$For INDIVIDUAL, the chair short name (nickname)$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairstreetaddr1 IS $$Chair street address - line 1$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairstreetaddr2 IS $$Chair street address - line 2$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairstreetcity IS $$Chair street address - city$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairstreetstatecd IS $$Chair street address - state code (e.g. TX, CA) - for            country=USA/UMI only$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairstreetcountycd IS $$Chair street address - Texas county$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairstreetcountrycd IS $$Chair street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairstreetpostalcode IS $$Chair street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairstreetregion IS $$Chair street address - region for country other than USA$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairmailingaddr1 IS $$Chair mailing address - line 1$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairmailingaddr2 IS $$Chair mailing address - line 2$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairmailingcity IS $$Chair mailing address - city$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairmailingstatecd IS $$Chair mailing address - state code (e.g. TX, CA) - for           country=USA/UMI only$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairmailingcountycd IS $$Chair mailing address - Texas county$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairmailingcountrycd IS $$Chair mailing address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairmailingpostalcode IS $$Chair mailing address - postal code - USA addresses only$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairmailingregion IS $$Chair mailing address - region for country other than USA$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairprimaryusaphoneflag IS $$Chair primary phone number - Y if number is a USA phone, N       otherwise$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairprimaryphonenumber IS $$Chair primary phone number$$;
COMMENT ON COLUMN tec.c_coversheet1data.chairprimaryphoneext IS $$Chair primary phone extension$$;
\COPY tec.c_CoverSheet1Data FROM 'data/TEC_CF_CSV/cover.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_CoverSheet1Data FROM 'data/TEC_CF_CSV/cover_ss.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_CoverSheet1Data FROM 'data/TEC_CF_CSV/cover_t.csv' WITH ( FORMAT CSV , HEADER true );


CREATE INDEX ON tec.c_CoverSheet1Data (filerIdent, filerTypeCd);

ALTER TABLE tec.c_CoverSheet1Data
	ADD FOREIGN KEY (formTypeCd) REFERENCES tec.codes_forms NOT VALID,
	ADD FOREIGN KEY (filerTypeCd) REFERENCES tec.codes_filertype NOT VALID,
	ADD FOREIGN KEY (reportTypeCd1) REFERENCES tec.codes_reports NOT VALID,
	ADD FOREIGN KEY (reportTypeCd2) REFERENCES tec.codes_reports NOT VALID,
	ADD FOREIGN KEY (reportTypeCd3) REFERENCES tec.codes_reports NOT VALID,
	ADD FOREIGN KEY (reportTypeCd4) REFERENCES tec.codes_reports NOT VALID,
	ADD FOREIGN KEY (reportTypeCd5) REFERENCES tec.codes_reports NOT VALID,
	ADD FOREIGN KEY (reportTypeCd6) REFERENCES tec.codes_reports NOT VALID,
	ADD FOREIGN KEY (reportTypeCd7) REFERENCES tec.codes_reports NOT VALID,
	ADD FOREIGN KEY (reportTypeCd8) REFERENCES tec.codes_reports NOT VALID,
	ADD FOREIGN KEY (reportTypeCd9) REFERENCES tec.codes_reports NOT VALID,
	ADD FOREIGN KEY (reportTypeCd10) REFERENCES tec.codes_reports NOT VALID,
	ADD FOREIGN KEY (politicalPartyCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (filerStreetCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (filerStreetCountryCd) REFERENCES tec.codes_country NOT VALID,
	ADD FOREIGN KEY (filerHoldOfficeCd) REFERENCES tec.codes_office NOT VALID,
	ADD FOREIGN KEY (filerHoldOfficeCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (filerSeekOfficeCd) REFERENCES tec.codes_office NOT VALID,
	ADD FOREIGN KEY (filerSeekOfficeCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (treasStreetCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (treasStreetCountryCd) REFERENCES tec.codes_country NOT VALID,
	ADD FOREIGN KEY (treasMailingCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (treasMailingCountryCd) REFERENCES tec.codes_country NOT VALID,
	ADD FOREIGN KEY (chairStreetCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (chairStreetCountryCd) REFERENCES tec.codes_country NOT VALID,
	ADD FOREIGN KEY (chairMailingCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (chairMailingCountryCd) REFERENCES tec.codes_country NOT VALID,
	ADD FOREIGN KEY (filerIdent, filerTypeCd) REFERENCES tec.c_FilerData NOT VALID;

