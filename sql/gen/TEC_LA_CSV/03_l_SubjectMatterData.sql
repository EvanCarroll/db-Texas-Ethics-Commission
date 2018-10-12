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

\echo LOADING l_SubjectMatterData



CREATE TABLE tec.l_subjectmatterdata (
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
	lobbySubjectmatterId                    bigint,
	subjectMatterCd                         text,
	subjectMatterCodeValue                  text,
	subjectMatterDescr                      text,
	PRIMARY KEY (lobbySubjectmatterId)
);

COMMENT ON TABLE tec.l_subjectmatterdata IS $$Form LA Schedule A - Subject Matter Categories. NOTE: Form LA Schedule A Box 4 states If your lobby communications pertained to subject matters not marked on your original lobby registration or on a previous amendment, check the appropriate boxes. Unlike other tables in this document, subject matter is based on the Year Applicable rather than due date. This information was not entered from paper reports prior to the year 2000. File: LaSub.csv$$;
COMMENT ON COLUMN tec.l_subjectmatterdata.recordtype IS $$Record type code - always SUB$$;
COMMENT ON COLUMN tec.l_subjectmatterdata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.l_subjectmatterdata.reporttypecd IS $$Report type$$;
COMMENT ON COLUMN tec.l_subjectmatterdata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.l_subjectmatterdata.applicableyear IS $$Year applicable$$;
COMMENT ON COLUMN tec.l_subjectmatterdata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.l_subjectmatterdata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.l_subjectmatterdata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.l_subjectmatterdata.filersort IS $$Filer name for sorting$$;
COMMENT ON COLUMN tec.l_subjectmatterdata.duedt IS $$Report due date$$;
COMMENT ON COLUMN tec.l_subjectmatterdata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.l_subjectmatterdata.periodstartdt IS $$Beginning of period covered$$;
COMMENT ON COLUMN tec.l_subjectmatterdata.periodenddt IS $$Ending of period covered$$;
COMMENT ON COLUMN tec.l_subjectmatterdata.lobbyformtype IS $$TEC Lobby Form Used$$;
COMMENT ON COLUMN tec.l_subjectmatterdata.lobbysubjectmatterid IS $$Lobby subject matter unique identifier$$;
COMMENT ON COLUMN tec.l_subjectmatterdata.subjectmattercd IS $$Subject matter code$$;
COMMENT ON COLUMN tec.l_subjectmatterdata.subjectmattercodevalue IS $$Code table lookup of subject matter code$$;
COMMENT ON COLUMN tec.l_subjectmatterdata.subjectmatterdescr IS $$Description of other subject matter$$;
\COPY tec.l_subjectmatterdata FROM 'data/TEC_LA_CSV/LaSub.csv' WITH ( FORMAT CSV , HEADER true );

ALTER TABLE tec.l_subjectmatterdata
	ADD FOREIGN KEY (reportTypeCd) REFERENCES tec.codes_reports NOT VALID,
	ADD FOREIGN KEY (reportInfoIdent) REFERENCES tec.l_coversheetladata NOT VALID,
	ADD FOREIGN KEY (filerTypeCd) REFERENCES tec.codes_filertype NOT VALID;