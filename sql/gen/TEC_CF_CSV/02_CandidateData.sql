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

\echo LOADING CandidateData



CREATE TABLE tec.candidatedata (
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
	expendAmount                            numeric(10,2),
	expendDescr                             text,
	expendCatCd                             text,
	expendCatDescr                          text,
	itemizeFlag                             bool,
	politicalExpendCd                       text,
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
	candidateSeekOfficeCountyDescr          text
);

COMMENT ON TABLE tec.candidatedata IS $$Candidate benefiting from a direct campaign expenditure. A direct campaign expenditure to benefit a candidate is not a political contribution to that candidate. Instead, a direct campaign expenditure is a campaign expenditure made on someone else's behalf and without the prior consent or approval of that person. A given EXPN record can have zero or more related CAND records. Any CAND records are written to the file immediately after their related EXPN record. File: cand.csv$$;
COMMENT ON COLUMN tec.candidatedata.recordtype IS $$Record type code - always CAND$$;
COMMENT ON COLUMN tec.candidatedata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.candidatedata.schedformtypecd IS $$TEC Schedule Used$$;
COMMENT ON COLUMN tec.candidatedata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.candidatedata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.candidatedata.infoonlyflag IS $$Superseded by other report$$;
COMMENT ON COLUMN tec.candidatedata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.candidatedata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.candidatedata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.candidatedata.expendinfoid IS $$Expenditure unique identifier$$;
COMMENT ON COLUMN tec.candidatedata.expendpersentid IS $$Candidate unique identifier$$;
COMMENT ON COLUMN tec.candidatedata.expenddt IS $$Expenditure date$$;
COMMENT ON COLUMN tec.candidatedata.expendamount IS $$Expenditure amount$$;
COMMENT ON COLUMN tec.candidatedata.expenddescr IS $$Expenditure description$$;
COMMENT ON COLUMN tec.candidatedata.expendcatcd IS $$Expenditure category code$$;
COMMENT ON COLUMN tec.candidatedata.expendcatdescr IS $$Expenditure category description$$;
COMMENT ON COLUMN tec.candidatedata.itemizeflag IS $$Y indicates that the expenditure is itemized$$;
COMMENT ON COLUMN tec.candidatedata.politicalexpendcd IS $$Political expenditure indicator$$;
COMMENT ON COLUMN tec.candidatedata.reimburseintendedflag IS $$Reimbursement intended indicator$$;
COMMENT ON COLUMN tec.candidatedata.srccorpcontribflag IS $$Expenditure from corporate funds indicator$$;
COMMENT ON COLUMN tec.candidatedata.capitallivingexpflag IS $$Austin living expense indicator$$;
COMMENT ON COLUMN tec.candidatedata.candidatepersenttypecd IS $$Type of candidate name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.candidatedata.candidatenameorganization IS $$For ENTITY, the candidate organization name$$;
COMMENT ON COLUMN tec.candidatedata.candidatenamelast IS $$For INDIVIDUAL, the candidate last name$$;
COMMENT ON COLUMN tec.candidatedata.candidatenamesuffixcd IS $$For INDIVIDUAL, the candidate name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.candidatedata.candidatenamefirst IS $$For INDIVIDUAL, the candidate first name$$;
COMMENT ON COLUMN tec.candidatedata.candidatenameprefixcd IS $$For INDIVIDUAL, the candidate name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.candidatedata.candidatenameshort IS $$For INDIVIDUAL, the candidate short name (nickname)$$;
COMMENT ON COLUMN tec.candidatedata.candidateholdofficecd IS $$Candidate office held$$;
COMMENT ON COLUMN tec.candidatedata.candidateholdofficedistrict IS $$Candidate office held district$$;
COMMENT ON COLUMN tec.candidatedata.candidateholdofficeplace IS $$Candidate office held place$$;
COMMENT ON COLUMN tec.candidatedata.candidateholdofficedescr IS $$Candidate office held description$$;
COMMENT ON COLUMN tec.candidatedata.candidateholdofficecountycd IS $$Candidate office held country code$$;
COMMENT ON COLUMN tec.candidatedata.candidateholdofficecountydescr IS $$Candidate office help county description$$;
COMMENT ON COLUMN tec.candidatedata.candidateseekofficecd IS $$Candidate office sought$$;
COMMENT ON COLUMN tec.candidatedata.candidateseekofficedistrict IS $$Candidate office sought district$$;
COMMENT ON COLUMN tec.candidatedata.candidateseekofficeplace IS $$Candidate office sought place$$;
COMMENT ON COLUMN tec.candidatedata.candidateseekofficedescr IS $$Candidate office sought description$$;
COMMENT ON COLUMN tec.candidatedata.candidateseekofficecountycd IS $$Candidate office sought county code$$;
COMMENT ON COLUMN tec.candidatedata.candidateseekofficecountydescr IS $$Candidate office sought county description$$;
\COPY tec.candidatedata FROM 'data/TEC_CF_CSV/cand.csv' WITH ( FORMAT CSV , HEADER true )