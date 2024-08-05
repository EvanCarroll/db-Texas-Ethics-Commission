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

\echo LOADING c_ExpendRepayment


CREATE TABLE tec.c_ExpendRepayment (
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
	expendRepaymentId                       bigint,
	repaymentDt                             date,
	PRIMARY KEY ( expendInfoId )
);
COMMENT ON TABLE tec.c_ExpendRepayment IS $$Expenditures Repayment dates$$;
COMMENT ON COLUMN tec.c_expendrepayment.recordtype IS $$Record type code - always EXPN$$;
COMMENT ON COLUMN tec.c_expendrepayment.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.c_expendrepayment.schedformtypecd IS $$TEC Schedule Used$$;
COMMENT ON COLUMN tec.c_expendrepayment.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.c_expendrepayment.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.c_expendrepayment.infoonlyflag IS $$Superseded by other report$$;
COMMENT ON COLUMN tec.c_expendrepayment.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.c_expendrepayment.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.c_expendrepayment.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.c_expendrepayment.expendinfoid IS $$Expenditure unique identifier$$;
COMMENT ON COLUMN tec.c_expendrepayment.expendrepaymentid IS $$Expenditure Repayment unique identifier$$;
COMMENT ON COLUMN tec.c_expendrepayment.repaymentdt IS $$Repayment date$$;


CREATE INDEX ON tec.c_ExpendRepayment (filerIdent, filerTypeCd);

ALTER TABLE tec.c_ExpendRepayment
	ADD FOREIGN KEY (reportInfoIdent) REFERENCES tec.c_CoverSheet1Data NOT VALID,
	ADD FOREIGN KEY (filerIdent, filerTypeCd) REFERENCES tec.c_FilerData NOT VALID;

CREATE INDEX ON tec.c_ExpendRepayment (reportinfoident);

