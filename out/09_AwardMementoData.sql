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

\echo LOADING AwardMementoData



CREATE TABLE tec.awardmementodata (
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
	lobbyActivityPeriodCd                   text,
	activityDescription                     text,
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
	recipientNameShort                      text
);

COMMENT ON TABLE tec.awardmementodata IS $$Form LA Schedule F - Awards / Mementos. File: LaAwrd.csv$$;
COMMENT ON COLUMN tec.awardmementodata.recordtype IS $$Record type code - always AWRD$$;
COMMENT ON COLUMN tec.awardmementodata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.awardmementodata.reporttypecd IS $$Report type$$;
COMMENT ON COLUMN tec.awardmementodata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.awardmementodata.applicableyear IS $$Year applicable$$;
COMMENT ON COLUMN tec.awardmementodata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.awardmementodata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.awardmementodata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.awardmementodata.filersort IS $$Filer name for sorting$$;
COMMENT ON COLUMN tec.awardmementodata.duedt IS $$Report due date$$;
COMMENT ON COLUMN tec.awardmementodata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.awardmementodata.periodstartdt IS $$Beginning of period covered$$;
COMMENT ON COLUMN tec.awardmementodata.periodenddt IS $$Ending of period covered$$;
COMMENT ON COLUMN tec.awardmementodata.lobbyactivityid IS $$Lobby activity unique identifier$$;
COMMENT ON COLUMN tec.awardmementodata.creditcardflag IS $$Credit card used$$;
COMMENT ON COLUMN tec.awardmementodata.lobbyactivityperiodcd IS $$Lobby activity period$$;
COMMENT ON COLUMN tec.awardmementodata.activitydescription IS $$Activity description$$;
COMMENT ON COLUMN tec.awardmementodata.activityamountcd IS $$Activity amount range$$;
COMMENT ON COLUMN tec.awardmementodata.activityexactamount IS $$Exact activity amount$$;
COMMENT ON COLUMN tec.awardmementodata.activityamountrangelow IS $$Low end of activity amount range$$;
COMMENT ON COLUMN tec.awardmementodata.activityamountrangehigh IS $$High end of activity amount range$$;
COMMENT ON COLUMN tec.awardmementodata.recipientpersenttypecd IS $$Type of recipient name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.awardmementodata.recipientnameorganization IS $$For ENTITY, the recipient organization name$$;
COMMENT ON COLUMN tec.awardmementodata.recipientnamelast IS $$For INDIVIDUAL, the recipient last name$$;
COMMENT ON COLUMN tec.awardmementodata.recipientnamesuffixcd IS $$For INDIVIDUAL, the recipient name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.awardmementodata.recipientnamefirst IS $$For INDIVIDUAL, the recipient first name$$;
COMMENT ON COLUMN tec.awardmementodata.recipientnameprefixcd IS $$For INDIVIDUAL, the recipient name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.awardmementodata.recipientnameshort IS $$For INDIVIDUAL, the recipient short name (nickname)$$;
\COPY tec.awardmementodata FROM 'data/TEC_LA_CSV/LaAwrd.csv' WITH ( FORMAT CSV , HEADER true )