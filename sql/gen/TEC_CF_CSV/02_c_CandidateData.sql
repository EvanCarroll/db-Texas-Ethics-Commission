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

\echo LOADING c_CandidateData


CREATE TABLE tec.c_CandidateData (
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
	expendPersentId                         bigint,
	expendDt                                date,
	expendAmount                            numeric(12,2),
	expendDescr                             text,
	expendCatCd                             text,
	expendCatDescr                          text,
	itemizeFlag                             bool,
	politicalExpendCd                       bool,
	reimburseIntendedFlag                   bool,
	srcCorpContribFlag                      bool,
	capitalLivingexpFlag                    char(1),
	candidatePersentTypeCd                  text,
	candidateNameOrganization               text,
	candidateNameLast                       text,
	candidateNameSuffixCd                   text,
	candidateNameFirst                      text,
	candidateNamePrefixCd                   text,
	candidateNameShort                      text,
	candidateHoldOfficeCd                   text,
	candidateHoldOfficeDistrict             text,
	candidateHoldOfficePlace                text,
	candidateHoldOfficeDescr                text,
	candidateHoldOfficeCountyCd             text,
	candidateHoldOfficeCountyDescr          text,
	candidateSeekOfficeCd                   text,
	candidateSeekOfficeDistrict             text,
	candidateSeekOfficePlace                text,
	candidateSeekOfficeDescr                text,
	candidateSeekOfficeCountyCd             text,
	candidateSeekOfficeCountyDescr          text,
	PRIMARY KEY (expendPersentId)
);
COMMENT ON TABLE tec.c_CandidateData IS $$Candidate benefiting from a direct campaign expenditure. A direct campaign expenditure to benefit a candidate is not a political contribution to that candidate. Instead, a direct campaign expenditure is a campaign expenditure made on someone else's behalf and without the prior consent or approval of that person. A given EXPN record can have zero or more related CAND records. Any CAND records are written to the file immediately after their related EXPN record. File: cand.csv$$;
COMMENT ON COLUMN tec.c_candidatedata.recordtype IS $$Record type code - always CAND$$;
COMMENT ON COLUMN tec.c_candidatedata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.c_candidatedata.schedformtypecd IS $$TEC Schedule Used$$;
COMMENT ON COLUMN tec.c_candidatedata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.c_candidatedata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.c_candidatedata.infoonlyflag IS $$Superseded by other report$$;
COMMENT ON COLUMN tec.c_candidatedata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.c_candidatedata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.c_candidatedata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.c_candidatedata.expendinfoid IS $$Expenditure unique identifier$$;
COMMENT ON COLUMN tec.c_candidatedata.expendpersentid IS $$Candidate unique identifier$$;
COMMENT ON COLUMN tec.c_candidatedata.expenddt IS $$Expenditure date$$;
COMMENT ON COLUMN tec.c_candidatedata.expendamount IS $$Expenditure amount$$;
COMMENT ON COLUMN tec.c_candidatedata.expenddescr IS $$Expenditure description$$;
COMMENT ON COLUMN tec.c_candidatedata.expendcatcd IS $$Expenditure category code$$;
COMMENT ON COLUMN tec.c_candidatedata.expendcatdescr IS $$Expenditure category description$$;
COMMENT ON COLUMN tec.c_candidatedata.itemizeflag IS $$Y indicates that the expenditure is itemized$$;
COMMENT ON COLUMN tec.c_candidatedata.politicalexpendcd IS $$Political expenditure indicator$$;
COMMENT ON COLUMN tec.c_candidatedata.reimburseintendedflag IS $$Reimbursement intended indicator$$;
COMMENT ON COLUMN tec.c_candidatedata.srccorpcontribflag IS $$Expenditure from corporate funds indicator$$;
COMMENT ON COLUMN tec.c_candidatedata.capitallivingexpflag IS $$Austin living expense indicator$$;
COMMENT ON COLUMN tec.c_candidatedata.candidatepersenttypecd IS $$Type of candidate name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.c_candidatedata.candidatenameorganization IS $$For ENTITY, the candidate organization name$$;
COMMENT ON COLUMN tec.c_candidatedata.candidatenamelast IS $$For INDIVIDUAL, the candidate last name$$;
COMMENT ON COLUMN tec.c_candidatedata.candidatenamesuffixcd IS $$For INDIVIDUAL, the candidate name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.c_candidatedata.candidatenamefirst IS $$For INDIVIDUAL, the candidate first name$$;
COMMENT ON COLUMN tec.c_candidatedata.candidatenameprefixcd IS $$For INDIVIDUAL, the candidate name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.c_candidatedata.candidatenameshort IS $$For INDIVIDUAL, the candidate short name (nickname)$$;
COMMENT ON COLUMN tec.c_candidatedata.candidateholdofficecd IS $$Candidate office held$$;
COMMENT ON COLUMN tec.c_candidatedata.candidateholdofficedistrict IS $$Candidate office held district$$;
COMMENT ON COLUMN tec.c_candidatedata.candidateholdofficeplace IS $$Candidate office held place$$;
COMMENT ON COLUMN tec.c_candidatedata.candidateholdofficedescr IS $$Candidate office held description$$;
COMMENT ON COLUMN tec.c_candidatedata.candidateholdofficecountycd IS $$Candidate office held country code$$;
COMMENT ON COLUMN tec.c_candidatedata.candidateholdofficecountydescr IS $$Candidate office help county description$$;
COMMENT ON COLUMN tec.c_candidatedata.candidateseekofficecd IS $$Candidate office sought$$;
COMMENT ON COLUMN tec.c_candidatedata.candidateseekofficedistrict IS $$Candidate office sought district$$;
COMMENT ON COLUMN tec.c_candidatedata.candidateseekofficeplace IS $$Candidate office sought place$$;
COMMENT ON COLUMN tec.c_candidatedata.candidateseekofficedescr IS $$Candidate office sought description$$;
COMMENT ON COLUMN tec.c_candidatedata.candidateseekofficecountycd IS $$Candidate office sought county code$$;
COMMENT ON COLUMN tec.c_candidatedata.candidateseekofficecountydescr IS $$Candidate office sought county description$$;
\COPY tec.c_CandidateData FROM 'data/TEC_CF_CSV/cand.csv' WITH ( FORMAT CSV , HEADER true );


