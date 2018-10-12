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

\echo LOADING l_TransportationData


CREATE TABLE tec.l_transportationdata (
	recordType                              text,
	formTypeCd                              text,
	reportTypeCd                            text,
	reportInfoIdent                         int,
	applicableYear                          text,
	filerIdent                              int,
	filerTypeCd                             text,
	filerName                               text,
	filerSort                               text,
	dueDt                                   date,
	receivedDt                              date,
	periodStartDt                           date,
	periodEndDt                             date,
	lobbyActivityId                         bigint,
	lobactivityTravelId                     bigint,
	creditCardFlag                          bool,
	lobbyActivityPeriodCd                   text,
	recipientPersentTypeCd                  text,
	recipientNameOrganization               text,
	recipientNameLast                       text,
	recipientNameSuffixCd                   text,
	recipientNameFirst                      text,
	recipientNamePrefixCd                   text,
	recipientNameShort                      text,
	lodgingName                             text,
	lodgingStreetAddr1                      text,
	lodgingStreetAddr2                      text,
	lodgingStreetCity                       text,
	lodgingStreetStateCd                    text,
	lodgingStreetCountryCd                  text,
	lodgingStreetPostalCode                 text,
	lodgingStreetRegion                     text,
	checkInDt                               date,
	checkOutDt                              date,
	transportationTypeCd                    text,
	transportationTypeDescr                 text,
	departureCity                           text,
	departureDt                             date,
	arrivalCity                             text,
	arrivalDt                               date,
	travelPurpose                           text,
	PRIMARY KEY (lobactivityTravelId)
);
COMMENT ON TABLE tec.l_transportationdata IS $$Form LA Schedule B - Transportation and Lodging. File: LaTran.csv$$;
COMMENT ON COLUMN tec.l_transportationdata.recordtype IS $$Record type code - always TRAN$$;
COMMENT ON COLUMN tec.l_transportationdata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.l_transportationdata.reporttypecd IS $$Report type$$;
COMMENT ON COLUMN tec.l_transportationdata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.l_transportationdata.applicableyear IS $$Year applicable$$;
COMMENT ON COLUMN tec.l_transportationdata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.l_transportationdata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.l_transportationdata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.l_transportationdata.filersort IS $$Filer name for sorting$$;
COMMENT ON COLUMN tec.l_transportationdata.duedt IS $$Report due date$$;
COMMENT ON COLUMN tec.l_transportationdata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.l_transportationdata.periodstartdt IS $$Beginning of period covered$$;
COMMENT ON COLUMN tec.l_transportationdata.periodenddt IS $$Ending of period covered$$;
COMMENT ON COLUMN tec.l_transportationdata.lobbyactivityid IS $$Lobby activity unique identifier$$;
COMMENT ON COLUMN tec.l_transportationdata.lobactivitytravelid IS $$Lobby activity travel unique identifier$$;
COMMENT ON COLUMN tec.l_transportationdata.creditcardflag IS $$Credit card used$$;
COMMENT ON COLUMN tec.l_transportationdata.lobbyactivityperiodcd IS $$Lobby activity period$$;
COMMENT ON COLUMN tec.l_transportationdata.recipientpersenttypecd IS $$Type of recipient name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.l_transportationdata.recipientnameorganization IS $$For ENTITY, the recipient organization name$$;
COMMENT ON COLUMN tec.l_transportationdata.recipientnamelast IS $$For INDIVIDUAL, the recipient last name$$;
COMMENT ON COLUMN tec.l_transportationdata.recipientnamesuffixcd IS $$For INDIVIDUAL, the recipient name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.l_transportationdata.recipientnamefirst IS $$For INDIVIDUAL, the recipient first name$$;
COMMENT ON COLUMN tec.l_transportationdata.recipientnameprefixcd IS $$For INDIVIDUAL, the recipient name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.l_transportationdata.recipientnameshort IS $$For INDIVIDUAL, the recipient short name (nickname)$$;
COMMENT ON COLUMN tec.l_transportationdata.lodgingname IS $$Name of lodging establishment$$;
COMMENT ON COLUMN tec.l_transportationdata.lodgingstreetaddr1 IS $$Lodging street address - line 1$$;
COMMENT ON COLUMN tec.l_transportationdata.lodgingstreetaddr2 IS $$Lodging street address - line 2$$;
COMMENT ON COLUMN tec.l_transportationdata.lodgingstreetcity IS $$Lodging street address - city$$;
COMMENT ON COLUMN tec.l_transportationdata.lodgingstreetstatecd IS $$Lodging street address - state code (e.g. TX, CA) - for          country=USA/UMI only$$;
COMMENT ON COLUMN tec.l_transportationdata.lodgingstreetcountrycd IS $$Lodging street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.l_transportationdata.lodgingstreetpostalcode IS $$Lodging street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.l_transportationdata.lodgingstreetregion IS $$Lodging street address - region for country other than USA$$;
COMMENT ON COLUMN tec.l_transportationdata.checkindt IS $$Check in date$$;
COMMENT ON COLUMN tec.l_transportationdata.checkoutdt IS $$Check out date$$;
COMMENT ON COLUMN tec.l_transportationdata.transportationtypecd IS $$Type of transportation (COMMAIR, PRIVAIR, etc)$$;
COMMENT ON COLUMN tec.l_transportationdata.transportationtypedescr IS $$Transporation type description$$;
COMMENT ON COLUMN tec.l_transportationdata.departurecity IS $$Departure city$$;
COMMENT ON COLUMN tec.l_transportationdata.departuredt IS $$Departure date$$;
COMMENT ON COLUMN tec.l_transportationdata.arrivalcity IS $$Arrival city$$;
COMMENT ON COLUMN tec.l_transportationdata.arrivaldt IS $$Arrival date$$;
COMMENT ON COLUMN tec.l_transportationdata.travelpurpose IS $$Purpose of travel$$;
\COPY tec.l_transportationdata FROM 'data/TEC_LA_CSV/LaTran.csv' WITH ( FORMAT CSV , HEADER true );


ALTER TABLE tec.l_transportationdata
	ADD FOREIGN KEY (reportTypeCd) REFERENCES tec.codes_reports NOT VALID,
	ADD FOREIGN KEY (reportInfoIdent) REFERENCES tec.l_coversheetladata NOT VALID,
	ADD FOREIGN KEY (filerTypeCd) REFERENCES tec.codes_filertype NOT VALID;

CREATE INDEX ON tec.l_transportationdata (reportInfoIdent);

