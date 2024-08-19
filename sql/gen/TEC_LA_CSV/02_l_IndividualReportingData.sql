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

\echo LOADING l_IndividualReportingData


CREATE TABLE tec.l_IndividualReportingData (
	recordType                              text,
	formTypeCd                              text,
	reportTypeCd                            text,
	reportInfoIdent                         int,
	applicableYear                          smallint,
	filerIdent                              int,
	filerTypeCd                             text,
	filerName                               text,
	filerSort                               text,
	dueDt                                   date,
	receivedDt                              date,
	periodStartDt                           date,
	periodEndDt                             date,
	lobbyExpendOnbehalfId                   bigint,
	onbehalfName                            text,
	onbehalfMailingAddr1                    text,
	onbehalfMailingAddr2                    text,
	onbehalfMailingCity                     text,
	onbehalfMailingStateCd                  text,
	onbehalfMailingCountyCd                 text,
	onbehalfMailingCountryCd                char(3),
	onbehalfMailingPostalCode               text,
	onbehalfMailingRegion                   text,
	onbehalfPrimaryUsaPhoneFlag             bool,
	onbehalfPrimaryPhoneNumber              text,
	onbehalfPrimaryPhoneExt                 text,
	PRIMARY KEY (lobbyExpendOnbehalfId)
);
COMMENT ON TABLE tec.l_IndividualReportingData IS $$Form LA Cover Sheet Box 9 - Indivduals Reporting For Entity. NOTE: Form LA Instructions for this box state Check 'YES' if you are reporting expenditures at the request of an entity that has chosen not to register pursuant to Ethics Commission rule 34.45. If you check 'YES' provide the name, address and phone number of the entity. Checking  'YES' indicates that you are reporting not only expenditures attributable to you but also expenditures attributable to the entity listed. File: LaI4E.csv$$;
COMMENT ON COLUMN tec.l_individualreportingdata.recordtype IS $$Record type code - always I4E$$;
COMMENT ON COLUMN tec.l_individualreportingdata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.l_individualreportingdata.reporttypecd IS $$Report type$$;
COMMENT ON COLUMN tec.l_individualreportingdata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.l_individualreportingdata.applicableyear IS $$Year applicable$$;
COMMENT ON COLUMN tec.l_individualreportingdata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.l_individualreportingdata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.l_individualreportingdata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.l_individualreportingdata.filersort IS $$Filer name for sorting$$;
COMMENT ON COLUMN tec.l_individualreportingdata.duedt IS $$Report due date$$;
COMMENT ON COLUMN tec.l_individualreportingdata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.l_individualreportingdata.periodstartdt IS $$Beginning of period covered$$;
COMMENT ON COLUMN tec.l_individualreportingdata.periodenddt IS $$Ending of period covered$$;
COMMENT ON COLUMN tec.l_individualreportingdata.lobbyexpendonbehalfid IS $$Lobby expend-on-behalf unique identifier$$;
COMMENT ON COLUMN tec.l_individualreportingdata.onbehalfname IS $$Mashed on-behalf of name$$;
COMMENT ON COLUMN tec.l_individualreportingdata.onbehalfmailingaddr1 IS $$On-behalf of mailing address - line 1$$;
COMMENT ON COLUMN tec.l_individualreportingdata.onbehalfmailingaddr2 IS $$On-behalf of mailing address - line 2$$;
COMMENT ON COLUMN tec.l_individualreportingdata.onbehalfmailingcity IS $$On-behalf of mailing address - city$$;
COMMENT ON COLUMN tec.l_individualreportingdata.onbehalfmailingstatecd IS $$On-behalf of mailing address - state code (e.g. TX, CA) - for    country=USA/UMI only$$;
COMMENT ON COLUMN tec.l_individualreportingdata.onbehalfmailingcountycd IS $$On-behalf of mailing address - Texas county$$;
COMMENT ON COLUMN tec.l_individualreportingdata.onbehalfmailingcountrycd IS $$On-behalf of mailing address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.l_individualreportingdata.onbehalfmailingpostalcode IS $$On-behalf of mailing address - postal code - USA addresses only$$;
COMMENT ON COLUMN tec.l_individualreportingdata.onbehalfmailingregion IS $$On-behalf of mailing address - region for country other than USA$$;
COMMENT ON COLUMN tec.l_individualreportingdata.onbehalfprimaryusaphoneflag IS $$On-behalf of primary phone number - Y if number is a USA phone, Notherwise$$;
COMMENT ON COLUMN tec.l_individualreportingdata.onbehalfprimaryphonenumber IS $$On-behalf of primary phone number$$;
COMMENT ON COLUMN tec.l_individualreportingdata.onbehalfprimaryphoneext IS $$On-behalf of primary phone extension$$;
\COPY tec.l_IndividualReportingData FROM 'data/TEC_LA_CSV/LaI4E.csv' WITH ( FORMAT CSV , HEADER true );


ALTER TABLE tec.l_IndividualReportingData
	ADD FOREIGN KEY (formTypeCd) REFERENCES tec.codes_forms NOT VALID,
	ADD FOREIGN KEY (reportTypeCd) REFERENCES tec.codes_reports NOT VALID,
	ADD FOREIGN KEY (reportInfoIdent) REFERENCES tec.l_CoverSheetLaData NOT VALID,
	ADD FOREIGN KEY (filerTypeCd) REFERENCES tec.codes_filertype NOT VALID,
	ADD FOREIGN KEY (onbehalfMailingCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (onbehalfMailingCountryCd) REFERENCES tec.codes_countries NOT VALID;

CREATE INDEX ON tec.l_IndividualReportingData (reportinfoident);

