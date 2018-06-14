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

\echo LOADING TravelData



CREATE TABLE tec.traveldata (
	recordType                              text,
	formTypeCd                              text,
	schedFormTypeCd                         text,
	reportInfoIdent                         int,
	receivedDt                              date,
	infoOnlyFlag                            bool,
	filerIdent                              int,
	filerTypeCd                             text,
	filerName                               text,
	travelInfoId                            bigint              PRIMARY KEY,
	parentType                              text,
	parentId                                bigint,
	parentDt                                date,
	parentAmount                            numeric(10,2),
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
	FOREIGN KEY (filerIdent, filerTypeCd) REFERENCES tec.FilerData NOT VALID
);

COMMENT ON TABLE tec.traveldata IS $$Travel outside the State of Texas - Schedule T - Travel records are linked to records in contribs, pledges and expenditure files through the fields parentType and parentId. They store information about in-kind contributions accepted for travel outside the State of Texas and for expenditures made for travel outside the State of Texas. File: travel.csv$$;
COMMENT ON COLUMN tec.traveldata.recordtype IS $$Record type code - always TRVL$$;
COMMENT ON COLUMN tec.traveldata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.traveldata.schedformtypecd IS $$TEC Schedule Used$$;
COMMENT ON COLUMN tec.traveldata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.traveldata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.traveldata.infoonlyflag IS $$Superseded by other report$$;
COMMENT ON COLUMN tec.traveldata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.traveldata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.traveldata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.traveldata.travelinfoid IS $$Travel unique identifier$$;
COMMENT ON COLUMN tec.traveldata.parenttype IS $$Parent record type (CONTRIB, EXPEND, PLEDGE)$$;
COMMENT ON COLUMN tec.traveldata.parentid IS $$Parent unique identifier$$;
COMMENT ON COLUMN tec.traveldata.parentdt IS $$Date of parent transaction$$;
COMMENT ON COLUMN tec.traveldata.parentamount IS $$Amount of parent transaction$$;
COMMENT ON COLUMN tec.traveldata.parentfullname IS $$Full name associated with parent$$;
COMMENT ON COLUMN tec.traveldata.transportationtypecd IS $$Type of transportation (COMMAIR, PRIVAIR, etc)$$;
COMMENT ON COLUMN tec.traveldata.transportationtypedescr IS $$Transporation type description$$;
COMMENT ON COLUMN tec.traveldata.departurecity IS $$Departure city$$;
COMMENT ON COLUMN tec.traveldata.arrivalcity IS $$Arrival city$$;
COMMENT ON COLUMN tec.traveldata.departuredt IS $$Departure date$$;
COMMENT ON COLUMN tec.traveldata.arrivaldt IS $$Arrival date$$;
COMMENT ON COLUMN tec.traveldata.travelpurpose IS $$Purpose of travel$$;
COMMENT ON COLUMN tec.traveldata.travellerpersenttypecd IS $$Type of traveller name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.traveldata.travellernameorganization IS $$For ENTITY, the traveller organization name$$;
COMMENT ON COLUMN tec.traveldata.travellernamelast IS $$For INDIVIDUAL, the traveller last name$$;
COMMENT ON COLUMN tec.traveldata.travellernamesuffixcd IS $$For INDIVIDUAL, the traveller name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.traveldata.travellernamefirst IS $$For INDIVIDUAL, the traveller first name$$;
COMMENT ON COLUMN tec.traveldata.travellernameprefixcd IS $$For INDIVIDUAL, the traveller name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.traveldata.travellernameshort IS $$For INDIVIDUAL, the traveller short name (nickname)$$;
\COPY tec.traveldata FROM 'data/TEC_CF_CSV/travel.csv' WITH ( FORMAT CSV , HEADER true )