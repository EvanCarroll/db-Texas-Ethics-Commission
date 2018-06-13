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

\echo LOADING ExpendData



CREATE TABLE tec.expenddata (
	recordType                              text,
	formTypeCd                              text,
	schedFormTypeCd                         text,
	reportInfoIdent                         int,
	receivedDt                              date,
	infoOnlyFlag                            bool,
	filerIdent                              int,
	filerTypeCd                             text,
	filerName                               text,
	expendInfoId                            bigint              PRIMARY KEY,
	expendDt                                date,
	expendAmount                            numeric(10,2),
	expendDescr                             text,
	expendCatCd                             text,
	expendCatDescr                          text,
	itemizeFlag                             bool,
	travelFlag                              bool,
	politicalExpendCd                       text,
	reimburseIntendedFlag                   bool,
	srcCorpContribFlag                      bool,
	capitalLivingexpFlag                    char(1),
	payeePersentTypeCd                      text,
	payeeNameOrganization                   text,
	payeeNameLast                           text,
	payeeNameSuffixCd                       text,
	payeeNameFirst                          text,
	payeeNamePrefixCd                       text,
	payeeNameShort                          text,
	payeeStreetAddr1                        text,
	payeeStreetAddr2                        text,
	payeeStreetCity                         text,
	payeeStreetStateCd                      text,
	payeeStreetCountyCd                     text,
	payeeStreetCountryCd                    text,
	payeeStreetPostalCode                   text,
	payeeStreetRegion                       text,
	FOREIGN KEY (filerIdent, filerTypeCd) REFERENCES tec.FilerData
);

COMMENT ON TABLE tec.expenddata IS $$Expenditures - Schedules F/G/H/I - Expenditures from special pre-election (formerly Telegram) reports are stored in the file expn_t. They are kept separate from the expends file to avoid creating duplicates, because they are supposed to be re-reported on the next regular campaign finance report. Files: expend_##.csv, expn_t.csv$$;
COMMENT ON COLUMN tec.expenddata.recordtype IS $$Record type code - always EXPN$$;
COMMENT ON COLUMN tec.expenddata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.expenddata.schedformtypecd IS $$TEC Schedule Used$$;
COMMENT ON COLUMN tec.expenddata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.expenddata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.expenddata.infoonlyflag IS $$Superseded by other report$$;
COMMENT ON COLUMN tec.expenddata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.expenddata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.expenddata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.expenddata.expendinfoid IS $$Expenditure unique identifier$$;
COMMENT ON COLUMN tec.expenddata.expenddt IS $$Expenditure date$$;
COMMENT ON COLUMN tec.expenddata.expendamount IS $$Expenditure amount$$;
COMMENT ON COLUMN tec.expenddata.expenddescr IS $$Expenditure description$$;
COMMENT ON COLUMN tec.expenddata.expendcatcd IS $$Expenditure category code$$;
COMMENT ON COLUMN tec.expenddata.expendcatdescr IS $$Expenditure category description$$;
COMMENT ON COLUMN tec.expenddata.itemizeflag IS $$Y indicates that the expenditure is itemized$$;
COMMENT ON COLUMN tec.expenddata.travelflag IS $$Y indicates that the expenditure has associated travel$$;
COMMENT ON COLUMN tec.expenddata.politicalexpendcd IS $$Political expenditure indicator$$;
COMMENT ON COLUMN tec.expenddata.reimburseintendedflag IS $$Reimbursement intended indicator$$;
COMMENT ON COLUMN tec.expenddata.srccorpcontribflag IS $$Expenditure from corporate funds indicator$$;
COMMENT ON COLUMN tec.expenddata.capitallivingexpflag IS $$Austin living expense indicator$$;
COMMENT ON COLUMN tec.expenddata.payeepersenttypecd IS $$Type of payee name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.expenddata.payeenameorganization IS $$For ENTITY, the payee organization name$$;
COMMENT ON COLUMN tec.expenddata.payeenamelast IS $$For INDIVIDUAL, the payee last name$$;
COMMENT ON COLUMN tec.expenddata.payeenamesuffixcd IS $$For INDIVIDUAL, the payee name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.expenddata.payeenamefirst IS $$For INDIVIDUAL, the payee first name$$;
COMMENT ON COLUMN tec.expenddata.payeenameprefixcd IS $$For INDIVIDUAL, the payee name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.expenddata.payeenameshort IS $$For INDIVIDUAL, the payee short name (nickname)$$;
COMMENT ON COLUMN tec.expenddata.payeestreetaddr1 IS $$Payee street address - line 1$$;
COMMENT ON COLUMN tec.expenddata.payeestreetaddr2 IS $$Payee street address - line 2$$;
COMMENT ON COLUMN tec.expenddata.payeestreetcity IS $$Payee street address - city$$;
COMMENT ON COLUMN tec.expenddata.payeestreetstatecd IS $$Payee street address - state code (e.g. TX, CA) - for            country=USA/UMI only$$;
COMMENT ON COLUMN tec.expenddata.payeestreetcountycd IS $$Payee street address - Texas county$$;
COMMENT ON COLUMN tec.expenddata.payeestreetcountrycd IS $$Payee street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.expenddata.payeestreetpostalcode IS $$Payee street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.expenddata.payeestreetregion IS $$Payee street address - region for country other than USA$$;
\COPY tec.expenddata FROM 'data/TEC_CF_CSV/expn_t.csv' WITH ( FORMAT CSV , HEADER true )