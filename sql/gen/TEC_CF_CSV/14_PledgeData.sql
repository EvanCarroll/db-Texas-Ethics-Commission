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

\echo LOADING PledgeData



CREATE TABLE tec.pledgedata (
	recordType                              text,
	formTypeCd                              text,
	schedFormTypeCd                         text,
	reportInfoIdent                         int,
	receivedDt                              date,
	infoOnlyFlag                            bool,
	filerIdent                              int,
	filerTypeCd                             text,
	filerName                               text,
	pledgeInfoId                            bigint              PRIMARY KEY,
	pledgeDt                                date,
	pledgeAmount                            numeric(10,2),
	pledgeDescr                             text,
	itemizeFlag                             bool,
	travelFlag                              bool,
	pledgerPersentTypeCd                    text,
	pledgerNameOrganization                 text,
	pledgerNameLast                         text,
	pledgerNameSuffixCd                     text,
	pledgerNameFirst                        text,
	pledgerNamePrefixCd                     text,
	pledgerNameShort                        text,
	pledgerStreetCity                       text,
	pledgerStreetStateCd                    text,
	pledgerStreetCountyCd                   text,
	pledgerStreetCountryCd                  text,
	pledgerStreetPostalCode                 text,
	pledgerStreetRegion                     text,
	pledgerEmployer                         text,
	pledgerOccupation                       text,
	pledgerJobTitle                         text,
	pledgerPacFein                          text,
	pledgerOosPacFlag                       bool,
	pledgerSpouseLawFirmName                text,
	pledgerParent1LawFirmName               text,
	pledgerParent2LawFirmName               text,
	FOREIGN KEY (filerIdent, filerTypeCd) REFERENCES tec.FilerData
);

COMMENT ON TABLE tec.pledgedata IS $$Pledges - Schedule B - Pledges from special session and special pre-election (formerly Telegram) reports are stored in the file pldg_ss and pldg_t. These records are kept separate from the pledges files to avoid creating duplicates, because they are supposed to be re-reported on the next regular campaign finance report. Files: pledges.csv, pldg_ss.csv, pldg_t.csv$$;
COMMENT ON COLUMN tec.pledgedata.recordtype IS $$Record type code - always PLDG$$;
COMMENT ON COLUMN tec.pledgedata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.pledgedata.schedformtypecd IS $$TEC Schedule Used$$;
COMMENT ON COLUMN tec.pledgedata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.pledgedata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.pledgedata.infoonlyflag IS $$Superseded by other report$$;
COMMENT ON COLUMN tec.pledgedata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.pledgedata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.pledgedata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.pledgedata.pledgeinfoid IS $$Pledge unique identifier$$;
COMMENT ON COLUMN tec.pledgedata.pledgedt IS $$Pledge data$$;
COMMENT ON COLUMN tec.pledgedata.pledgeamount IS $$Pledge amount$$;
COMMENT ON COLUMN tec.pledgedata.pledgedescr IS $$Pledge description$$;
COMMENT ON COLUMN tec.pledgedata.itemizeflag IS $$Y indicates that the pledge is itemized$$;
COMMENT ON COLUMN tec.pledgedata.travelflag IS $$Y indicates that the pledge has associated travel$$;
COMMENT ON COLUMN tec.pledgedata.pledgerpersenttypecd IS $$Type of pledger name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.pledgedata.pledgernameorganization IS $$For ENTITY, the pledger organization name$$;
COMMENT ON COLUMN tec.pledgedata.pledgernamelast IS $$For INDIVIDUAL, the pledger last name$$;
COMMENT ON COLUMN tec.pledgedata.pledgernamesuffixcd IS $$For INDIVIDUAL, the pledger name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.pledgedata.pledgernamefirst IS $$For INDIVIDUAL, the pledger first name$$;
COMMENT ON COLUMN tec.pledgedata.pledgernameprefixcd IS $$For INDIVIDUAL, the pledger name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.pledgedata.pledgernameshort IS $$For INDIVIDUAL, the pledger short name (nickname)$$;
COMMENT ON COLUMN tec.pledgedata.pledgerstreetcity IS $$Pledger street address - city$$;
COMMENT ON COLUMN tec.pledgedata.pledgerstreetstatecd IS $$Pledger street address - state code (e.g. TX, CA) - for          country=USA/UMI only$$;
COMMENT ON COLUMN tec.pledgedata.pledgerstreetcountycd IS $$Pledger street address - Texas county$$;
COMMENT ON COLUMN tec.pledgedata.pledgerstreetcountrycd IS $$Pledger street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.pledgedata.pledgerstreetpostalcode IS $$Pledger street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.pledgedata.pledgerstreetregion IS $$Pledger street address - region for country other than USA$$;
COMMENT ON COLUMN tec.pledgedata.pledgeremployer IS $$Pledger employer$$;
COMMENT ON COLUMN tec.pledgedata.pledgeroccupation IS $$Pledger occupation$$;
COMMENT ON COLUMN tec.pledgedata.pledgerjobtitle IS $$Pledger job title$$;
COMMENT ON COLUMN tec.pledgedata.pledgerpacfein IS $$For PAC pledger the FEIN$$;
COMMENT ON COLUMN tec.pledgedata.pledgeroospacflag IS $$Indicates if pledger is an out-of-state PAC$$;
COMMENT ON COLUMN tec.pledgedata.pledgerspouselawfirmname IS $$Pledger spouse law firm name$$;
COMMENT ON COLUMN tec.pledgedata.pledgerparent1lawfirmname IS $$Pledger parent #1 law firm name$$;
COMMENT ON COLUMN tec.pledgedata.pledgerparent2lawfirmname IS $$Pledger parent #2 law firm name$$;
\COPY tec.pledgedata FROM 'data/TEC_CF_CSV/pledges.csv' WITH ( FORMAT CSV , HEADER true )

\COPY tec.pledgedata FROM 'data/TEC_CF_CSV/pldg_ss.csv' WITH ( FORMAT CSV , HEADER true )

\COPY tec.pledgedata FROM 'data/TEC_CF_CSV/pldg_t.csv' WITH ( FORMAT CSV , HEADER true )