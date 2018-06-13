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

\echo LOADING FilerData



CREATE TABLE tec.filerdata (
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
	filerStreetCountryCd                    text,
	filerStreetPostalCode                   text,
	filerStreetRegion                       text,
	filerMailingAddr1                       text,
	filerMailingAddr2                       text,
	filerMailingCity                        text,
	filerMailingStateCd                     text,
	filerMailingCountyCd                    text,
	filerMailingCountryCd                   text,
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
	treasStreetCountryCd                    text,
	treasStreetPostalCode                   text,
	treasStreetRegion                       text,
	treasMailingAddr1                       text,
	treasMailingAddr2                       text,
	treasMailingCity                        text,
	treasMailingStateCd                     text,
	treasMailingCountyCd                    text,
	treasMailingCountryCd                   text,
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
	assttreasStreetCountryCd                text,
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
	chairStreetCountryCd                    text,
	chairStreetPostalCode                   text,
	chairStreetRegion                       text,
	chairMailingAddr1                       text,
	chairMailingAddr2                       text,
	chairMailingCity                        text,
	chairMailingStateCd                     text,
	chairMailingCountyCd                    text,
	chairMailingCountryCd                   text,
	chairMailingPostalCode                  text,
	chairMailingRegion                      text,
	chairPrimaryUsaPhoneFlag                bool,
	chairPrimaryPhoneNumber                 text,
	chairPrimaryPhoneExt                    text,
	PRIMARY KEY (filerIdent, filerTypeCd)
);

