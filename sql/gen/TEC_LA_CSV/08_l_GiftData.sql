-- Schema generation for the Texas Ethics Commission
-- Copyright (C) 2024  Evan Carroll
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

\echo LOADING l_GiftData


CREATE TABLE tec.l_GiftData (
	recordType                              text,
	formTypeCd                              text,
	reportTypeCd                            text,
	reportInfoIdent                         int,
	applicableYear                          smallint,
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
	activityExactAmount                     numeric(12,2),
	activityAmountRangeLow                  numeric(12,2),
	activityAmountRangeHigh                 numeric(12,2),
	recipientPersentTypeCd                  text,
	recipientNameOrganization               text,
	recipientNameLast                       text,
	recipientNameSuffixCd                   text,
	recipientNameFirst                      text,
	recipientNamePrefixCd                   text,
	recipientNameShort                      text,
	PRIMARY KEY (lobbyActivityId)
);
COMMENT ON TABLE tec.l_GiftData IS $$Form LA Schedule E - Gifts. File: LaGift.csv$$;
COMMENT ON COLUMN tec.l_giftdata.recordtype IS $$Record type code - always GIFT$$;
COMMENT ON COLUMN tec.l_giftdata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.l_giftdata.reporttypecd IS $$Report type$$;
COMMENT ON COLUMN tec.l_giftdata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.l_giftdata.applicableyear IS $$Year applicable$$;
COMMENT ON COLUMN tec.l_giftdata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.l_giftdata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.l_giftdata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.l_giftdata.filersort IS $$Filer name for sorting$$;
COMMENT ON COLUMN tec.l_giftdata.duedt IS $$Report due date$$;
COMMENT ON COLUMN tec.l_giftdata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.l_giftdata.periodstartdt IS $$Beginning of period covered$$;
COMMENT ON COLUMN tec.l_giftdata.periodenddt IS $$Ending of period covered$$;
COMMENT ON COLUMN tec.l_giftdata.lobbyactivityid IS $$Lobby activity unique identifier$$;
COMMENT ON COLUMN tec.l_giftdata.creditcardflag IS $$Credit card used$$;
COMMENT ON COLUMN tec.l_giftdata.lobbyactivityperiodcd IS $$Lobby activity period$$;
COMMENT ON COLUMN tec.l_giftdata.activitydescription IS $$Activity description$$;
COMMENT ON COLUMN tec.l_giftdata.activityamountcd IS $$Activity amount range$$;
COMMENT ON COLUMN tec.l_giftdata.activityexactamount IS $$Exact activity amount$$;
COMMENT ON COLUMN tec.l_giftdata.activityamountrangelow IS $$Low end of activity amount range$$;
COMMENT ON COLUMN tec.l_giftdata.activityamountrangehigh IS $$High end of activity amount range$$;
COMMENT ON COLUMN tec.l_giftdata.recipientpersenttypecd IS $$Type of recipient name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.l_giftdata.recipientnameorganization IS $$For ENTITY, the recipient organization name$$;
COMMENT ON COLUMN tec.l_giftdata.recipientnamelast IS $$For INDIVIDUAL, the recipient last name$$;
COMMENT ON COLUMN tec.l_giftdata.recipientnamesuffixcd IS $$For INDIVIDUAL, the recipient name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.l_giftdata.recipientnamefirst IS $$For INDIVIDUAL, the recipient first name$$;
COMMENT ON COLUMN tec.l_giftdata.recipientnameprefixcd IS $$For INDIVIDUAL, the recipient name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.l_giftdata.recipientnameshort IS $$For INDIVIDUAL, the recipient short name (nickname)$$;
\COPY tec.l_GiftData FROM 'data/TEC_LA_CSV/LaGift.csv' WITH ( FORMAT CSV , HEADER true );


ALTER TABLE tec.l_GiftData
	ADD FOREIGN KEY (formTypeCd) REFERENCES tec.codes_forms NOT VALID,
	ADD FOREIGN KEY (reportTypeCd) REFERENCES tec.codes_reports NOT VALID,
	ADD FOREIGN KEY (reportInfoIdent) REFERENCES tec.l_CoverSheetLaData NOT VALID,
	ADD FOREIGN KEY (filerTypeCd) REFERENCES tec.codes_filertype NOT VALID,
	ADD FOREIGN KEY (recipientNameSuffixCd) REFERENCES tec.codes_name_suffixes NOT VALID,
	ADD FOREIGN KEY (recipientNamePrefixCd) REFERENCES tec.codes_name_prefixes NOT VALID;

CREATE INDEX ON tec.l_GiftData (reportinfoident);

