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

\echo LOADING c_CoverSheet3Data



CREATE TABLE tec.c_coversheet3data (
	recordType                              text,
	formTypeCd                              text,
	reportInfoIdent                         int,
	receivedDt                              date,
	infoOnlyFlag                            bool,
	filerIdent                              int,
	filerTypeCd                             text,
	filerName                               text,
	committeeActivityId                     bigint,
	subjectCategoryCd                       text,
	subjectPositionCd                       text,
	subjectDescr                            text,
	subjectBallotNumber                     text,
	subjectElectionDt                       date,
	activityHoldOfficeCd                    text,
	activityHoldOfficeDistrict              text,
	activityHoldOfficePlace                 text,
	activityHoldOfficeDescr                 text,
	activityHoldOfficeCountyCd              text,
	activityHoldOfficeCountyDescr           text,
	activitySeekOfficeCd                    text,
	activitySeekOfficeDistrict              text,
	activitySeekOfficePlace                 text,
	activitySeekOfficeDescr                 text,
	activitySeekOfficeCountyCd              text,
	activitySeekOfficeCountyDescr           text,
	PRIMARY KEY (committeeActivityId)
);

COMMENT ON TABLE tec.c_coversheet3data IS $$Cover Sheet 3 - Committee purpose. The committee purpose is reported at the top of Cover Sheet Page 2 FORMNAME = CEC, GPAC, JSPAC, MCEC, MPAC, SCSPAC, SPAC, SPACSS. File: purpose.csv$$;
COMMENT ON COLUMN tec.c_coversheet3data.recordtype IS $$Record type code - always CVR3$$;
COMMENT ON COLUMN tec.c_coversheet3data.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.c_coversheet3data.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.c_coversheet3data.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.c_coversheet3data.infoonlyflag IS $$Superseded by other report$$;
COMMENT ON COLUMN tec.c_coversheet3data.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.c_coversheet3data.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.c_coversheet3data.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.c_coversheet3data.committeeactivityid IS $$Committee activity unique identifier$$;
COMMENT ON COLUMN tec.c_coversheet3data.subjectcategorycd IS $$Subject Category ()$$;
COMMENT ON COLUMN tec.c_coversheet3data.subjectpositioncd IS $$Subject Position (SUPPORT, OPPOSE, ASSIST)$$;
COMMENT ON COLUMN tec.c_coversheet3data.subjectdescr IS $$Subject description$$;
COMMENT ON COLUMN tec.c_coversheet3data.subjectballotnumber IS $$Ballot number$$;
COMMENT ON COLUMN tec.c_coversheet3data.subjectelectiondt IS $$Election date$$;
COMMENT ON COLUMN tec.c_coversheet3data.activityholdofficecd IS $$Activity office held$$;
COMMENT ON COLUMN tec.c_coversheet3data.activityholdofficedistrict IS $$Activity office held district$$;
COMMENT ON COLUMN tec.c_coversheet3data.activityholdofficeplace IS $$Activity office held place$$;
COMMENT ON COLUMN tec.c_coversheet3data.activityholdofficedescr IS $$Activity office held description$$;
COMMENT ON COLUMN tec.c_coversheet3data.activityholdofficecountycd IS $$Activity office held country code$$;
COMMENT ON COLUMN tec.c_coversheet3data.activityholdofficecountydescr IS $$Activity office help county description$$;
COMMENT ON COLUMN tec.c_coversheet3data.activityseekofficecd IS $$Activity office sought$$;
COMMENT ON COLUMN tec.c_coversheet3data.activityseekofficedistrict IS $$Activity office sought district$$;
COMMENT ON COLUMN tec.c_coversheet3data.activityseekofficeplace IS $$Activity office sought place$$;
COMMENT ON COLUMN tec.c_coversheet3data.activityseekofficedescr IS $$Activity office sought description$$;
COMMENT ON COLUMN tec.c_coversheet3data.activityseekofficecountycd IS $$Activity office sought county code$$;
COMMENT ON COLUMN tec.c_coversheet3data.activityseekofficecountydescr IS $$Activity office sought county description$$;
\COPY tec.c_coversheet3data FROM 'data/TEC_CF_CSV/purpose.csv' WITH ( FORMAT CSV , HEADER true );

ALTER TABLE tec.c_CoverSheet3Data
	ADD FOREIGN KEY (filerIdent, filerTypeCd)
	REFERENCES tec.c_FilerData
	NOT VALID;
ALTER TABLE tec.c_coversheet3data
	ADD FOREIGN KEY (activityHoldOfficeCd) REFERENCES tec.codes_office NOT VALID,
	ADD FOREIGN KEY (activityHoldOfficeCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (activitySeekOfficeCd) REFERENCES tec.codes_office NOT VALID,
	ADD FOREIGN KEY (activitySeekOfficeCountyCd) REFERENCES tec.codes_counties NOT VALID;