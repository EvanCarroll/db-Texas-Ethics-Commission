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

\echo LOADING c_TravelData


CREATE TABLE tec.c_TravelData (
	recordType                              text,
	formTypeCd                              text,
	schedFormTypeCd                         text,
	reportInfoIdent                         int,
	receivedDt                              date,
	infoOnlyFlag                            bool,
	filerIdent                              int,
	filerTypeCd                             text,
	filerName                               text,
	travelInfoId                            bigint,
	parentType                              text,
	parentId                                bigint,
	parentDt                                date,
	parentAmount                            numeric(12,2),
	parentFullName                          text,
	transportationTypeCd                    text,
	transportationTypeDescr                 text,
	departureCity                           text,
	arrivalCity                             text,
	departureDt                             date,
	arrivalDt                               date,
	travelPurpose                           text,
	travellerPersentTypeCd                  text,
	travellerNameOrganization               text,
	travellerNameLast                       text,
	travellerNameSuffixCd                   text,
	travellerNameFirst                      text,
	travellerNamePrefixCd                   text,
	travellerNameShort                      text,
	PRIMARY KEY ( travelInfoId )
);
COMMENT ON TABLE tec.c_TravelData IS $$Travel outside the State of Texas - Schedule T - Travel records are linked to records in contribs, pledges and expenditure files through the fields parentType and parentId. They store information about in-kind contributions accepted for travel outside the State of Texas and for expenditures made for travel outside the State of Texas. File: travel.csv$$;
COMMENT ON COLUMN tec.c_traveldata.recordtype IS $$Record type code - always TRVL$$;
COMMENT ON COLUMN tec.c_traveldata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.c_traveldata.schedformtypecd IS $$TEC Schedule Used$$;
COMMENT ON COLUMN tec.c_traveldata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.c_traveldata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.c_traveldata.infoonlyflag IS $$Superseded by other report$$;
COMMENT ON COLUMN tec.c_traveldata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.c_traveldata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.c_traveldata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.c_traveldata.travelinfoid IS $$Travel unique identifier$$;
COMMENT ON COLUMN tec.c_traveldata.parenttype IS $$Parent record type (CONTRIB, EXPEND, PLEDGE)$$;
COMMENT ON COLUMN tec.c_traveldata.parentid IS $$Parent unique identifier$$;
COMMENT ON COLUMN tec.c_traveldata.parentdt IS $$Date of parent transaction$$;
COMMENT ON COLUMN tec.c_traveldata.parentamount IS $$Amount of parent transaction$$;
COMMENT ON COLUMN tec.c_traveldata.parentfullname IS $$Full name associated with parent$$;
COMMENT ON COLUMN tec.c_traveldata.transportationtypecd IS $$Type of transportation (COMMAIR, PRIVAIR, etc)$$;
COMMENT ON COLUMN tec.c_traveldata.transportationtypedescr IS $$Transporation type description$$;
COMMENT ON COLUMN tec.c_traveldata.departurecity IS $$Departure city$$;
COMMENT ON COLUMN tec.c_traveldata.arrivalcity IS $$Arrival city$$;
COMMENT ON COLUMN tec.c_traveldata.departuredt IS $$Departure date$$;
COMMENT ON COLUMN tec.c_traveldata.arrivaldt IS $$Arrival date$$;
COMMENT ON COLUMN tec.c_traveldata.travelpurpose IS $$Purpose of travel$$;
COMMENT ON COLUMN tec.c_traveldata.travellerpersenttypecd IS $$Type of traveller name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.c_traveldata.travellernameorganization IS $$For ENTITY, the traveller organization name$$;
COMMENT ON COLUMN tec.c_traveldata.travellernamelast IS $$For INDIVIDUAL, the traveller last name$$;
COMMENT ON COLUMN tec.c_traveldata.travellernamesuffixcd IS $$For INDIVIDUAL, the traveller name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.c_traveldata.travellernamefirst IS $$For INDIVIDUAL, the traveller first name$$;
COMMENT ON COLUMN tec.c_traveldata.travellernameprefixcd IS $$For INDIVIDUAL, the traveller name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.c_traveldata.travellernameshort IS $$For INDIVIDUAL, the traveller short name (nickname)$$;
\COPY tec.c_TravelData FROM 'data/TEC_CF_CSV/travel.csv' WITH ( FORMAT CSV , HEADER true );


CREATE INDEX ON tec.c_TravelData (filerIdent, filerTypeCd);

ALTER TABLE tec.c_TravelData
	ADD FOREIGN KEY (reportInfoIdent) REFERENCES tec.c_CoverSheet1Data NOT VALID,
	ADD FOREIGN KEY (filerIdent, filerTypeCd) REFERENCES tec.c_FilerData NOT VALID;

CREATE INDEX ON tec.c_TravelData (reportinfoident);

