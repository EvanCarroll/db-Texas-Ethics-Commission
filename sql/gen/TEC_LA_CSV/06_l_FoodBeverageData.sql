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

\echo LOADING l_FoodBeverageData



CREATE TABLE tec.l_foodbeveragedata (
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
	restaurantName                          text,
	restaurantStreetCity                    text,
	restaurantStreetStateCd                 text,
	restaurantStreetCountryCd               text,
	restaurantStreetPostalCode              text,
	restaurantStreetRegion                  text,
	PRIMARY KEY (lobbyActivityId)
);

COMMENT ON TABLE tec.l_foodbeveragedata IS $$Form LA Schedule C - Food and Beverages. File: LaFood.csv$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.recordtype IS $$Record type code - always FOOD$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.reporttypecd IS $$Report type$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.applicableyear IS $$Year applicable$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.filersort IS $$Filer name for sorting$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.duedt IS $$Report due date$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.periodstartdt IS $$Beginning of period covered$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.periodenddt IS $$Ending of period covered$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.lobbyactivityid IS $$Lobby activity unique identifier$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.creditcardflag IS $$Credit card used$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.activitydate IS $$Activity Date$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.activityamountcd IS $$Activity amount range$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.activityexactamount IS $$Exact activity amount$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.activityamountrangelow IS $$Low end of activity amount range$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.activityamountrangehigh IS $$High end of activity amount range$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.recipientpersenttypecd IS $$Type of recipient name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.recipientnameorganization IS $$For ENTITY, the recipient organization name$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.recipientnamelast IS $$For INDIVIDUAL, the recipient last name$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.recipientnamesuffixcd IS $$For INDIVIDUAL, the recipient name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.recipientnamefirst IS $$For INDIVIDUAL, the recipient first name$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.recipientnameprefixcd IS $$For INDIVIDUAL, the recipient name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.recipientnameshort IS $$For INDIVIDUAL, the recipient short name (nickname)$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.restaurantname IS $$Name of restaurant establishment$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.restaurantstreetcity IS $$Restaurant street address - city$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.restaurantstreetstatecd IS $$Restaurant street address - state code (e.g. TX, CA) - for       country=USA/UMI only$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.restaurantstreetcountrycd IS $$Restaurant street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.restaurantstreetpostalcode IS $$Restaurant street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.l_foodbeveragedata.restaurantstreetregion IS $$Restaurant street address - region for country other than USA$$;
\COPY tec.l_foodbeveragedata FROM 'data/TEC_LA_CSV/LaFood.csv' WITH ( FORMAT CSV , HEADER true );

ALTER TABLE tec.l_foodbeveragedata
	ADD FOREIGN KEY (reportTypeCd) REFERENCES tec.codes_reports NOT VALID,
	ADD FOREIGN KEY (reportInfoIdent) REFERENCES tec.l_coversheetladata NOT VALID;