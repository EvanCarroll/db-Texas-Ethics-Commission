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

\echo LOADING c_ExpendData


CREATE TABLE tec.c_ExpendData (
	recordType                              text,
	formTypeCd                              text,
	schedFormTypeCd                         text,
	reportInfoIdent                         int,
	receivedDt                              date,
	infoOnlyFlag                            bool,
	filerIdent                              int,
	filerTypeCd                             text,
	filerName                               text,
	expendInfoId                            bigint,
	expendDt                                date,
	expendAmount                            numeric(12,2),
	expendDescr                             text,
	expendCatCd                             text,
	expendCatDescr                          text,
	itemizeFlag                             bool,
	travelFlag                              bool,
	politicalExpendCd                       bool,
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
	payeeStreetCountryCd                    char(3),
	payeeStreetPostalCode                   text,
	payeeStreetRegion                       text,
	creditCardIssuer                        text,
	repaymentDt                             date,
	PRIMARY KEY ( expendInfoId )
);
COMMENT ON TABLE tec.c_ExpendData IS $$Expenditures - Schedules F/G/H/I - Expenditures from special pre-election (formerly Telegram) reports are stored in the file expn_t. They are kept separate from the expends file to avoid creating duplicates, because they are supposed to be re-reported on the next regular campaign finance report. Files: expend_##.csv, expn_t.csv$$;
COMMENT ON COLUMN tec.c_expenddata.recordtype IS $$Record type code - always EXPN$$;
COMMENT ON COLUMN tec.c_expenddata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.c_expenddata.schedformtypecd IS $$TEC Schedule Used$$;
COMMENT ON COLUMN tec.c_expenddata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.c_expenddata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.c_expenddata.infoonlyflag IS $$Superseded by other report$$;
COMMENT ON COLUMN tec.c_expenddata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.c_expenddata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.c_expenddata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.c_expenddata.expendinfoid IS $$Expenditure unique identifier$$;
COMMENT ON COLUMN tec.c_expenddata.expenddt IS $$Expenditure date$$;
COMMENT ON COLUMN tec.c_expenddata.expendamount IS $$Expenditure amount$$;
COMMENT ON COLUMN tec.c_expenddata.expenddescr IS $$Expenditure description$$;
COMMENT ON COLUMN tec.c_expenddata.expendcatcd IS $$Expenditure category code$$;
COMMENT ON COLUMN tec.c_expenddata.expendcatdescr IS $$Expenditure category description$$;
COMMENT ON COLUMN tec.c_expenddata.itemizeflag IS $$Y indicates that the expenditure is itemized$$;
COMMENT ON COLUMN tec.c_expenddata.travelflag IS $$Y indicates that the expenditure has associated travel$$;
COMMENT ON COLUMN tec.c_expenddata.politicalexpendcd IS $$Political expenditure indicator$$;
COMMENT ON COLUMN tec.c_expenddata.reimburseintendedflag IS $$Reimbursement intended indicator$$;
COMMENT ON COLUMN tec.c_expenddata.srccorpcontribflag IS $$Expenditure from corporate funds indicator$$;
COMMENT ON COLUMN tec.c_expenddata.capitallivingexpflag IS $$Austin living expense indicator$$;
COMMENT ON COLUMN tec.c_expenddata.payeepersenttypecd IS $$Type of payee name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.c_expenddata.payeenameorganization IS $$For ENTITY, the payee organization name$$;
COMMENT ON COLUMN tec.c_expenddata.payeenamelast IS $$For INDIVIDUAL, the payee last name$$;
COMMENT ON COLUMN tec.c_expenddata.payeenamesuffixcd IS $$For INDIVIDUAL, the payee name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.c_expenddata.payeenamefirst IS $$For INDIVIDUAL, the payee first name$$;
COMMENT ON COLUMN tec.c_expenddata.payeenameprefixcd IS $$For INDIVIDUAL, the payee name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.c_expenddata.payeenameshort IS $$For INDIVIDUAL, the payee short name (nickname)$$;
COMMENT ON COLUMN tec.c_expenddata.payeestreetaddr1 IS $$Payee street address - line 1$$;
COMMENT ON COLUMN tec.c_expenddata.payeestreetaddr2 IS $$Payee street address - line 2$$;
COMMENT ON COLUMN tec.c_expenddata.payeestreetcity IS $$Payee street address - city$$;
COMMENT ON COLUMN tec.c_expenddata.payeestreetstatecd IS $$Payee street address - state code (e.g. TX, CA) - for            country=USA/UMI only$$;
COMMENT ON COLUMN tec.c_expenddata.payeestreetcountycd IS $$Payee street address - Texas county$$;
COMMENT ON COLUMN tec.c_expenddata.payeestreetcountrycd IS $$Payee street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.c_expenddata.payeestreetpostalcode IS $$Payee street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.c_expenddata.payeestreetregion IS $$Payee street address - region for country other than USA$$;
COMMENT ON COLUMN tec.c_expenddata.creditcardissuer IS $$Financial institution issuing credit card$$;
COMMENT ON COLUMN tec.c_expenddata.repaymentdt IS $$Repayment date$$;
\COPY tec.c_ExpendData FROM 'data/TEC_CF_CSV/expend_01.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ExpendData FROM 'data/TEC_CF_CSV/expend_02.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ExpendData FROM 'data/TEC_CF_CSV/expend_03.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ExpendData FROM 'data/TEC_CF_CSV/expend_04.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ExpendData FROM 'data/TEC_CF_CSV/expend_05.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ExpendData FROM 'data/TEC_CF_CSV/expend_06.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ExpendData FROM 'data/TEC_CF_CSV/expend_07.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ExpendData FROM 'data/TEC_CF_CSV/expend_08.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ExpendData FROM 'data/TEC_CF_CSV/expend_09.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ExpendData FROM 'data/TEC_CF_CSV/expend_10.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ExpendData FROM 'data/TEC_CF_CSV/expend_11.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ExpendData FROM 'data/TEC_CF_CSV/expend_12.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ExpendData FROM 'data/TEC_CF_CSV/expend_13.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ExpendData FROM 'data/TEC_CF_CSV/expn_t.csv' WITH ( FORMAT CSV , HEADER true );


