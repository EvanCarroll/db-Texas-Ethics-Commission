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

\echo LOADING SpacData



CREATE TABLE tec.spacdata (
	recordType                              text,
	spacFilerIdent                          int,
	spacFilerTypeCd                         text,
	spacFilerName                           text,
	spacFilerNameShort                      text,
	spacCommitteeStatusCd                   text,
	spactreasEffStartDt                     date,
	spactreasEffStopDt                      date,
	spacPositionCd                          text,
	candidateFilerIdent                     int,
	candidateFilerTypeCd                    text,
	candidateFilerName                      text,
	candidateFilerpersStatusCd              text,
	candidateEffStartDt                     date,
	candidateEffStopDt                      date,
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
	ctaSeekOfficeCd                         text,
	ctaSeekOfficeDistrict                   text,
	ctaSeekOfficePlace                      text,
	ctaSeekOfficeDescr                      text,
	ctaSeekOfficeCountyCd                   text,
	ctaSeekOfficeCountyDescr                text,
	candtreasFilerpersStatusCd              text,
	candtreasEffStartDt                     date,
	candtreasEffStopDt                      date
);

COMMENT ON TABLE tec.spacdata IS $$Index of Specific-purpose committees. This file contains links between specific-purpose committees (FILER_TYPE = SPAC, JSPC and SCPC) and the candidates/office holders they support, oppose or assist. The information is entered by TEC staff from the paper Form STA (treasurer appointment for a speficic- purpose committee) and amendments thereto (Form ASTA). TEC staff does not enter links based on information from campaign finance reports. The links are not broken when the STA is terminated. File: spacs.csv$$;
COMMENT ON COLUMN tec.spacdata.recordtype IS $$Record type code - always SPAC$$;
COMMENT ON COLUMN tec.spacdata.spacfilerident IS $$SPAC filer account #$$;
COMMENT ON COLUMN tec.spacdata.spacfilertypecd IS $$SPAC type of filer$$;
COMMENT ON COLUMN tec.spacdata.spacfilername IS $$SPAC filer name$$;
COMMENT ON COLUMN tec.spacdata.spacfilernameshort IS $$SPAC acronym$$;
COMMENT ON COLUMN tec.spacdata.spaccommitteestatuscd IS $$SPAC committee status (ACTIVE, TERMINATED)$$;
COMMENT ON COLUMN tec.spacdata.spactreaseffstartdt IS $$SPAC treasurer start date$$;
COMMENT ON COLUMN tec.spacdata.spactreaseffstopdt IS $$SPAC treasurer end date$$;
COMMENT ON COLUMN tec.spacdata.spacpositioncd IS $$SPAC position (SUPPORT, OPPOSE, ASSIST)$$;
COMMENT ON COLUMN tec.spacdata.candidatefilerident IS $$Candidate filer account #$$;
COMMENT ON COLUMN tec.spacdata.candidatefilertypecd IS $$Candidate type of filer$$;
COMMENT ON COLUMN tec.spacdata.candidatefilername IS $$Candidate filer name$$;
COMMENT ON COLUMN tec.spacdata.candidatefilerpersstatuscd IS $$Candidate status (CURRENT, etc)$$;
COMMENT ON COLUMN tec.spacdata.candidateeffstartdt IS $$Candidate start date$$;
COMMENT ON COLUMN tec.spacdata.candidateeffstopdt IS $$Candidate end date$$;
COMMENT ON COLUMN tec.spacdata.candidateholdofficecd IS $$Candidate office held$$;
COMMENT ON COLUMN tec.spacdata.candidateholdofficedistrict IS $$Candidate office held district$$;
COMMENT ON COLUMN tec.spacdata.candidateholdofficeplace IS $$Candidate office held place$$;
COMMENT ON COLUMN tec.spacdata.candidateholdofficedescr IS $$Candidate office held description$$;
COMMENT ON COLUMN tec.spacdata.candidateholdofficecountycd IS $$Candidate office held country code$$;
COMMENT ON COLUMN tec.spacdata.candidateholdofficecountydescr IS $$Candidate office help county description$$;
COMMENT ON COLUMN tec.spacdata.candidateseekofficecd IS $$Candidate office sought$$;
COMMENT ON COLUMN tec.spacdata.candidateseekofficedistrict IS $$Candidate office sought district$$;
COMMENT ON COLUMN tec.spacdata.candidateseekofficeplace IS $$Candidate office sought place$$;
COMMENT ON COLUMN tec.spacdata.candidateseekofficedescr IS $$Candidate office sought description$$;
COMMENT ON COLUMN tec.spacdata.candidateseekofficecountycd IS $$Candidate office sought county code$$;
COMMENT ON COLUMN tec.spacdata.candidateseekofficecountydescr IS $$Candidate office sought county description$$;
COMMENT ON COLUMN tec.spacdata.ctaseekofficecd IS $$CTA office sought$$;
COMMENT ON COLUMN tec.spacdata.ctaseekofficedistrict IS $$CTA office sought district$$;
COMMENT ON COLUMN tec.spacdata.ctaseekofficeplace IS $$CTA office sought place$$;
COMMENT ON COLUMN tec.spacdata.ctaseekofficedescr IS $$CTA office sought description$$;
COMMENT ON COLUMN tec.spacdata.ctaseekofficecountycd IS $$CTA office sought county code$$;
COMMENT ON COLUMN tec.spacdata.ctaseekofficecountydescr IS $$CTA office sought county description$$;
COMMENT ON COLUMN tec.spacdata.candtreasfilerpersstatuscd IS $$Candidate treasurer status (CURRENT, etc)$$;
COMMENT ON COLUMN tec.spacdata.candtreaseffstartdt IS $$Candidate treasurer start date$$;
COMMENT ON COLUMN tec.spacdata.candtreaseffstopdt IS $$Candidate treasurer end date$$;
\COPY tec.spacdata FROM 'data/TEC_CF_CSV/spacs.csv' WITH ( FORMAT CSV , HEADER true )