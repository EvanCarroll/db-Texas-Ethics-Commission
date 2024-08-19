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

\echo LOADING l_EventData


CREATE TABLE tec.l_EventData (
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
	lobbyActivityId                         bigint,
	creditCardFlag                          bool,
	activityDate                            date,
	activityDescription                     text,
	lobbyEventKindCd                        text,
	recipientPersentTypeCd                  text,
	recipientNameOrganization               text,
	recipientNameLast                       text,
	recipientNameSuffixCd                   text,
	recipientNameFirst                      text,
	recipientNamePrefixCd                   text,
	recipientNameShort                      text,
	beneficiaryPersentTypeCd                text,
	beneficiaryNameOrganization             text,
	beneficiaryNameLast                     text,
	beneficiaryNameSuffixCd                 text,
	beneficiaryNameFirst                    text,
	beneficiaryNamePrefixCd                 text,
	beneficiaryNameShort                    text,
	PRIMARY KEY (lobbyActivityId)
);
COMMENT ON TABLE tec.l_EventData IS $$Form LA Schedule G - Pol. Fundraisers and Charity Events. File: LaEvnt.csv$$;
COMMENT ON COLUMN tec.l_eventdata.recordtype IS $$Record type code - always EVNT$$;
COMMENT ON COLUMN tec.l_eventdata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.l_eventdata.reporttypecd IS $$Report type$$;
COMMENT ON COLUMN tec.l_eventdata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.l_eventdata.applicableyear IS $$Year applicable$$;
COMMENT ON COLUMN tec.l_eventdata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.l_eventdata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.l_eventdata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.l_eventdata.filersort IS $$Filer name for sorting$$;
COMMENT ON COLUMN tec.l_eventdata.duedt IS $$Report due date$$;
COMMENT ON COLUMN tec.l_eventdata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.l_eventdata.periodstartdt IS $$Beginning of period covered$$;
COMMENT ON COLUMN tec.l_eventdata.periodenddt IS $$Ending of period covered$$;
COMMENT ON COLUMN tec.l_eventdata.lobbyactivityid IS $$Lobby activity unique identifier$$;
COMMENT ON COLUMN tec.l_eventdata.creditcardflag IS $$Credit card used$$;
COMMENT ON COLUMN tec.l_eventdata.activitydate IS $$Activity Date$$;
COMMENT ON COLUMN tec.l_eventdata.activitydescription IS $$Activity description$$;
COMMENT ON COLUMN tec.l_eventdata.lobbyeventkindcd IS $$Fundraiser/charity indicator$$;
COMMENT ON COLUMN tec.l_eventdata.recipientpersenttypecd IS $$Type of recipient name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.l_eventdata.recipientnameorganization IS $$For ENTITY, the recipient organization name$$;
COMMENT ON COLUMN tec.l_eventdata.recipientnamelast IS $$For INDIVIDUAL, the recipient last name$$;
COMMENT ON COLUMN tec.l_eventdata.recipientnamesuffixcd IS $$For INDIVIDUAL, the recipient name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.l_eventdata.recipientnamefirst IS $$For INDIVIDUAL, the recipient first name$$;
COMMENT ON COLUMN tec.l_eventdata.recipientnameprefixcd IS $$For INDIVIDUAL, the recipient name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.l_eventdata.recipientnameshort IS $$For INDIVIDUAL, the recipient short name (nickname)$$;
COMMENT ON COLUMN tec.l_eventdata.beneficiarypersenttypecd IS $$Type of beneficiary name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.l_eventdata.beneficiarynameorganization IS $$For ENTITY, the beneficiary organization name$$;
COMMENT ON COLUMN tec.l_eventdata.beneficiarynamelast IS $$For INDIVIDUAL, the beneficiary last name$$;
COMMENT ON COLUMN tec.l_eventdata.beneficiarynamesuffixcd IS $$For INDIVIDUAL, the beneficiary name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.l_eventdata.beneficiarynamefirst IS $$For INDIVIDUAL, the beneficiary first name$$;
COMMENT ON COLUMN tec.l_eventdata.beneficiarynameprefixcd IS $$For INDIVIDUAL, the beneficiary name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.l_eventdata.beneficiarynameshort IS $$For INDIVIDUAL, the beneficiary short name (nickname)$$;
\COPY tec.l_EventData FROM 'data/TEC_LA_CSV/LaEvnt.csv' WITH ( FORMAT CSV , HEADER true );


ALTER TABLE tec.l_EventData
	ADD FOREIGN KEY (formTypeCd) REFERENCES tec.codes_forms NOT VALID,
	ADD FOREIGN KEY (reportTypeCd) REFERENCES tec.codes_reports NOT VALID,
	ADD FOREIGN KEY (reportInfoIdent) REFERENCES tec.l_CoverSheetLaData NOT VALID,
	ADD FOREIGN KEY (filerTypeCd) REFERENCES tec.codes_filertype NOT VALID,
	ADD FOREIGN KEY (recipientNameSuffixCd) REFERENCES tec.codes_name_suffixes NOT VALID,
	ADD FOREIGN KEY (recipientNamePrefixCd) REFERENCES tec.codes_name_prefixes NOT VALID,
	ADD FOREIGN KEY (beneficiaryNameSuffixCd) REFERENCES tec.codes_name_suffixes NOT VALID,
	ADD FOREIGN KEY (beneficiaryNamePrefixCd) REFERENCES tec.codes_name_prefixes NOT VALID;

CREATE INDEX ON tec.l_EventData (reportinfoident);

