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

\echo LOADING CoverSheetLaData



CREATE TABLE tec.coversheetladata (
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
	filedDt                                 date,
	regReportInfoIdent                      int,
	sourceCategoryCd                        text,
	filerPersentTypeCd                      text,
	filerNameOrganization                   text,
	filerNameLast                           text,
	filerNameSuffixCd                       text,
	filerNameFirst                          text,
	filerNamePrefixCd                       text,
	filerNameShort                          text,
	signerPrintedName                       text,
	onbehalfFlag                            bool,
	totalExpendTransportation               numeric(10,2),
	totalExpendFood                         numeric(10,2),
	totalExpendEntertainment                numeric(10,2),
	totalExpendGift                         numeric(10,2),
	totalExpendAward                        numeric(10,2),
	totalExpendEvent                        numeric(10,2),
	totalExpendMedia                        numeric(10,2),
	totalBenefitStateSen                    numeric(10,2),
	totalBenefitStateRep                    numeric(10,2),
	totalBenefitOtherElected                numeric(10,2),
	totalBenefitLegEmpl                     numeric(10,2),
	totalBenefitExecEmpl                    numeric(10,2),
	totalBenefitFamily                      numeric(10,2),
	totalBenefitEvent                       numeric(10,2),
	totalBenefitGuest                       numeric(10,2),
	lobbyistRegisteredDt                    date,
	lobbyistTerminatedDt                    date,
	corrExplMemo                            text,
	coverSheetMemo                          text,
	subjectMatterMemo                       text,
	docketsMemo                             text
);

COMMENT ON TABLE tec.coversheetladata IS $$Form LA Cover Sheet information. NOTE: Records are included only if the due date assigned by TEC staff is after January 10, 2005. Most Lobby Activities reports due 01/10/2005 were filed on paper;  most reports due afterwards were filed electronically. TEC staff enters totals from the cover page of paper reports, but does not enter any information from the schedules. File: LaCvr.csv$$;
COMMENT ON COLUMN tec.coversheetladata.recordtype IS $$Record type code - always CVLA$$;
COMMENT ON COLUMN tec.coversheetladata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.coversheetladata.reporttypecd IS $$Report type$$;
COMMENT ON COLUMN tec.coversheetladata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.coversheetladata.applicableyear IS $$Year applicable$$;
COMMENT ON COLUMN tec.coversheetladata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.coversheetladata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.coversheetladata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.coversheetladata.filersort IS $$Filer name for sorting$$;
COMMENT ON COLUMN tec.coversheetladata.duedt IS $$Report due date$$;
COMMENT ON COLUMN tec.coversheetladata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.coversheetladata.periodstartdt IS $$Beginning of period covered$$;
COMMENT ON COLUMN tec.coversheetladata.periodenddt IS $$Ending of period covered$$;
COMMENT ON COLUMN tec.coversheetladata.fileddt IS $$Date report was filed (postmark)$$;
COMMENT ON COLUMN tec.coversheetladata.regreportinfoident IS $$Most recent registration report #$$;
COMMENT ON COLUMN tec.coversheetladata.sourcecategorycd IS $$Source of report (ELECTRONIC, KEYED)$$;
COMMENT ON COLUMN tec.coversheetladata.filerpersenttypecd IS $$Type of filer name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.coversheetladata.filernameorganization IS $$For ENTITY, the filer organization name$$;
COMMENT ON COLUMN tec.coversheetladata.filernamelast IS $$For INDIVIDUAL, the filer last name$$;
COMMENT ON COLUMN tec.coversheetladata.filernamesuffixcd IS $$For INDIVIDUAL, the filer name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.coversheetladata.filernamefirst IS $$For INDIVIDUAL, the filer first name$$;
COMMENT ON COLUMN tec.coversheetladata.filernameprefixcd IS $$For INDIVIDUAL, the filer name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.coversheetladata.filernameshort IS $$For INDIVIDUAL, the filer short name (nickname)$$;
COMMENT ON COLUMN tec.coversheetladata.signerprintedname IS $$Document signer name$$;
COMMENT ON COLUMN tec.coversheetladata.onbehalfflag IS $$Indicates if filing on behalf of another entity$$;
COMMENT ON COLUMN tec.coversheetladata.totalexpendtransportation IS $$Total expend: transportation$$;
COMMENT ON COLUMN tec.coversheetladata.totalexpendfood IS $$Total expend: food$$;
COMMENT ON COLUMN tec.coversheetladata.totalexpendentertainment IS $$Total expend: entertainment$$;
COMMENT ON COLUMN tec.coversheetladata.totalexpendgift IS $$Total expend: gifts$$;
COMMENT ON COLUMN tec.coversheetladata.totalexpendaward IS $$Total expend: awards / mementos$$;
COMMENT ON COLUMN tec.coversheetladata.totalexpendevent IS $$Total expend: pol fundraisers / charity events$$;
COMMENT ON COLUMN tec.coversheetladata.totalexpendmedia IS $$Total expend: mass media communications$$;
COMMENT ON COLUMN tec.coversheetladata.totalbenefitstatesen IS $$Total benefits: state senators$$;
COMMENT ON COLUMN tec.coversheetladata.totalbenefitstaterep IS $$Total benefits: state representatives$$;
COMMENT ON COLUMN tec.coversheetladata.totalbenefitotherelected IS $$Total benefits: other elected/appointed offcls$$;
COMMENT ON COLUMN tec.coversheetladata.totalbenefitlegempl IS $$Total benefits: legislative branch employees$$;
COMMENT ON COLUMN tec.coversheetladata.totalbenefitexecempl IS $$Total benefits: executive agency employees$$;
COMMENT ON COLUMN tec.coversheetladata.totalbenefitfamily IS $$Total benefits: family of legis/exec branch$$;
COMMENT ON COLUMN tec.coversheetladata.totalbenefitevent IS $$Total benefits: events - all legis invited$$;
COMMENT ON COLUMN tec.coversheetladata.totalbenefitguest IS $$Total benefits: guests$$;
COMMENT ON COLUMN tec.coversheetladata.lobbyistregistereddt IS $$Date lobbyist registered$$;
COMMENT ON COLUMN tec.coversheetladata.lobbyistterminateddt IS $$Date lobbyist terminated$$;
COMMENT ON COLUMN tec.coversheetladata.correxplmemo IS $$Explanation of correction$$;
COMMENT ON COLUMN tec.coversheetladata.coversheetmemo IS $$Cover sheet memo$$;
COMMENT ON COLUMN tec.coversheetladata.subjectmattermemo IS $$Subject matter memo$$;
COMMENT ON COLUMN tec.coversheetladata.docketsmemo IS $$Dockets memo$$;
\COPY tec.coversheetladata FROM 'data/TEC_LA_CSV/LaCvr.csv' WITH ( FORMAT CSV , HEADER true )