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

\echo LOADING EntertainmentData



CREATE TABLE tec.entertainmentdata (
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
	creditCardFlag                          bool,
	activityDate                            date,
	activityAmountCd                        text,
	activityExactAmount                     numeric(10,2),
	activityAmountRangeLow                  numeric(10,2),
	activityAmountRangeHigh                 numeric(10,2),
	recipientPersentTypeCd                  text,
	recipientNameOrganization               text,
	recipientNameLast                       text,
	recipientNameSuffixCd                   text,
	recipientNameFirst                      text,
	recipientNamePrefixCd                   text,
	recipientNameShort                      text,
	entertainmentName                       text,
	entertainmentStreetAddr1                text,
	entertainmentStreetAddr2                text,
	entertainmentStreetCity                 text,
	entertainmentStreetStateCd              text,
	entertainmentStreetCountryCd            text,
	entertainmentStreetPostalCode           text,
	entertainmentStreetRegion               text,
	FOREIGN KEY (filerIdent, filerTypeCd) REFERENCES tec.FilerData NOT VALID
);

COMMENT ON TABLE tec.entertainmentdata IS $$Form LA Schedule D - Entertainment. File: LaEnt.csv$$;
COMMENT ON COLUMN tec.entertainmentdata.recordtype IS $$Record type code - always ENT$$;
COMMENT ON COLUMN tec.entertainmentdata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.entertainmentdata.reporttypecd IS $$Report type$$;
COMMENT ON COLUMN tec.entertainmentdata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.entertainmentdata.applicableyear IS $$Year applicable$$;
COMMENT ON COLUMN tec.entertainmentdata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.entertainmentdata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.entertainmentdata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.entertainmentdata.filersort IS $$Filer name for sorting$$;
COMMENT ON COLUMN tec.entertainmentdata.duedt IS $$Report due date$$;
COMMENT ON COLUMN tec.entertainmentdata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.entertainmentdata.periodstartdt IS $$Beginning of period covered$$;
COMMENT ON COLUMN tec.entertainmentdata.periodenddt IS $$Ending of period covered$$;
COMMENT ON COLUMN tec.entertainmentdata.lobbyactivityid IS $$Lobby activity unique identifier$$;
COMMENT ON COLUMN tec.entertainmentdata.creditcardflag IS $$Credit card used$$;
COMMENT ON COLUMN tec.entertainmentdata.activitydate IS $$Activity Date$$;
COMMENT ON COLUMN tec.entertainmentdata.activityamountcd IS $$Activity amount range$$;
COMMENT ON COLUMN tec.entertainmentdata.activityexactamount IS $$Exact activity amount$$;
COMMENT ON COLUMN tec.entertainmentdata.activityamountrangelow IS $$Low end of activity amount range$$;
COMMENT ON COLUMN tec.entertainmentdata.activityamountrangehigh IS $$High end of activity amount range$$;
COMMENT ON COLUMN tec.entertainmentdata.recipientpersenttypecd IS $$Type of recipient name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.entertainmentdata.recipientnameorganization IS $$For ENTITY, the recipient organization name$$;
COMMENT ON COLUMN tec.entertainmentdata.recipientnamelast IS $$For INDIVIDUAL, the recipient last name$$;
COMMENT ON COLUMN tec.entertainmentdata.recipientnamesuffixcd IS $$For INDIVIDUAL, the recipient name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.entertainmentdata.recipientnamefirst IS $$For INDIVIDUAL, the recipient first name$$;
COMMENT ON COLUMN tec.entertainmentdata.recipientnameprefixcd IS $$For INDIVIDUAL, the recipient name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.entertainmentdata.recipientnameshort IS $$For INDIVIDUAL, the recipient short name (nickname)$$;
COMMENT ON COLUMN tec.entertainmentdata.entertainmentname IS $$Name of entertainment establishment$$;
COMMENT ON COLUMN tec.entertainmentdata.entertainmentstreetaddr1 IS $$Entertainment street address - line 1$$;
COMMENT ON COLUMN tec.entertainmentdata.entertainmentstreetaddr2 IS $$Entertainment street address - line 2$$;
COMMENT ON COLUMN tec.entertainmentdata.entertainmentstreetcity IS $$Entertainment street address - city$$;
COMMENT ON COLUMN tec.entertainmentdata.entertainmentstreetstatecd IS $$Entertainment street address - state code (e.g. TX, CA) - for    country=USA/UMI only$$;
COMMENT ON COLUMN tec.entertainmentdata.entertainmentstreetcountrycd IS $$Entertainment street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.entertainmentdata.entertainmentstreetpostalcode IS $$Entertainment street address - postal code - for USA addresses   only$$;
COMMENT ON COLUMN tec.entertainmentdata.entertainmentstreetregion IS $$Entertainment street address - region for country other than USA$$;
\COPY tec.entertainmentdata FROM 'data/TEC_LA_CSV/LaEnt.csv' WITH ( FORMAT CSV , HEADER true )