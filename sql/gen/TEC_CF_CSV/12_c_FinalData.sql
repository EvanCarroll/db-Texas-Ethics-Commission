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

\echo LOADING c_FinalData


CREATE TABLE tec.c_finaldata (
	recordType                              text,
	formTypeCd                              text,
	reportInfoIdent                         int,
	receivedDt                              date,
	infoOnlyFlag                            bool,
	filerIdent                              int,
	filerTypeCd                             text,
	filerName                               text,
	finalUnexpendContribFlag                bool,
	finalRetainedAssetsFlag                 bool,
	finalOfficeholderAckFlag                bool,
	PRIMARY KEY (reportInfoIdent)
);
COMMENT ON TABLE tec.c_finaldata IS $$Final reports. File: final.csv$$;
COMMENT ON COLUMN tec.c_finaldata.recordtype IS $$Record type code - always FINL$$;
COMMENT ON COLUMN tec.c_finaldata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.c_finaldata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.c_finaldata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.c_finaldata.infoonlyflag IS $$Superseded by other report$$;
COMMENT ON COLUMN tec.c_finaldata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.c_finaldata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.c_finaldata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.c_finaldata.finalunexpendcontribflag IS $$Unexpended contributions indicator$$;
COMMENT ON COLUMN tec.c_finaldata.finalretainedassetsflag IS $$Retained assets indicator$$;
COMMENT ON COLUMN tec.c_finaldata.finalofficeholderackflag IS $$Office holder ack indicator$$;
\COPY tec.c_finaldata FROM 'data/TEC_CF_CSV/finals.csv' WITH ( FORMAT CSV , HEADER true );


CREATE INDEX ON tec.c_finaldata (filerIdent, filerTypeCd);

ALTER TABLE tec.c_finaldata
	ADD FOREIGN KEY (filerIdent, filerTypeCd) REFERENCES tec.c_FilerData NOT VALID;

CREATE INDEX ON tec.c_finaldata (reportInfoIdent);

