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

\echo LOADING c_ContributionData


CREATE TABLE tec.c_ContributionData (
	recordType                              text,
	formTypeCd                              text,
	schedFormTypeCd                         text,
	reportInfoIdent                         int,
	receivedDt                              date,
	infoOnlyFlag                            bool,
	filerIdent                              int,
	filerTypeCd                             text,
	filerName                               text,
	contributionInfoId                      bigint,
	contributionDt                          date,
	contributionAmount                      numeric(12,2),
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
	contributorStreetCountryCd              char(3),
	contributorStreetPostalCode             text,
	contributorStreetRegion                 text,
	contributorEmployer                     text,
	contributorOccupation                   text,
	contributorJobTitle                     text,
	contributorPacFein                      text,
	contributorOosPacFlag                   bool,
	contributorLawFirmName                  text,
	contributorSpouseLawFirmName            text,
	contributorParent1LawFirmName           text,
	contributorParent2LawFirmName           text,
	PRIMARY KEY ( contributionInfoId )
);
COMMENT ON TABLE tec.c_ContributionData IS $$Contributions - Schedules A/C - Contributions from special session and special pre-election (formerly Telegram) reports are stored in the file cont_ss and cont_t. These records are kept separate from the contribs files to avoid creating duplicates, because they are supposed to be re-reported on the next regular campaign finance report. Files: contribs_##.csv, cont_ss.csv, cont_t.csv$$;
COMMENT ON COLUMN tec.c_contributiondata.recordtype IS $$Record type code - always RCPT$$;
COMMENT ON COLUMN tec.c_contributiondata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.c_contributiondata.schedformtypecd IS $$TEC Schedule Used$$;
COMMENT ON COLUMN tec.c_contributiondata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.c_contributiondata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.c_contributiondata.infoonlyflag IS $$Superseded by other report$$;
COMMENT ON COLUMN tec.c_contributiondata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.c_contributiondata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.c_contributiondata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.c_contributiondata.contributioninfoid IS $$Contribution unique identifier$$;
COMMENT ON COLUMN tec.c_contributiondata.contributiondt IS $$Contribution date$$;
COMMENT ON COLUMN tec.c_contributiondata.contributionamount IS $$Contribution amount$$;
COMMENT ON COLUMN tec.c_contributiondata.contributiondescr IS $$Contribution description$$;
COMMENT ON COLUMN tec.c_contributiondata.itemizeflag IS $$Y indicates that the contribution is itemized$$;
COMMENT ON COLUMN tec.c_contributiondata.travelflag IS $$Y indicates that the contribution has associated travel$$;
COMMENT ON COLUMN tec.c_contributiondata.contributorpersenttypecd IS $$Type of contributor name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.c_contributiondata.contributornameorganization IS $$For ENTITY, the contributor organization name$$;
COMMENT ON COLUMN tec.c_contributiondata.contributornamelast IS $$For INDIVIDUAL, the contributor last name$$;
COMMENT ON COLUMN tec.c_contributiondata.contributornamesuffixcd IS $$For INDIVIDUAL, the contributor name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.c_contributiondata.contributornamefirst IS $$For INDIVIDUAL, the contributor first name$$;
COMMENT ON COLUMN tec.c_contributiondata.contributornameprefixcd IS $$For INDIVIDUAL, the contributor name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.c_contributiondata.contributornameshort IS $$For INDIVIDUAL, the contributor short name (nickname)$$;
COMMENT ON COLUMN tec.c_contributiondata.contributorstreetcity IS $$Contributor street address - city$$;
COMMENT ON COLUMN tec.c_contributiondata.contributorstreetstatecd IS $$Contributor street address - state code (e.g. TX, CA) - for      country=USA/UMI only$$;
COMMENT ON COLUMN tec.c_contributiondata.contributorstreetcountycd IS $$Contributor street address - Texas county$$;
COMMENT ON COLUMN tec.c_contributiondata.contributorstreetcountrycd IS $$Contributor street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.c_contributiondata.contributorstreetpostalcode IS $$Contributor street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.c_contributiondata.contributorstreetregion IS $$Contributor street address - region for country other than USA$$;
COMMENT ON COLUMN tec.c_contributiondata.contributoremployer IS $$Contributor employer$$;
COMMENT ON COLUMN tec.c_contributiondata.contributoroccupation IS $$Contributor occupation$$;
COMMENT ON COLUMN tec.c_contributiondata.contributorjobtitle IS $$Contributor job title$$;
COMMENT ON COLUMN tec.c_contributiondata.contributorpacfein IS $$FEC ID of out-of-state PAC contributor$$;
COMMENT ON COLUMN tec.c_contributiondata.contributoroospacflag IS $$Indicates if contributor is an out-of-state PAC$$;
COMMENT ON COLUMN tec.c_contributiondata.contributorlawfirmname IS $$Contributor law firm name$$;
COMMENT ON COLUMN tec.c_contributiondata.contributorspouselawfirmname IS $$Contributor spouse law firm name$$;
COMMENT ON COLUMN tec.c_contributiondata.contributorparent1lawfirmname IS $$Contributor parent #1 law firm name$$;
COMMENT ON COLUMN tec.c_contributiondata.contributorparent2lawfirmname IS $$Contributor parent #2 law firm name$$;
\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_01.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_02.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_03.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_04.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_05.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_06.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_07.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_08.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_09.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_10.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_11.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_12.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_13.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_14.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_15.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_16.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_17.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_18.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_19.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_20.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_21.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_22.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_23.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_24.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_25.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_26.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_27.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_28.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_29.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_30.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_31.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_32.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_33.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_34.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_35.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_36.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_37.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_38.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_39.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_40.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_41.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_42.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_43.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_44.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_45.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_46.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_47.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_48.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_49.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_50.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_51.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_52.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_53.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_54.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_55.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_56.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_57.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_58.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_59.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_60.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_61.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_62.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_63.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_64.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_65.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_66.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_67.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_68.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_69.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_70.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_71.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_72.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_73.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_74.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_75.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_76.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_77.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_78.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_79.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_80.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_81.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_82.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_83.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_84.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/contribs_85.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/cont_ss.csv' WITH ( FORMAT CSV , HEADER true );

\COPY tec.c_ContributionData FROM 'data/TEC_CF_CSV/cont_t.csv' WITH ( FORMAT CSV , HEADER true );


CREATE INDEX ON tec.c_ContributionData (filerIdent, filerTypeCd);

ALTER TABLE tec.c_ContributionData
	ADD FOREIGN KEY (formTypeCd) REFERENCES tec.codes_forms NOT VALID,
	ADD FOREIGN KEY (reportInfoIdent) REFERENCES tec.c_CoverSheet1Data NOT VALID,
	ADD FOREIGN KEY (contributorStreetCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (contributorStreetCountryCd) REFERENCES tec.codes_country NOT VALID,
	ADD FOREIGN KEY (filerIdent, filerTypeCd) REFERENCES tec.c_FilerData NOT VALID;

CREATE INDEX ON tec.c_ContributionData (reportinfoident);

