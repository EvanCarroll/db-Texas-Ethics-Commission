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

\echo LOADING TransportationData



CREATE TABLE tec.transportationdata (
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
	FOREIGN KEY (filerIdent, filerTypeCd) REFERENCES tec.FilerData
);

COMMENT ON TABLE tec.transportationdata IS $$Form LA Schedule B - Transportation and Lodging. File: LaTran.csv$$;
COMMENT ON COLUMN tec.transportationdata.recordtype IS $$Record type code - always TRAN$$;
COMMENT ON COLUMN tec.transportationdata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.transportationdata.reporttypecd IS $$Report type$$;
COMMENT ON COLUMN tec.transportationdata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.transportationdata.applicableyear IS $$Year applicable$$;
COMMENT ON COLUMN tec.transportationdata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.transportationdata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.transportationdata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.transportationdata.filersort IS $$Filer name for sorting$$;
COMMENT ON COLUMN tec.transportationdata.duedt IS $$Report due date$$;
COMMENT ON COLUMN tec.transportationdata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.transportationdata.periodstartdt IS $$Beginning of period covered$$;
COMMENT ON COLUMN tec.transportationdata.periodenddt IS $$Ending of period covered$$;
COMMENT ON COLUMN tec.transportationdata.lobbyactivityid IS $$Lobby activity unique identifier$$;
COMMENT ON COLUMN tec.transportationdata.lobactivitytravelid IS $$Lobby activity travel unique identifier$$;
COMMENT ON COLUMN tec.transportationdata.creditcardflag IS $$Credit card used$$;
COMMENT ON COLUMN tec.transportationdata.lobbyactivityperiodcd IS $$Lobby activity period$$;
COMMENT ON COLUMN tec.transportationdata.recipientpersenttypecd IS $$Type of recipient name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.transportationdata.recipientnameorganization IS $$For ENTITY, the recipient organization name$$;
COMMENT ON COLUMN tec.transportationdata.recipientnamelast IS $$For INDIVIDUAL, the recipient last name$$;
COMMENT ON COLUMN tec.transportationdata.recipientnamesuffixcd IS $$For INDIVIDUAL, the recipient name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.transportationdata.recipientnamefirst IS $$For INDIVIDUAL, the recipient first name$$;
COMMENT ON COLUMN tec.transportationdata.recipientnameprefixcd IS $$For INDIVIDUAL, the recipient name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.transportationdata.recipientnameshort IS $$For INDIVIDUAL, the recipient short name (nickname)$$;
COMMENT ON COLUMN tec.transportationdata.lodgingname IS $$Name of lodging establishment$$;
COMMENT ON COLUMN tec.transportationdata.lodgingstreetaddr1 IS $$Lodging street address - line 1$$;
COMMENT ON COLUMN tec.transportationdata.lodgingstreetaddr2 IS $$Lodging street address - line 2$$;
COMMENT ON COLUMN tec.transportationdata.lodgingstreetcity IS $$Lodging street address - city$$;
COMMENT ON COLUMN tec.transportationdata.lodgingstreetstatecd IS $$Lodging street address - state code (e.g. TX, CA) - for          country=USA/UMI only$$;
COMMENT ON COLUMN tec.transportationdata.lodgingstreetcountrycd IS $$Lodging street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.transportationdata.lodgingstreetpostalcode IS $$Lodging street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.transportationdata.lodgingstreetregion IS $$Lodging street address - region for country other than USA$$;
COMMENT ON COLUMN tec.transportationdata.checkindt IS $$Check in date$$;
COMMENT ON COLUMN tec.transportationdata.checkoutdt IS $$Check out date$$;
COMMENT ON COLUMN tec.transportationdata.transportationtypecd IS $$Type of transportation (COMMAIR, PRIVAIR, etc)$$;
COMMENT ON COLUMN tec.transportationdata.transportationtypedescr IS $$Transporation type description$$;
COMMENT ON COLUMN tec.transportationdata.departurecity IS $$Departure city$$;
COMMENT ON COLUMN tec.transportationdata.departuredt IS $$Departure date$$;
COMMENT ON COLUMN tec.transportationdata.arrivalcity IS $$Arrival city$$;
COMMENT ON COLUMN tec.transportationdata.arrivaldt IS $$Arrival date$$;
COMMENT ON COLUMN tec.transportationdata.travelpurpose IS $$Purpose of travel$$;
\COPY tec.transportationdata FROM 'data/TEC_LA_CSV/LaTran.csv' WITH ( FORMAT CSV , HEADER true )