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

\echo LOADING ContributionData



CREATE TABLE tec.contributiondata (
	recordType                              text,
	formTypeCd                              text,
	schedFormTypeCd                         text,
	reportInfoIdent                         int,
	receivedDt                              date,
	infoOnlyFlag                            bool,
	filerIdent                              int,
	filerTypeCd                             text,
	filerName                               text,
	contributionInfoId                      bigint              PRIMARY KEY,
	contributionDt                          date,
	contributionAmount                      numeric(10,2),
	contributionDescr                       text,
	itemizeFlag                             bool,
	travelFlag                              bool,
	contributorPersentTypeCd                text,
	contributorNameOrganization             text,
	contributorNameLast                     text,
	contributorNameSuffixCd                 text,
	contributorNameFirst                    text,
	contributorNamePrefixCd                 text,
	contributorNameShort                    text,
	contributorStreetCity                   text,
	contributorStreetStateCd                text,
	contributorStreetCountyCd               text,
	contributorStreetCountryCd              text,
	contributorStreetPostalCode             text,
	contributorStreetRegion                 text,
	contributorEmployer                     text,
	contributorOccupation                   text,
	contributorJobTitle                     text,
	contributorPacFein                      text,
	contributorOosPacFlag                   bool,
	contributorSpouseLawFirmName            text,
	contributorParent1LawFirmName           text,
	contributorParent2LawFirmName           text,
	FOREIGN KEY (filerIdent, filerTypeCd) REFERENCES tec.FilerData
);

COMMENT ON TABLE tec.contributiondata IS $$Contributions - Schedules A/C - Contributions from special session and special pre-election (formerly Telegram) reports are stored in the file cont_ss and cont_t. These records are kept separate from the contribs files to avoid creating duplicates, because they are supposed to be re-reported on the next regular campaign finance report. Files: contribs_##.csv, cont_ss.csv, cont_t.csv$$;
COMMENT ON COLUMN tec.contributiondata.recordtype IS $$Record type code - always RCPT$$;
COMMENT ON COLUMN tec.contributiondata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.contributiondata.schedformtypecd IS $$TEC Schedule Used$$;
COMMENT ON COLUMN tec.contributiondata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.contributiondata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.contributiondata.infoonlyflag IS $$Superseded by other report$$;
COMMENT ON COLUMN tec.contributiondata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.contributiondata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.contributiondata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.contributiondata.contributioninfoid IS $$Contribution unique identifier$$;
COMMENT ON COLUMN tec.contributiondata.contributiondt IS $$Contribution date$$;
COMMENT ON COLUMN tec.contributiondata.contributionamount IS $$Contribution amount$$;
COMMENT ON COLUMN tec.contributiondata.contributiondescr IS $$Contribution description$$;
COMMENT ON COLUMN tec.contributiondata.itemizeflag IS $$Y indicates that the contribution is itemized$$;
COMMENT ON COLUMN tec.contributiondata.travelflag IS $$Y indicates that the contribution has associated travel$$;
COMMENT ON COLUMN tec.contributiondata.contributorpersenttypecd IS $$Type of contributor name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.contributiondata.contributornameorganization IS $$For ENTITY, the contributor organization name$$;
COMMENT ON COLUMN tec.contributiondata.contributornamelast IS $$For INDIVIDUAL, the contributor last name$$;
COMMENT ON COLUMN tec.contributiondata.contributornamesuffixcd IS $$For INDIVIDUAL, the contributor name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.contributiondata.contributornamefirst IS $$For INDIVIDUAL, the contributor first name$$;
COMMENT ON COLUMN tec.contributiondata.contributornameprefixcd IS $$For INDIVIDUAL, the contributor name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.contributiondata.contributornameshort IS $$For INDIVIDUAL, the contributor short name (nickname)$$;
COMMENT ON COLUMN tec.contributiondata.contributorstreetcity IS $$Contributor street address - city$$;
COMMENT ON COLUMN tec.contributiondata.contributorstreetstatecd IS $$Contributor street address - state code (e.g. TX, CA) - for      country=USA/UMI only$$;
COMMENT ON COLUMN tec.contributiondata.contributorstreetcountycd IS $$Contributor street address - Texas county$$;
COMMENT ON COLUMN tec.contributiondata.contributorstreetcountrycd IS $$Contributor street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.contributiondata.contributorstreetpostalcode IS $$Contributor street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.contributiondata.contributorstreetregion IS $$Contributor street address - region for country other than USA$$;
COMMENT ON COLUMN tec.contributiondata.contributoremployer IS $$Contributor employer$$;
COMMENT ON COLUMN tec.contributiondata.contributoroccupation IS $$Contributor occupation$$;
COMMENT ON COLUMN tec.contributiondata.contributorjobtitle IS $$Contributor job title$$;
COMMENT ON COLUMN tec.contributiondata.contributorpacfein IS $$FEC ID of out-of-state PAC contributor$$;
COMMENT ON COLUMN tec.contributiondata.contributoroospacflag IS $$Indicates if contributor is an out-of-state PAC$$;
COMMENT ON COLUMN tec.contributiondata.contributorspouselawfirmname IS $$Contributor spouse law firm name$$;
COMMENT ON COLUMN tec.contributiondata.contributorparent1lawfirmname IS $$Contributor parent #1 law firm name$$;
COMMENT ON COLUMN tec.contributiondata.contributorparent2lawfirmname IS $$Contributor parent #2 law firm name$$;
\COPY tec.contributiondata FROM 'data/TEC_CF_CSV/cont_ss.csv' WITH ( FORMAT CSV , HEADER true )

\COPY tec.contributiondata FROM 'data/TEC_CF_CSV/cont_t.csv' WITH ( FORMAT CSV , HEADER true )