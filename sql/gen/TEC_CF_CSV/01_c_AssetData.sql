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

\echo LOADING c_AssetData


CREATE TABLE tec.c_AssetData (
	recordType                              text,
	formTypeCd                              text,
	schedFormTypeCd                         text,
	reportInfoIdent                         int,
	receivedDt                              date,
	infoOnlyFlag                            bool,
	filerIdent                              int,
	filerTypeCd                             text,
	filerName                               text,
	assetInfoId                             bigint,
	assetDescr                              text,
	PRIMARY KEY ( assetInfoId )
);
COMMENT ON TABLE tec.c_AssetData IS $$Assets - Schedule M - Assets valued at $500 or more for judicial filers only. File: assets.csv$$;
COMMENT ON COLUMN tec.c_assetdata.recordtype IS $$Record type code - always ASSET$$;
COMMENT ON COLUMN tec.c_assetdata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.c_assetdata.schedformtypecd IS $$TEC Schedule Used$$;
COMMENT ON COLUMN tec.c_assetdata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.c_assetdata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.c_assetdata.infoonlyflag IS $$Superseded by other report$$;
COMMENT ON COLUMN tec.c_assetdata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.c_assetdata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.c_assetdata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.c_assetdata.assetinfoid IS $$Asset unique identifier$$;
COMMENT ON COLUMN tec.c_assetdata.assetdescr IS $$Description of asset$$;
\COPY tec.c_AssetData FROM 'data/TEC_CF_CSV/assets.csv' WITH ( FORMAT CSV , HEADER true );


CREATE INDEX ON tec.c_AssetData (filerIdent, filerTypeCd);

ALTER TABLE tec.c_AssetData
	ADD FOREIGN KEY (reportInfoIdent) REFERENCES tec.c_CoverSheet1Data NOT VALID,
	ADD FOREIGN KEY (filerIdent, filerTypeCd) REFERENCES tec.c_FilerData NOT VALID;

CREATE INDEX ON tec.c_AssetData (reportinfoident);