CREATE INDEX ON tec.c_CandidateData (filerIdent, filerTypeCd);

ALTER TABLE tec.c_CandidateData
	ADD FOREIGN KEY (formTypeCd) REFERENCES tec.codes_forms NOT VALID,
	ADD FOREIGN KEY (schedFormTypeCd) REFERENCES tec.codes_schedules NOT VALID,
	ADD FOREIGN KEY (reportInfoIdent) REFERENCES tec.c_CoverSheet1Data NOT VALID,
	ADD FOREIGN KEY (filerTypeCd) REFERENCES tec.codes_filertype NOT VALID,
	ADD FOREIGN KEY (expendCatCd) REFERENCES tec.c_expendcategory NOT VALID,
	ADD FOREIGN KEY (candidatePersentTypeCd) REFERENCES tec.codes_persent_types NOT VALID,
	ADD FOREIGN KEY (candidateNameSuffixCd) REFERENCES tec.codes_name_suffixes NOT VALID,
	ADD FOREIGN KEY (candidateNamePrefixCd) REFERENCES tec.codes_name_prefixes NOT VALID,
	ADD FOREIGN KEY (candidateHoldOfficeCd) REFERENCES tec.codes_offices NOT VALID,
	ADD FOREIGN KEY (candidateHoldOfficeCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (candidateSeekOfficeCd) REFERENCES tec.codes_offices NOT VALID,
	ADD FOREIGN KEY (candidateSeekOfficeCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (filerIdent, filerTypeCd) REFERENCES tec.c_FilerData NOT VALID;

CREATE INDEX ON tec.c_CandidateData (reportinfoident);