CREATE INDEX ON tec.c_ExpendData (filerIdent, filerTypeCd);

ALTER TABLE tec.c_ExpendData
	ADD FOREIGN KEY (formTypeCd) REFERENCES tec.codes_forms NOT VALID,
	ADD FOREIGN KEY (schedFormTypeCd) REFERENCES tec.codes_schedules NOT VALID,
	ADD FOREIGN KEY (reportInfoIdent) REFERENCES tec.c_CoverSheet1Data NOT VALID,
	ADD FOREIGN KEY (filerTypeCd) REFERENCES tec.codes_filertype NOT VALID,
	ADD FOREIGN KEY (expendCatCd) REFERENCES tec.c_expendcategory NOT VALID,
	ADD FOREIGN KEY (payeePersentTypeCd) REFERENCES tec.codes_persent_types NOT VALID,
	ADD FOREIGN KEY (payeeNameSuffixCd) REFERENCES tec.codes_name_suffixes NOT VALID,
	ADD FOREIGN KEY (payeeNamePrefixCd) REFERENCES tec.codes_name_prefixes NOT VALID,
	ADD FOREIGN KEY (payeeStreetStateCd) REFERENCES tec.codes_states NOT VALID,
	ADD FOREIGN KEY (payeeStreetCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (payeeStreetCountryCd) REFERENCES tec.codes_countries NOT VALID,
	ADD FOREIGN KEY (filerIdent, filerTypeCd) REFERENCES tec.c_FilerData NOT VALID;

CREATE INDEX ON tec.c_ExpendData (reportinfoident);

