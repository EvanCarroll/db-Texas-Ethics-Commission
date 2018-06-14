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

\echo LOADING FinalData



CREATE TABLE tec.finaldata (
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
	finalOfficeholderAckFlag                bool
);

COMMENT ON TABLE tec.finaldata IS $$Final reports. File: final.csv$$;
COMMENT ON COLUMN tec.finaldata.recordtype IS $$Record type code - always FINL$$;
COMMENT ON COLUMN tec.finaldata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.finaldata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.finaldata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.finaldata.infoonlyflag IS $$Superseded by other report$$;
COMMENT ON COLUMN tec.finaldata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.finaldata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.finaldata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.finaldata.finalunexpendcontribflag IS $$Unexpended contributions indicator$$;
COMMENT ON COLUMN tec.finaldata.finalretainedassetsflag IS $$Retained assets indicator$$;
COMMENT ON COLUMN tec.finaldata.finalofficeholderackflag IS $$Office holder ack indicator$$;
\COPY tec.finaldata FROM 'data/TEC_CF_CSV/finals.csv' WITH ( FORMAT CSV , HEADER true )
ALTER TABLE tec.FinalData
	ADD FOREIGN KEY (filerIdent, filerTypeCd)
	REFERENCES tec.FilerData
	NOT VALID