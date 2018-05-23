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

\echo LOADING DocketData



CREATE TABLE tec.docketdata (
	recordType                              text,
	formTypeCd                              text,
	reportTypeCd                            text,
	reportInfoIdent                         int,
	applicableYear                          text,
	filerIdent                              int,
	filerTypeCd                             text,
	filerName                               text,
	filerSort                               text,
	dueDt                                   date,
	receivedDt                              date,
	periodStartDt                           date,
	periodEndDt                             date,
	lobbyFormType                           text,
	lobbyDocketdesigId                      bigint,
	designationText                         text,
	agencyName                              text
);

COMMENT ON TABLE tec.docketdata IS $$Form LA Schedule A - Docket Nos or Other Designation. NOTE: Form LA Instructions for this box state List the docket number and the name of the state agency at which any administrative matter is pending about which you, anyone you retain or employ to appear on your behalf, or anyone who appears on your behalf communicated with an officer of the executive or legislative branch of state government during the reporting period. File: LaDock.csv$$;
COMMENT ON COLUMN tec.docketdata.recordtype IS $$Record type code - always DOCK$$;
COMMENT ON COLUMN tec.docketdata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.docketdata.reporttypecd IS $$Report type$$;
COMMENT ON COLUMN tec.docketdata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.docketdata.applicableyear IS $$Year applicable$$;
COMMENT ON COLUMN tec.docketdata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.docketdata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.docketdata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.docketdata.filersort IS $$Filer name for sorting$$;
COMMENT ON COLUMN tec.docketdata.duedt IS $$Report due date$$;
COMMENT ON COLUMN tec.docketdata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.docketdata.periodstartdt IS $$Beginning of period covered$$;
COMMENT ON COLUMN tec.docketdata.periodenddt IS $$Ending of period covered$$;
COMMENT ON COLUMN tec.docketdata.lobbyformtype IS $$TEC Lobby Form Used$$;
COMMENT ON COLUMN tec.docketdata.lobbydocketdesigid IS $$Lobby docket designation unique identifier$$;
COMMENT ON COLUMN tec.docketdata.designationtext IS $$Docket designation text$$;
COMMENT ON COLUMN tec.docketdata.agencyname IS $$Agency name$$;
\COPY tec.docketdata FROM 'data/TEC_LA_CSV/LaDock.csv' WITH ( FORMAT CSV , HEADER true )