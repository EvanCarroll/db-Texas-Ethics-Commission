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

\echo LOADING c_spacdata


CREATE TABLE tec.c_spacdata (
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
COMMENT ON TABLE tec.c_spacdata IS $$Index of Specific-purpose committees. This file contains links between specific-purpose committees (FILER_TYPE = SPAC, JSPC and SCPC) and the candidates/office holders they support, oppose or assist. The information is entered by TEC staff from the paper Form STA (treasurer appointment for a speficic- purpose committee) and amendments thereto (Form ASTA). TEC staff does not enter links based on information from campaign finance reports. The links are not broken when the STA is terminated. File: spacs.csv$$;
COMMENT ON COLUMN tec.c_spacdata.recordtype IS $$Record type code - always SPAC$$;
COMMENT ON COLUMN tec.c_spacdata.spacfilerident IS $$SPAC filer account #$$;
COMMENT ON COLUMN tec.c_spacdata.spacfilertypecd IS $$SPAC type of filer$$;
COMMENT ON COLUMN tec.c_spacdata.spacfilername IS $$SPAC filer name$$;
COMMENT ON COLUMN tec.c_spacdata.spacfilernameshort IS $$SPAC acronym$$;
COMMENT ON COLUMN tec.c_spacdata.spaccommitteestatuscd IS $$SPAC committee status (ACTIVE, TERMINATED)$$;
COMMENT ON COLUMN tec.c_spacdata.spactreaseffstartdt IS $$SPAC treasurer start date$$;
COMMENT ON COLUMN tec.c_spacdata.spactreaseffstopdt IS $$SPAC treasurer end date$$;
COMMENT ON COLUMN tec.c_spacdata.spacpositioncd IS $$SPAC position (SUPPORT, OPPOSE, ASSIST)$$;
COMMENT ON COLUMN tec.c_spacdata.candidatefilerident IS $$Candidate filer account #$$;
COMMENT ON COLUMN tec.c_spacdata.candidatefilertypecd IS $$Candidate type of filer$$;
COMMENT ON COLUMN tec.c_spacdata.candidatefilername IS $$Candidate filer name$$;
COMMENT ON COLUMN tec.c_spacdata.candidatefilerpersstatuscd IS $$Candidate status (CURRENT, etc)$$;
COMMENT ON COLUMN tec.c_spacdata.candidateeffstartdt IS $$Candidate start date$$;
COMMENT ON COLUMN tec.c_spacdata.candidateeffstopdt IS $$Candidate end date$$;
COMMENT ON COLUMN tec.c_spacdata.candidateholdofficecd IS $$Candidate office held$$;
COMMENT ON COLUMN tec.c_spacdata.candidateholdofficedistrict IS $$Candidate office held district$$;
COMMENT ON COLUMN tec.c_spacdata.candidateholdofficeplace IS $$Candidate office held place$$;
COMMENT ON COLUMN tec.c_spacdata.candidateholdofficedescr IS $$Candidate office held description$$;
COMMENT ON COLUMN tec.c_spacdata.candidateholdofficecountycd IS $$Candidate office held country code$$;
COMMENT ON COLUMN tec.c_spacdata.candidateholdofficecountydescr IS $$Candidate office help county description$$;
COMMENT ON COLUMN tec.c_spacdata.candidateseekofficecd IS $$Candidate office sought$$;
COMMENT ON COLUMN tec.c_spacdata.candidateseekofficedistrict IS $$Candidate office sought district$$;
COMMENT ON COLUMN tec.c_spacdata.candidateseekofficeplace IS $$Candidate office sought place$$;
COMMENT ON COLUMN tec.c_spacdata.candidateseekofficedescr IS $$Candidate office sought description$$;
COMMENT ON COLUMN tec.c_spacdata.candidateseekofficecountycd IS $$Candidate office sought county code$$;
COMMENT ON COLUMN tec.c_spacdata.candidateseekofficecountydescr IS $$Candidate office sought county description$$;
COMMENT ON COLUMN tec.c_spacdata.ctaseekofficecd IS $$CTA office sought$$;
COMMENT ON COLUMN tec.c_spacdata.ctaseekofficedistrict IS $$CTA office sought district$$;
COMMENT ON COLUMN tec.c_spacdata.ctaseekofficeplace IS $$CTA office sought place$$;
COMMENT ON COLUMN tec.c_spacdata.ctaseekofficedescr IS $$CTA office sought description$$;
COMMENT ON COLUMN tec.c_spacdata.ctaseekofficecountycd IS $$CTA office sought county code$$;
COMMENT ON COLUMN tec.c_spacdata.ctaseekofficecountydescr IS $$CTA office sought county description$$;
COMMENT ON COLUMN tec.c_spacdata.candtreasfilerpersstatuscd IS $$Candidate treasurer status (CURRENT, etc)$$;
COMMENT ON COLUMN tec.c_spacdata.candtreaseffstartdt IS $$Candidate treasurer start date$$;
COMMENT ON COLUMN tec.c_spacdata.candtreaseffstopdt IS $$Candidate treasurer end date$$;
\COPY tec.c_spacdata FROM 'data/TEC_CF_CSV/spacs.csv' WITH ( FORMAT CSV , HEADER true );


CREATE INDEX ON tec.c_spacdata (spacFilerIdent, spacFilerTypeCd);

CREATE INDEX ON tec.c_spacdata (candidateFilerIdent, candidateFilerTypeCd);

ALTER TABLE tec.c_spacdata
	ADD FOREIGN KEY (candidateHoldOfficeCd) REFERENCES tec.codes_office NOT VALID,
	ADD FOREIGN KEY (candidateHoldOfficeCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (candidateSeekOfficeCd) REFERENCES tec.codes_office NOT VALID,
	ADD FOREIGN KEY (candidateSeekOfficeCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (ctaSeekOfficeCd) REFERENCES tec.codes_office NOT VALID,
	ADD FOREIGN KEY (ctaSeekOfficeCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (spacFilerIdent, spacFilerTypeCd) REFERENCES tec.c_filerdata NOT VALID,
	ADD FOREIGN KEY (candidateFilerIdent, candidateFilerTypeCd) REFERENCES tec.c_filerdata NOT VALID;

