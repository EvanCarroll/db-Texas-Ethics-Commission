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

\echo LOADING c_CoverSheet2Data


CREATE TABLE tec.c_CoverSheet2Data (
	recordType                              text,
	formTypeCd                              text,
	reportInfoIdent                         int,
	receivedDt                              date,
	infoOnlyFlag                            bool,
	filerIdent                              int,
	filerTypeCd                             text,
	filerName                               text,
	committeeActivityId                     bigint,
	notifierCommactPersentKindCd            text,
	notifierPersentTypeCd                   text,
	notifierNameOrganization                text,
	notifierNameLast                        text,
	notifierNameSuffixCd                    text,
	notifierNameFirst                       text,
	notifierNamePrefixCd                    text,
	notifierNameShort                       text,
	notifierStreetAddr1                     text,
	notifierStreetAddr2                     text,
	notifierStreetCity                      text,
	notifierStreetStateCd                   text,
	notifierStreetCountyCd                  text,
	notifierStreetCountryCd                 char(3),
	notifierStreetPostalCode                text,
	notifierStreetRegion                    text,
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
	PRIMARY KEY (committeeActivityId)
);
COMMENT ON TABLE tec.c_CoverSheet2Data IS $$Cover Sheet 2 - Notices received by candidates/office holders. These notices are reported at the bottom of Cover Sheet Page 1 and the top of Cover Sheet Page 2 for FORMNAME = COH, COHFR, CORCOH, JCOH, SCCOH, SCSPAC. File: notices.csv$$;
COMMENT ON COLUMN tec.c_coversheet2data.recordtype IS $$Record type code - always CVR2$$;
COMMENT ON COLUMN tec.c_coversheet2data.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.c_coversheet2data.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.c_coversheet2data.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.c_coversheet2data.infoonlyflag IS $$Superseded by other report$$;
COMMENT ON COLUMN tec.c_coversheet2data.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.c_coversheet2data.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.c_coversheet2data.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.c_coversheet2data.committeeactivityid IS $$Contribution unique identifier$$;
COMMENT ON COLUMN tec.c_coversheet2data.notifiercommactpersentkindcd IS $$Committee activity person/entity kind$$;
COMMENT ON COLUMN tec.c_coversheet2data.notifierpersenttypecd IS $$Type of notifier name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.c_coversheet2data.notifiernameorganization IS $$For ENTITY, the notifier organization name$$;
COMMENT ON COLUMN tec.c_coversheet2data.notifiernamelast IS $$For INDIVIDUAL, the notifier last name$$;
COMMENT ON COLUMN tec.c_coversheet2data.notifiernamesuffixcd IS $$For INDIVIDUAL, the notifier name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.c_coversheet2data.notifiernamefirst IS $$For INDIVIDUAL, the notifier first name$$;
COMMENT ON COLUMN tec.c_coversheet2data.notifiernameprefixcd IS $$For INDIVIDUAL, the notifier name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.c_coversheet2data.notifiernameshort IS $$For INDIVIDUAL, the notifier short name (nickname)$$;
COMMENT ON COLUMN tec.c_coversheet2data.notifierstreetaddr1 IS $$Notifier street address - line 1$$;
COMMENT ON COLUMN tec.c_coversheet2data.notifierstreetaddr2 IS $$Notifier street address - line 2$$;
COMMENT ON COLUMN tec.c_coversheet2data.notifierstreetcity IS $$Notifier street address - city$$;
COMMENT ON COLUMN tec.c_coversheet2data.notifierstreetstatecd IS $$Notifier street address - state code (e.g. TX, CA) - for         country=USA/UMI only$$;
COMMENT ON COLUMN tec.c_coversheet2data.notifierstreetcountycd IS $$Notifier street address - Texas county$$;
COMMENT ON COLUMN tec.c_coversheet2data.notifierstreetcountrycd IS $$Notifier street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.c_coversheet2data.notifierstreetpostalcode IS $$Notifier street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.c_coversheet2data.notifierstreetregion IS $$Notifier street address - region for country other than USA$$;
COMMENT ON COLUMN tec.c_coversheet2data.treaspersenttypecd IS $$Type of treasurer name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.c_coversheet2data.treasnameorganization IS $$For ENTITY, the treasurer organization name$$;
COMMENT ON COLUMN tec.c_coversheet2data.treasnamelast IS $$For INDIVIDUAL, the treasurer last name$$;
COMMENT ON COLUMN tec.c_coversheet2data.treasnamesuffixcd IS $$For INDIVIDUAL, the treasurer name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.c_coversheet2data.treasnamefirst IS $$For INDIVIDUAL, the treasurer first name$$;
COMMENT ON COLUMN tec.c_coversheet2data.treasnameprefixcd IS $$For INDIVIDUAL, the treasurer name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.c_coversheet2data.treasnameshort IS $$For INDIVIDUAL, the treasurer short name (nickname)$$;
COMMENT ON COLUMN tec.c_coversheet2data.treasstreetaddr1 IS $$Treasurer street address - line 1$$;
COMMENT ON COLUMN tec.c_coversheet2data.treasstreetaddr2 IS $$Treasurer street address - line 2$$;
COMMENT ON COLUMN tec.c_coversheet2data.treasstreetcity IS $$Treasurer street address - city$$;
COMMENT ON COLUMN tec.c_coversheet2data.treasstreetstatecd IS $$Treasurer street address - state code (e.g. TX, CA) - for        country=USA/UMI only$$;
COMMENT ON COLUMN tec.c_coversheet2data.treasstreetcountycd IS $$Treasurer street address - Texas county$$;
COMMENT ON COLUMN tec.c_coversheet2data.treasstreetcountrycd IS $$Treasurer street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.c_coversheet2data.treasstreetpostalcode IS $$Treasurer street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.c_coversheet2data.treasstreetregion IS $$Treasurer street address - region for country other than USA$$;
\COPY tec.c_CoverSheet2Data FROM 'data/TEC_CF_CSV/notices.csv' WITH ( FORMAT CSV , HEADER true );


CREATE INDEX ON tec.c_CoverSheet2Data (filerIdent, filerTypeCd);

ALTER TABLE tec.c_CoverSheet2Data
	ADD FOREIGN KEY (reportInfoIdent) REFERENCES tec.c_CoverSheet1Data NOT VALID,
	ADD FOREIGN KEY (notifierStreetCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (notifierStreetCountryCd) REFERENCES tec.codes_country NOT VALID,
	ADD FOREIGN KEY (treasStreetCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (treasStreetCountryCd) REFERENCES tec.codes_country NOT VALID,
	ADD FOREIGN KEY (filerIdent, filerTypeCd) REFERENCES tec.c_FilerData NOT VALID;

CREATE INDEX ON tec.c_CoverSheet2Data (reportinfoident);