COMMENT ON TABLE tec.filerdata IS $$Filer index. The names, addresses and offices in this file are entered by TEC staff from various sources; e.g., amended campaign treasurer appointments, change-of-address notices, and ballot information from the Texas Secretary of State. File: filers.csv$$;
COMMENT ON COLUMN tec.filerdata.recordtype IS $$Record type code - always FILER$$;
COMMENT ON COLUMN tec.filerdata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.filerdata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.filerdata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.filerdata.unexpendcontribfilerflag IS $$Unexpended contributions indicator$$;
COMMENT ON COLUMN tec.filerdata.modifiedelectcycleflag IS $$Modified for election cycle indicator$$;
COMMENT ON COLUMN tec.filerdata.filerjdicd IS $$Judicial declaration of intent code$$;
COMMENT ON COLUMN tec.filerdata.committeestatuscd IS $$PAC filing status code$$;
COMMENT ON COLUMN tec.filerdata.ctaseekofficecd IS $$CTA office sought$$;
COMMENT ON COLUMN tec.filerdata.ctaseekofficedistrict IS $$CTA office sought district$$;
COMMENT ON COLUMN tec.filerdata.ctaseekofficeplace IS $$CTA office sought place$$;
COMMENT ON COLUMN tec.filerdata.ctaseekofficedescr IS $$CTA office sought description$$;
COMMENT ON COLUMN tec.filerdata.ctaseekofficecountycd IS $$CTA office sought county code$$;
COMMENT ON COLUMN tec.filerdata.ctaseekofficecountydescr IS $$CTA office sought county description$$;
COMMENT ON COLUMN tec.filerdata.filerpersenttypecd IS $$Type of filer name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.filerdata.filernameorganization IS $$For ENTITY, the filer organization name$$;
COMMENT ON COLUMN tec.filerdata.filernamelast IS $$For INDIVIDUAL, the filer last name$$;
COMMENT ON COLUMN tec.filerdata.filernamesuffixcd IS $$For INDIVIDUAL, the filer name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.filerdata.filernamefirst IS $$For INDIVIDUAL, the filer first name$$;
COMMENT ON COLUMN tec.filerdata.filernameprefixcd IS $$For INDIVIDUAL, the filer name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.filerdata.filernameshort IS $$For INDIVIDUAL, the filer short name (nickname)$$;
COMMENT ON COLUMN tec.filerdata.filerstreetaddr1 IS $$Filer street address - line 1$$;
COMMENT ON COLUMN tec.filerdata.filerstreetaddr2 IS $$Filer street address - line 2$$;
COMMENT ON COLUMN tec.filerdata.filerstreetcity IS $$Filer street address - city$$;
COMMENT ON COLUMN tec.filerdata.filerstreetstatecd IS $$Filer street address - state code (e.g. TX, CA) - for            country=USA/UMI only$$;
COMMENT ON COLUMN tec.filerdata.filerstreetcountycd IS $$Filer street address - Texas county$$;
COMMENT ON COLUMN tec.filerdata.filerstreetcountrycd IS $$Filer street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.filerdata.filerstreetpostalcode IS $$Filer street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.filerdata.filerstreetregion IS $$Filer street address - region for country other than USA$$;
COMMENT ON COLUMN tec.filerdata.filermailingaddr1 IS $$Filer mailing address - line 1$$;
COMMENT ON COLUMN tec.filerdata.filermailingaddr2 IS $$Filer mailing address - line 2$$;
COMMENT ON COLUMN tec.filerdata.filermailingcity IS $$Filer mailing address - city$$;
COMMENT ON COLUMN tec.filerdata.filermailingstatecd IS $$Filer mailing address - state code (e.g. TX, CA) - for           country=USA/UMI only$$;
COMMENT ON COLUMN tec.filerdata.filermailingcountycd IS $$Filer mailing address - Texas county$$;
COMMENT ON COLUMN tec.filerdata.filermailingcountrycd IS $$Filer mailing address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.filerdata.filermailingpostalcode IS $$Filer mailing address - postal code - USA addresses only$$;
COMMENT ON COLUMN tec.filerdata.filermailingregion IS $$Filer mailing address - region for country other than USA$$;
COMMENT ON COLUMN tec.filerdata.filerprimaryusaphoneflag IS $$Filer primary phone number - Y if number is a USA phone, N       otherwise$$;
COMMENT ON COLUMN tec.filerdata.filerprimaryphonenumber IS $$Filer primary phone number$$;
COMMENT ON COLUMN tec.filerdata.filerprimaryphoneext IS $$Filer primary phone extension$$;
COMMENT ON COLUMN tec.filerdata.filerholdofficecd IS $$Filer office held$$;
COMMENT ON COLUMN tec.filerdata.filerholdofficedistrict IS $$Filer office held district$$;
COMMENT ON COLUMN tec.filerdata.filerholdofficeplace IS $$Filer office held place$$;
COMMENT ON COLUMN tec.filerdata.filerholdofficedescr IS $$Filer office held description$$;
COMMENT ON COLUMN tec.filerdata.filerholdofficecountycd IS $$Filer office held country code$$;
COMMENT ON COLUMN tec.filerdata.filerholdofficecountydescr IS $$Filer office help county description$$;
COMMENT ON COLUMN tec.filerdata.filerfilerpersstatuscd IS $$Filer status (CURRENT, etc)$$;
COMMENT ON COLUMN tec.filerdata.filereffstartdt IS $$Filer start date$$;
COMMENT ON COLUMN tec.filerdata.filereffstopdt IS $$Filer end date$$;
COMMENT ON COLUMN tec.filerdata.contestseekofficecd IS $$Filer office sought$$;
COMMENT ON COLUMN tec.filerdata.contestseekofficedistrict IS $$Filer office sought district$$;
COMMENT ON COLUMN tec.filerdata.contestseekofficeplace IS $$Filer office sought place$$;
COMMENT ON COLUMN tec.filerdata.contestseekofficedescr IS $$Filer office sought description$$;
COMMENT ON COLUMN tec.filerdata.contestseekofficecountycd IS $$Filer office sought county code$$;
COMMENT ON COLUMN tec.filerdata.contestseekofficecountydescr IS $$Filer office sought county description$$;
COMMENT ON COLUMN tec.filerdata.treaspersenttypecd IS $$Type of treasurer name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.filerdata.treasnameorganization IS $$For ENTITY, the treasurer organization name$$;
COMMENT ON COLUMN tec.filerdata.treasnamelast IS $$For INDIVIDUAL, the treasurer last name$$;
COMMENT ON COLUMN tec.filerdata.treasnamesuffixcd IS $$For INDIVIDUAL, the treasurer name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.filerdata.treasnamefirst IS $$For INDIVIDUAL, the treasurer first name$$;
COMMENT ON COLUMN tec.filerdata.treasnameprefixcd IS $$For INDIVIDUAL, the treasurer name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.filerdata.treasnameshort IS $$For INDIVIDUAL, the treasurer short name (nickname)$$;
COMMENT ON COLUMN tec.filerdata.treasstreetaddr1 IS $$Treasurer street address - line 1$$;
COMMENT ON COLUMN tec.filerdata.treasstreetaddr2 IS $$Treasurer street address - line 2$$;
COMMENT ON COLUMN tec.filerdata.treasstreetcity IS $$Treasurer street address - city$$;
COMMENT ON COLUMN tec.filerdata.treasstreetstatecd IS $$Treasurer street address - state code (e.g. TX, CA) - for        country=USA/UMI only$$;
COMMENT ON COLUMN tec.filerdata.treasstreetcountycd IS $$Treasurer street address - Texas county$$;
COMMENT ON COLUMN tec.filerdata.treasstreetcountrycd IS $$Treasurer street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.filerdata.treasstreetpostalcode IS $$Treasurer street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.filerdata.treasstreetregion IS $$Treasurer street address - region for country other than USA$$;
COMMENT ON COLUMN tec.filerdata.treasmailingaddr1 IS $$Treasurer mailing address - line 1$$;
COMMENT ON COLUMN tec.filerdata.treasmailingaddr2 IS $$Treasurer mailing address - line 2$$;
COMMENT ON COLUMN tec.filerdata.treasmailingcity IS $$Treasurer mailing address - city$$;
COMMENT ON COLUMN tec.filerdata.treasmailingstatecd IS $$Treasurer mailing address - state code (e.g. TX, CA) - for       country=USA/UMI only$$;
COMMENT ON COLUMN tec.filerdata.treasmailingcountycd IS $$Treasurer mailing address - Texas county$$;
COMMENT ON COLUMN tec.filerdata.treasmailingcountrycd IS $$Treasurer mailing address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.filerdata.treasmailingpostalcode IS $$Treasurer mailing address - postal code - USA addresses only$$;
COMMENT ON COLUMN tec.filerdata.treasmailingregion IS $$Treasurer mailing address - region for country other than USA$$;
COMMENT ON COLUMN tec.filerdata.treasprimaryusaphoneflag IS $$Treasurer primary phone number - Y if number is a USA phone, N   otherwise$$;
COMMENT ON COLUMN tec.filerdata.treasprimaryphonenumber IS $$Treasurer primary phone number$$;
COMMENT ON COLUMN tec.filerdata.treasprimaryphoneext IS $$Treasurer primary phone extension$$;
COMMENT ON COLUMN tec.filerdata.treasappointornamelast IS $$For INDIVIDUAL, the treasurer last name$$;
COMMENT ON COLUMN tec.filerdata.treasappointornamefirst IS $$For INDIVIDUAL, the treasurer first name$$;
COMMENT ON COLUMN tec.filerdata.treasfilerpersstatuscd IS $$Treasurer status (CURRENT, etc)$$;
COMMENT ON COLUMN tec.filerdata.treaseffstartdt IS $$Treasurer start date$$;
COMMENT ON COLUMN tec.filerdata.treaseffstopdt IS $$Treasurer end date$$;
COMMENT ON COLUMN tec.filerdata.assttreaspersenttypecd IS $$Type of asst treasurer name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.filerdata.assttreasnameorganization IS $$For ENTITY, the asst treasurer organization name$$;
COMMENT ON COLUMN tec.filerdata.assttreasnamelast IS $$For INDIVIDUAL, the asst treasurer last name$$;
COMMENT ON COLUMN tec.filerdata.assttreasnamesuffixcd IS $$For INDIVIDUAL, the asst treasurer name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.filerdata.assttreasnamefirst IS $$For INDIVIDUAL, the asst treasurer first name$$;
COMMENT ON COLUMN tec.filerdata.assttreasnameprefixcd IS $$For INDIVIDUAL, the asst treasurer name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.filerdata.assttreasnameshort IS $$For INDIVIDUAL, the asst treasurer short name (nickname)$$;
COMMENT ON COLUMN tec.filerdata.assttreasstreetaddr1 IS $$Asst treasurer street address - line 1$$;
COMMENT ON COLUMN tec.filerdata.assttreasstreetaddr2 IS $$Asst treasurer street address - line 2$$;
COMMENT ON COLUMN tec.filerdata.assttreasstreetcity IS $$Asst treasurer street address - city$$;
COMMENT ON COLUMN tec.filerdata.assttreasstreetstatecd IS $$Asst treasurer street address - state code (e.g. TX, CA) - for   country=USA/UMI only$$;
COMMENT ON COLUMN tec.filerdata.assttreasstreetcountycd IS $$Asst treasurer street address - Texas county$$;
COMMENT ON COLUMN tec.filerdata.assttreasstreetcountrycd IS $$Asst treasurer street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.filerdata.assttreasstreetpostalcode IS $$Asst treasurer street address - postal code - for USA addresses  only$$;
COMMENT ON COLUMN tec.filerdata.assttreasstreetregion IS $$Asst treasurer street address - region for country other than USA$$;
COMMENT ON COLUMN tec.filerdata.assttreasprimaryusaphoneflag IS $$Asst treasurer primary phone number - Y if number is a USA phone,N otherwise$$;
COMMENT ON COLUMN tec.filerdata.assttreasprimaryphonenumber IS $$Asst treasurer primary phone number$$;
COMMENT ON COLUMN tec.filerdata.assttreasprimaryphoneext IS $$Asst treasurer primary phone extension$$;
COMMENT ON COLUMN tec.filerdata.assttreasappointornamelast IS $$For INDIVIDUAL, the asst treasurer last name$$;
COMMENT ON COLUMN tec.filerdata.assttreasappointornamefirst IS $$For INDIVIDUAL, the asst treasurer first name$$;
COMMENT ON COLUMN tec.filerdata.chairpersenttypecd IS $$Type of chair name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.filerdata.chairnameorganization IS $$For ENTITY, the chair organization name$$;
COMMENT ON COLUMN tec.filerdata.chairnamelast IS $$For INDIVIDUAL, the chair last name$$;
COMMENT ON COLUMN tec.filerdata.chairnamesuffixcd IS $$For INDIVIDUAL, the chair name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.filerdata.chairnamefirst IS $$For INDIVIDUAL, the chair first name$$;
COMMENT ON COLUMN tec.filerdata.chairnameprefixcd IS $$For INDIVIDUAL, the chair name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.filerdata.chairnameshort IS $$For INDIVIDUAL, the chair short name (nickname)$$;
COMMENT ON COLUMN tec.filerdata.chairstreetaddr1 IS $$Chair street address - line 1$$;
COMMENT ON COLUMN tec.filerdata.chairstreetaddr2 IS $$Chair street address - line 2$$;
COMMENT ON COLUMN tec.filerdata.chairstreetcity IS $$Chair street address - city$$;
COMMENT ON COLUMN tec.filerdata.chairstreetstatecd IS $$Chair street address - state code (e.g. TX, CA) - for            country=USA/UMI only$$;
COMMENT ON COLUMN tec.filerdata.chairstreetcountycd IS $$Chair street address - Texas county$$;
COMMENT ON COLUMN tec.filerdata.chairstreetcountrycd IS $$Chair street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.filerdata.chairstreetpostalcode IS $$Chair street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.filerdata.chairstreetregion IS $$Chair street address - region for country other than USA$$;
COMMENT ON COLUMN tec.filerdata.chairmailingaddr1 IS $$Chair mailing address - line 1$$;
COMMENT ON COLUMN tec.filerdata.chairmailingaddr2 IS $$Chair mailing address - line 2$$;
COMMENT ON COLUMN tec.filerdata.chairmailingcity IS $$Chair mailing address - city$$;
COMMENT ON COLUMN tec.filerdata.chairmailingstatecd IS $$Chair mailing address - state code (e.g. TX, CA) - for           country=USA/UMI only$$;
COMMENT ON COLUMN tec.filerdata.chairmailingcountycd IS $$Chair mailing address - Texas county$$;
COMMENT ON COLUMN tec.filerdata.chairmailingcountrycd IS $$Chair mailing address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.filerdata.chairmailingpostalcode IS $$Chair mailing address - postal code - USA addresses only$$;
COMMENT ON COLUMN tec.filerdata.chairmailingregion IS $$Chair mailing address - region for country other than USA$$;
COMMENT ON COLUMN tec.filerdata.chairprimaryusaphoneflag IS $$Chair primary phone number - Y if number is a USA phone, N       otherwise$$;
COMMENT ON COLUMN tec.filerdata.chairprimaryphonenumber IS $$Chair primary phone number$$;
COMMENT ON COLUMN tec.filerdata.chairprimaryphoneext IS $$Chair primary phone extension$$;
\COPY tec.filerdata FROM 'data/TEC_CF_CSV/filers.csv' WITH ( FORMAT CSV , HEADER true )