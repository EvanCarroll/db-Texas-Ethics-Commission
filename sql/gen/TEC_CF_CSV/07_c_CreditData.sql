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

\echo LOADING c_CreditData


CREATE TABLE tec.c_CreditData (
	recordType                              text,
	formTypeCd                              text,
	schedFormTypeCd                         text,
	reportInfoIdent                         int,
	receivedDt                              date,
	infoOnlyFlag                            bool,
	filerIdent                              int,
	filerTypeCd                             text,
	filerName                               text,
	creditInfoId                            bigint,
	creditDt                                date,
	creditAmount                            numeric(10,2),
	creditDescr                             text,
	payorPersentTypeCd                      text,
	payorNameOrganization                   text,
	payorNameLast                           text,
	payorNameSuffixCd                       text,
	payorNameFirst                          text,
	payorNamePrefixCd                       text,
	payorNameShort                          text,
	payorStreetAddr1                        text,
	payorStreetAddr2                        text,
	payorStreetCity                         text,
	payorStreetStateCd                      text,
	payorStreetCountyCd                     text,
	payorStreetCountryCd                    text,
	payorStreetPostalCode                   text,
	payorStreetRegion                       text,
	PRIMARY KEY ( creditInfoId )
);
COMMENT ON TABLE tec.c_CreditData IS $$Credits - Schedule K - Interest, credits, gains, refunds, and contributions returned to filer. File: credits.csv$$;
COMMENT ON COLUMN tec.c_creditdata.recordtype IS $$Record type code - always CRED$$;
COMMENT ON COLUMN tec.c_creditdata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.c_creditdata.schedformtypecd IS $$TEC Schedule Used$$;
COMMENT ON COLUMN tec.c_creditdata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.c_creditdata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.c_creditdata.infoonlyflag IS $$Superseded by other report$$;
COMMENT ON COLUMN tec.c_creditdata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.c_creditdata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.c_creditdata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.c_creditdata.creditinfoid IS $$Credit unique identifier$$;
COMMENT ON COLUMN tec.c_creditdata.creditdt IS $$Credit date$$;
COMMENT ON COLUMN tec.c_creditdata.creditamount IS $$Credit amount$$;
COMMENT ON COLUMN tec.c_creditdata.creditdescr IS $$Credit description$$;
COMMENT ON COLUMN tec.c_creditdata.payorpersenttypecd IS $$Type of payor name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.c_creditdata.payornameorganization IS $$For ENTITY, the payor organization name$$;
COMMENT ON COLUMN tec.c_creditdata.payornamelast IS $$For INDIVIDUAL, the payor last name$$;
COMMENT ON COLUMN tec.c_creditdata.payornamesuffixcd IS $$For INDIVIDUAL, the payor name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.c_creditdata.payornamefirst IS $$For INDIVIDUAL, the payor first name$$;
COMMENT ON COLUMN tec.c_creditdata.payornameprefixcd IS $$For INDIVIDUAL, the payor name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.c_creditdata.payornameshort IS $$For INDIVIDUAL, the payor short name (nickname)$$;
COMMENT ON COLUMN tec.c_creditdata.payorstreetaddr1 IS $$Payor street address - line 1$$;
COMMENT ON COLUMN tec.c_creditdata.payorstreetaddr2 IS $$Payor street address - line 2$$;
COMMENT ON COLUMN tec.c_creditdata.payorstreetcity IS $$Payor street address - city$$;
COMMENT ON COLUMN tec.c_creditdata.payorstreetstatecd IS $$Payor street address - state code (e.g. TX, CA) - for            country=USA/UMI only$$;
COMMENT ON COLUMN tec.c_creditdata.payorstreetcountycd IS $$Payor street address - Texas county$$;
COMMENT ON COLUMN tec.c_creditdata.payorstreetcountrycd IS $$Payor street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.c_creditdata.payorstreetpostalcode IS $$Payor street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.c_creditdata.payorstreetregion IS $$Payor street address - region for country other than USA$$;
\COPY tec.c_CreditData FROM 'data/TEC_CF_CSV/credits.csv' WITH ( FORMAT CSV , HEADER true );


CREATE INDEX ON tec.c_CreditData (filerIdent, filerTypeCd);

ALTER TABLE tec.c_CreditData
	ADD FOREIGN KEY (reportInfoIdent) REFERENCES tec.c_CoverSheet1Data NOT VALID,
	ADD FOREIGN KEY (payorStreetCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (filerIdent, filerTypeCd) REFERENCES tec.c_FilerData NOT VALID;

CREATE INDEX ON tec.c_CreditData (reportinfoident);

