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

\echo LOADING c_FilerData


CREATE TABLE tec.c_FilerData (
	recordType                              text,
	filerIdent                              int,
	filerTypeCd                             text,
	filerName                               text,
	unexpendContribFilerFlag                bool,
	modifiedElectCycleFlag                  bool,
	filerJdiCd                              text,
	committeeStatusCd                       text,
	ctaSeekOfficeCd                         text,
	ctaSeekOfficeDistrict                   text,
	ctaSeekOfficePlace                      text,
	ctaSeekOfficeDescr                      text,
	ctaSeekOfficeCountyCd                   text,
	ctaSeekOfficeCountyDescr                text,
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
	filerMailingAddr1                       text,
	filerMailingAddr2                       text,
	filerMailingCity                        text,
	filerMailingStateCd                     text,
	filerMailingCountyCd                    text,
	filerMailingCountryCd                   char(3),
	filerMailingPostalCode                  text,
	filerMailingRegion                      text,
	filerPrimaryUsaPhoneFlag                bool,
	filerPrimaryPhoneNumber                 text,
	filerPrimaryPhoneExt                    text,
	filerHoldOfficeCd                       text,
	filerHoldOfficeDistrict                 text,
	filerHoldOfficePlace                    text,
	filerHoldOfficeDescr                    text,
	filerHoldOfficeCountyCd                 text,
	filerHoldOfficeCountyDescr              text,
	filerFilerpersStatusCd                  text,
	filerEffStartDt                         date,
	filerEffStopDt                          date,
	contestSeekOfficeCd                     text,
	contestSeekOfficeDistrict               text,
	contestSeekOfficePlace                  text,
	contestSeekOfficeDescr                  text,
	contestSeekOfficeCountyCd               text,
	contestSeekOfficeCountyDescr            text,
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
	treasAppointorNameLast                  text,
	treasAppointorNameFirst                 text,
	treasFilerpersStatusCd                  text,
	treasEffStartDt                         date,
	treasEffStopDt                          date,
	assttreasPersentTypeCd                  text,
	assttreasNameOrganization               text,
	assttreasNameLast                       text,
	assttreasNameSuffixCd                   text,
	assttreasNameFirst                      text,
	assttreasNamePrefixCd                   text,
	assttreasNameShort                      text,
	assttreasStreetAddr1                    text,
	assttreasStreetAddr2                    text,
	assttreasStreetCity                     text,
	assttreasStreetStateCd                  text,
	assttreasStreetCountyCd                 text,
	assttreasStreetCountryCd                char(3),
	assttreasStreetPostalCode               text,
	assttreasStreetRegion                   text,
	assttreasPrimaryUsaPhoneFlag            bool,
	assttreasPrimaryPhoneNumber             text,
	assttreasPrimaryPhoneExt                text,
	assttreasAppointorNameLast              text,
	assttreasAppointorNameFirst             text,
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
	PRIMARY KEY (filerIdent, filerTypeCd)
);
COMMENT ON TABLE tec.c_FilerData IS $$Filer index. The names, addresses and offices in this file are entered by TEC staff from various sources; e.g., amended campaign treasurer appointments, change-of-address notices, and ballot information from the Texas Secretary of State. File: filers.csv$$;
COMMENT ON COLUMN tec.c_filerdata.recordtype IS $$Record type code - always FILER$$;
COMMENT ON COLUMN tec.c_filerdata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.c_filerdata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.c_filerdata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.c_filerdata.unexpendcontribfilerflag IS $$Unexpended contributions indicator$$;
COMMENT ON COLUMN tec.c_filerdata.modifiedelectcycleflag IS $$Modified for election cycle indicator$$;
COMMENT ON COLUMN tec.c_filerdata.filerjdicd IS $$Judicial declaration of intent code$$;
COMMENT ON COLUMN tec.c_filerdata.committeestatuscd IS $$PAC filing status code$$;
COMMENT ON COLUMN tec.c_filerdata.ctaseekofficecd IS $$CTA office sought$$;
COMMENT ON COLUMN tec.c_filerdata.ctaseekofficedistrict IS $$CTA office sought district$$;
COMMENT ON COLUMN tec.c_filerdata.ctaseekofficeplace IS $$CTA office sought place$$;
COMMENT ON COLUMN tec.c_filerdata.ctaseekofficedescr IS $$CTA office sought description$$;
COMMENT ON COLUMN tec.c_filerdata.ctaseekofficecountycd IS $$CTA office sought county code$$;
COMMENT ON COLUMN tec.c_filerdata.ctaseekofficecountydescr IS $$CTA office sought county description$$;
COMMENT ON COLUMN tec.c_filerdata.filerpersenttypecd IS $$Type of filer name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.c_filerdata.filernameorganization IS $$For ENTITY, the filer organization name$$;
COMMENT ON COLUMN tec.c_filerdata.filernamelast IS $$For INDIVIDUAL, the filer last name$$;
COMMENT ON COLUMN tec.c_filerdata.filernamesuffixcd IS $$For INDIVIDUAL, the filer name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.c_filerdata.filernamefirst IS $$For INDIVIDUAL, the filer first name$$;
COMMENT ON COLUMN tec.c_filerdata.filernameprefixcd IS $$For INDIVIDUAL, the filer name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.c_filerdata.filernameshort IS $$For INDIVIDUAL, the filer short name (nickname)$$;
COMMENT ON COLUMN tec.c_filerdata.filerstreetaddr1 IS $$Filer street address - line 1$$;
COMMENT ON COLUMN tec.c_filerdata.filerstreetaddr2 IS $$Filer street address - line 2$$;
COMMENT ON COLUMN tec.c_filerdata.filerstreetcity IS $$Filer street address - city$$;
COMMENT ON COLUMN tec.c_filerdata.filerstreetstatecd IS $$Filer street address - state code (e.g. TX, CA) - for            country=USA/UMI only$$;
COMMENT ON COLUMN tec.c_filerdata.filerstreetcountycd IS $$Filer street address - Texas county$$;
COMMENT ON COLUMN tec.c_filerdata.filerstreetcountrycd IS $$Filer street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.c_filerdata.filerstreetpostalcode IS $$Filer street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.c_filerdata.filerstreetregion IS $$Filer street address - region for country other than USA$$;
COMMENT ON COLUMN tec.c_filerdata.filermailingaddr1 IS $$Filer mailing address - line 1$$;
COMMENT ON COLUMN tec.c_filerdata.filermailingaddr2 IS $$Filer mailing address - line 2$$;
COMMENT ON COLUMN tec.c_filerdata.filermailingcity IS $$Filer mailing address - city$$;
COMMENT ON COLUMN tec.c_filerdata.filermailingstatecd IS $$Filer mailing address - state code (e.g. TX, CA) - for           country=USA/UMI only$$;
COMMENT ON COLUMN tec.c_filerdata.filermailingcountycd IS $$Filer mailing address - Texas county$$;
COMMENT ON COLUMN tec.c_filerdata.filermailingcountrycd IS $$Filer mailing address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.c_filerdata.filermailingpostalcode IS $$Filer mailing address - postal code - USA addresses only$$;
COMMENT ON COLUMN tec.c_filerdata.filermailingregion IS $$Filer mailing address - region for country other than USA$$;
COMMENT ON COLUMN tec.c_filerdata.filerprimaryusaphoneflag IS $$Filer primary phone number - Y if number is a USA phone, N       otherwise$$;
COMMENT ON COLUMN tec.c_filerdata.filerprimaryphonenumber IS $$Filer primary phone number$$;
COMMENT ON COLUMN tec.c_filerdata.filerprimaryphoneext IS $$Filer primary phone extension$$;
COMMENT ON COLUMN tec.c_filerdata.filerholdofficecd IS $$Filer office held$$;
COMMENT ON COLUMN tec.c_filerdata.filerholdofficedistrict IS $$Filer office held district$$;
COMMENT ON COLUMN tec.c_filerdata.filerholdofficeplace IS $$Filer office held place$$;
COMMENT ON COLUMN tec.c_filerdata.filerholdofficedescr IS $$Filer office held description$$;
COMMENT ON COLUMN tec.c_filerdata.filerholdofficecountycd IS $$Filer office held country code$$;
COMMENT ON COLUMN tec.c_filerdata.filerholdofficecountydescr IS $$Filer office help county description$$;
COMMENT ON COLUMN tec.c_filerdata.filerfilerpersstatuscd IS $$Filer status (CURRENT, etc)$$;
COMMENT ON COLUMN tec.c_filerdata.filereffstartdt IS $$Filer start date$$;
COMMENT ON COLUMN tec.c_filerdata.filereffstopdt IS $$Filer end date$$;
COMMENT ON COLUMN tec.c_filerdata.contestseekofficecd IS $$Filer office sought$$;
COMMENT ON COLUMN tec.c_filerdata.contestseekofficedistrict IS $$Filer office sought district$$;
COMMENT ON COLUMN tec.c_filerdata.contestseekofficeplace IS $$Filer office sought place$$;
COMMENT ON COLUMN tec.c_filerdata.contestseekofficedescr IS $$Filer office sought description$$;
COMMENT ON COLUMN tec.c_filerdata.contestseekofficecountycd IS $$Filer office sought county code$$;
COMMENT ON COLUMN tec.c_filerdata.contestseekofficecountydescr IS $$Filer office sought county description$$;
COMMENT ON COLUMN tec.c_filerdata.treaspersenttypecd IS $$Type of treasurer name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.c_filerdata.treasnameorganization IS $$For ENTITY, the treasurer organization name$$;
COMMENT ON COLUMN tec.c_filerdata.treasnamelast IS $$For INDIVIDUAL, the treasurer last name$$;
COMMENT ON COLUMN tec.c_filerdata.treasnamesuffixcd IS $$For INDIVIDUAL, the treasurer name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.c_filerdata.treasnamefirst IS $$For INDIVIDUAL, the treasurer first name$$;
COMMENT ON COLUMN tec.c_filerdata.treasnameprefixcd IS $$For INDIVIDUAL, the treasurer name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.c_filerdata.treasnameshort IS $$For INDIVIDUAL, the treasurer short name (nickname)$$;
COMMENT ON COLUMN tec.c_filerdata.treasstreetaddr1 IS $$Treasurer street address - line 1$$;
COMMENT ON COLUMN tec.c_filerdata.treasstreetaddr2 IS $$Treasurer street address - line 2$$;
COMMENT ON COLUMN tec.c_filerdata.treasstreetcity IS $$Treasurer street address - city$$;
COMMENT ON COLUMN tec.c_filerdata.treasstreetstatecd IS $$Treasurer street address - state code (e.g. TX, CA) - for        country=USA/UMI only$$;
COMMENT ON COLUMN tec.c_filerdata.treasstreetcountycd IS $$Treasurer street address - Texas county$$;
COMMENT ON COLUMN tec.c_filerdata.treasstreetcountrycd IS $$Treasurer street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.c_filerdata.treasstreetpostalcode IS $$Treasurer street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.c_filerdata.treasstreetregion IS $$Treasurer street address - region for country other than USA$$;
COMMENT ON COLUMN tec.c_filerdata.treasmailingaddr1 IS $$Treasurer mailing address - line 1$$;
COMMENT ON COLUMN tec.c_filerdata.treasmailingaddr2 IS $$Treasurer mailing address - line 2$$;
COMMENT ON COLUMN tec.c_filerdata.treasmailingcity IS $$Treasurer mailing address - city$$;
COMMENT ON COLUMN tec.c_filerdata.treasmailingstatecd IS $$Treasurer mailing address - state code (e.g. TX, CA) - for       country=USA/UMI only$$;
COMMENT ON COLUMN tec.c_filerdata.treasmailingcountycd IS $$Treasurer mailing address - Texas county$$;
COMMENT ON COLUMN tec.c_filerdata.treasmailingcountrycd IS $$Treasurer mailing address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.c_filerdata.treasmailingpostalcode IS $$Treasurer mailing address - postal code - USA addresses only$$;
COMMENT ON COLUMN tec.c_filerdata.treasmailingregion IS $$Treasurer mailing address - region for country other than USA$$;
COMMENT ON COLUMN tec.c_filerdata.treasprimaryusaphoneflag IS $$Treasurer primary phone number - Y if number is a USA phone, N   otherwise$$;
COMMENT ON COLUMN tec.c_filerdata.treasprimaryphonenumber IS $$Treasurer primary phone number$$;
COMMENT ON COLUMN tec.c_filerdata.treasprimaryphoneext IS $$Treasurer primary phone extension$$;
COMMENT ON COLUMN tec.c_filerdata.treasappointornamelast IS $$For INDIVIDUAL, the treasurer last name$$;
COMMENT ON COLUMN tec.c_filerdata.treasappointornamefirst IS $$For INDIVIDUAL, the treasurer first name$$;
COMMENT ON COLUMN tec.c_filerdata.treasfilerpersstatuscd IS $$Treasurer status (CURRENT, etc)$$;
COMMENT ON COLUMN tec.c_filerdata.treaseffstartdt IS $$Treasurer start date$$;
COMMENT ON COLUMN tec.c_filerdata.treaseffstopdt IS $$Treasurer end date$$;
COMMENT ON COLUMN tec.c_filerdata.assttreaspersenttypecd IS $$Type of asst treasurer name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.c_filerdata.assttreasnameorganization IS $$For ENTITY, the asst treasurer organization name$$;
COMMENT ON COLUMN tec.c_filerdata.assttreasnamelast IS $$For INDIVIDUAL, the asst treasurer last name$$;
COMMENT ON COLUMN tec.c_filerdata.assttreasnamesuffixcd IS $$For INDIVIDUAL, the asst treasurer name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.c_filerdata.assttreasnamefirst IS $$For INDIVIDUAL, the asst treasurer first name$$;
COMMENT ON COLUMN tec.c_filerdata.assttreasnameprefixcd IS $$For INDIVIDUAL, the asst treasurer name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.c_filerdata.assttreasnameshort IS $$For INDIVIDUAL, the asst treasurer short name (nickname)$$;
COMMENT ON COLUMN tec.c_filerdata.assttreasstreetaddr1 IS $$Asst treasurer street address - line 1$$;
COMMENT ON COLUMN tec.c_filerdata.assttreasstreetaddr2 IS $$Asst treasurer street address - line 2$$;
COMMENT ON COLUMN tec.c_filerdata.assttreasstreetcity IS $$Asst treasurer street address - city$$;
COMMENT ON COLUMN tec.c_filerdata.assttreasstreetstatecd IS $$Asst treasurer street address - state code (e.g. TX, CA) - for   country=USA/UMI only$$;
COMMENT ON COLUMN tec.c_filerdata.assttreasstreetcountycd IS $$Asst treasurer street address - Texas county$$;
COMMENT ON COLUMN tec.c_filerdata.assttreasstreetcountrycd IS $$Asst treasurer street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.c_filerdata.assttreasstreetpostalcode IS $$Asst treasurer street address - postal code - for USA addresses  only$$;
COMMENT ON COLUMN tec.c_filerdata.assttreasstreetregion IS $$Asst treasurer street address - region for country other than USA$$;
COMMENT ON COLUMN tec.c_filerdata.assttreasprimaryusaphoneflag IS $$Asst treasurer primary phone number - Y if number is a USA phone,N otherwise$$;
COMMENT ON COLUMN tec.c_filerdata.assttreasprimaryphonenumber IS $$Asst treasurer primary phone number$$;
COMMENT ON COLUMN tec.c_filerdata.assttreasprimaryphoneext IS $$Asst treasurer primary phone extension$$;
COMMENT ON COLUMN tec.c_filerdata.assttreasappointornamelast IS $$For INDIVIDUAL, the asst treasurer last name$$;
COMMENT ON COLUMN tec.c_filerdata.assttreasappointornamefirst IS $$For INDIVIDUAL, the asst treasurer first name$$;
COMMENT ON COLUMN tec.c_filerdata.chairpersenttypecd IS $$Type of chair name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.c_filerdata.chairnameorganization IS $$For ENTITY, the chair organization name$$;
COMMENT ON COLUMN tec.c_filerdata.chairnamelast IS $$For INDIVIDUAL, the chair last name$$;
COMMENT ON COLUMN tec.c_filerdata.chairnamesuffixcd IS $$For INDIVIDUAL, the chair name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.c_filerdata.chairnamefirst IS $$For INDIVIDUAL, the chair first name$$;
COMMENT ON COLUMN tec.c_filerdata.chairnameprefixcd IS $$For INDIVIDUAL, the chair name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.c_filerdata.chairnameshort IS $$For INDIVIDUAL, the chair short name (nickname)$$;
COMMENT ON COLUMN tec.c_filerdata.chairstreetaddr1 IS $$Chair street address - line 1$$;
COMMENT ON COLUMN tec.c_filerdata.chairstreetaddr2 IS $$Chair street address - line 2$$;
COMMENT ON COLUMN tec.c_filerdata.chairstreetcity IS $$Chair street address - city$$;
COMMENT ON COLUMN tec.c_filerdata.chairstreetstatecd IS $$Chair street address - state code (e.g. TX, CA) - for            country=USA/UMI only$$;
COMMENT ON COLUMN tec.c_filerdata.chairstreetcountycd IS $$Chair street address - Texas county$$;
COMMENT ON COLUMN tec.c_filerdata.chairstreetcountrycd IS $$Chair street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.c_filerdata.chairstreetpostalcode IS $$Chair street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.c_filerdata.chairstreetregion IS $$Chair street address - region for country other than USA$$;
COMMENT ON COLUMN tec.c_filerdata.chairmailingaddr1 IS $$Chair mailing address - line 1$$;
COMMENT ON COLUMN tec.c_filerdata.chairmailingaddr2 IS $$Chair mailing address - line 2$$;
COMMENT ON COLUMN tec.c_filerdata.chairmailingcity IS $$Chair mailing address - city$$;
COMMENT ON COLUMN tec.c_filerdata.chairmailingstatecd IS $$Chair mailing address - state code (e.g. TX, CA) - for           country=USA/UMI only$$;
COMMENT ON COLUMN tec.c_filerdata.chairmailingcountycd IS $$Chair mailing address - Texas county$$;
COMMENT ON COLUMN tec.c_filerdata.chairmailingcountrycd IS $$Chair mailing address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.c_filerdata.chairmailingpostalcode IS $$Chair mailing address - postal code - USA addresses only$$;
COMMENT ON COLUMN tec.c_filerdata.chairmailingregion IS $$Chair mailing address - region for country other than USA$$;
COMMENT ON COLUMN tec.c_filerdata.chairprimaryusaphoneflag IS $$Chair primary phone number - Y if number is a USA phone, N       otherwise$$;
COMMENT ON COLUMN tec.c_filerdata.chairprimaryphonenumber IS $$Chair primary phone number$$;
COMMENT ON COLUMN tec.c_filerdata.chairprimaryphoneext IS $$Chair primary phone extension$$;
\COPY tec.c_FilerData FROM 'data/TEC_CF_CSV/filers.csv' WITH ( FORMAT CSV , HEADER true );


