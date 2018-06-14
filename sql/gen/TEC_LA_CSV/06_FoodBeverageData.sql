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

\echo LOADING FoodBeverageData



CREATE TABLE tec.foodbeveragedata (
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
	restaurantStreetRegion                  text
);

COMMENT ON TABLE tec.foodbeveragedata IS $$Form LA Schedule C - Food and Beverages. File: LaFood.csv$$;
COMMENT ON COLUMN tec.foodbeveragedata.recordtype IS $$Record type code - always FOOD$$;
COMMENT ON COLUMN tec.foodbeveragedata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.foodbeveragedata.reporttypecd IS $$Report type$$;
COMMENT ON COLUMN tec.foodbeveragedata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.foodbeveragedata.applicableyear IS $$Year applicable$$;
COMMENT ON COLUMN tec.foodbeveragedata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.foodbeveragedata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.foodbeveragedata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.foodbeveragedata.filersort IS $$Filer name for sorting$$;
COMMENT ON COLUMN tec.foodbeveragedata.duedt IS $$Report due date$$;
COMMENT ON COLUMN tec.foodbeveragedata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.foodbeveragedata.periodstartdt IS $$Beginning of period covered$$;
COMMENT ON COLUMN tec.foodbeveragedata.periodenddt IS $$Ending of period covered$$;
COMMENT ON COLUMN tec.foodbeveragedata.lobbyactivityid IS $$Lobby activity unique identifier$$;
COMMENT ON COLUMN tec.foodbeveragedata.creditcardflag IS $$Credit card used$$;
COMMENT ON COLUMN tec.foodbeveragedata.activitydate IS $$Activity Date$$;
COMMENT ON COLUMN tec.foodbeveragedata.activityamountcd IS $$Activity amount range$$;
COMMENT ON COLUMN tec.foodbeveragedata.activityexactamount IS $$Exact activity amount$$;
COMMENT ON COLUMN tec.foodbeveragedata.activityamountrangelow IS $$Low end of activity amount range$$;
COMMENT ON COLUMN tec.foodbeveragedata.activityamountrangehigh IS $$High end of activity amount range$$;
COMMENT ON COLUMN tec.foodbeveragedata.recipientpersenttypecd IS $$Type of recipient name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.foodbeveragedata.recipientnameorganization IS $$For ENTITY, the recipient organization name$$;
COMMENT ON COLUMN tec.foodbeveragedata.recipientnamelast IS $$For INDIVIDUAL, the recipient last name$$;
COMMENT ON COLUMN tec.foodbeveragedata.recipientnamesuffixcd IS $$For INDIVIDUAL, the recipient name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.foodbeveragedata.recipientnamefirst IS $$For INDIVIDUAL, the recipient first name$$;
COMMENT ON COLUMN tec.foodbeveragedata.recipientnameprefixcd IS $$For INDIVIDUAL, the recipient name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.foodbeveragedata.recipientnameshort IS $$For INDIVIDUAL, the recipient short name (nickname)$$;
COMMENT ON COLUMN tec.foodbeveragedata.restaurantname IS $$Name of restaurant establishment$$;
COMMENT ON COLUMN tec.foodbeveragedata.restaurantstreetcity IS $$Restaurant street address - city$$;
COMMENT ON COLUMN tec.foodbeveragedata.restaurantstreetstatecd IS $$Restaurant street address - state code (e.g. TX, CA) - for       country=USA/UMI only$$;
COMMENT ON COLUMN tec.foodbeveragedata.restaurantstreetcountrycd IS $$Restaurant street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.foodbeveragedata.restaurantstreetpostalcode IS $$Restaurant street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.foodbeveragedata.restaurantstreetregion IS $$Restaurant street address - region for country other than USA$$;
\COPY tec.foodbeveragedata FROM 'data/TEC_LA_CSV/LaFood.csv' WITH ( FORMAT CSV , HEADER true )
ALTER TABLE tec.FoodBeverageData
	ADD FOREIGN KEY (filerIdent, filerTypeCd)
	REFERENCES tec.FilerData
	NOT VALID