ALTER TABLE tec.c_FilerData
	ADD FOREIGN KEY (filerTypeCd) REFERENCES tec.codes_filertype NOT VALID,
	ADD FOREIGN KEY (ctaSeekOfficeCd) REFERENCES tec.codes_office NOT VALID,
	ADD FOREIGN KEY (ctaSeekOfficeCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (filerStreetCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (filerStreetCountryCd) REFERENCES tec.codes_country NOT VALID,
	ADD FOREIGN KEY (filerMailingCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (filerMailingCountryCd) REFERENCES tec.codes_country NOT VALID,
	ADD FOREIGN KEY (filerHoldOfficeCd) REFERENCES tec.codes_office NOT VALID,
	ADD FOREIGN KEY (filerHoldOfficeCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (contestSeekOfficeCd) REFERENCES tec.codes_office NOT VALID,
	ADD FOREIGN KEY (contestSeekOfficeCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (treasStreetCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (treasStreetCountryCd) REFERENCES tec.codes_country NOT VALID,
	ADD FOREIGN KEY (treasMailingCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (treasMailingCountryCd) REFERENCES tec.codes_country NOT VALID,
	ADD FOREIGN KEY (assttreasStreetCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (assttreasStreetCountryCd) REFERENCES tec.codes_country NOT VALID,
	ADD FOREIGN KEY (chairStreetCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (chairStreetCountryCd) REFERENCES tec.codes_country NOT VALID,
	ADD FOREIGN KEY (chairMailingCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (chairMailingCountryCd) REFERENCES tec.codes_country NOT VALID;

