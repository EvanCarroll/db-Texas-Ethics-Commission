\echo Schema generation for the Texas Ethics Commission
\echo Copyright (C) 2018  Evan Carroll
\echo 
\echo This program is free software: you can redistribute it and/or modify
\echo it under the terms of the GNU Affero General Public License as
\echo published by the Free Software Foundation, either version 3 of the
\echo License, or (at your option) any later version.
\echo 
\echo This program is distributed in the hope that it will be useful,
\echo but WITHOUT ANY WARRANTY; without even the implied warranty of
\echo MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
\echo GNU Affero General Public License for more details.
\echo 
\echo You should have received a copy of the GNU Affero General Public License
\echo along with this program.  If not, see <https://www.gnu.org/licenses/>.

\prompt agree_eula Do you agree to those terms? [Yes] or [No]

DROP SCHEMA IF EXISTS tec CASCADE;
CREATE SCHEMA tec;
COMMENT ON SCHEMA tec IS $$Texas Ethics Comission dataset$$;


\echo LOADING CODES GENERATED FROM PDF
\i sql/cf_new/1_filertype.sql
\i sql/cf_new/02_data/5_office.sql
\i sql/cf_new/02_data/6_reports.sql
\i sql/cf_new/02_data/7_forms.sql
\i sql/cf_new/02_data/8_counties.sql
\i sql/cf_new/02_data/9_total.sql

\echo LOADING FORM 1295 [1295Certificates.csv]
\i sql/form1295.sql

\echo LOADING CAMPAIGN FINANCE REPORTS [TEC_CF_CSV.zip]
\i sql/gen/TEC_CF_CSV/10_c_ExpendCategory.sql
\i sql/gen/TEC_CF_CSV/11_c_FilerData.sql
\i sql/gen/TEC_CF_CSV/12_c_FinalData.sql
\i sql/gen/TEC_CF_CSV/13_c_LoanData.sql
\i sql/gen/TEC_CF_CSV/14_c_PledgeData.sql
\i sql/gen/TEC_CF_CSV/15_c_SpacData.sql
\i sql/gen/TEC_CF_CSV/16_c_TravelData.sql
\i sql/gen/TEC_CF_CSV/01_c_AssetData.sql
\i sql/gen/TEC_CF_CSV/02_c_CandidateData.sql
\i sql/gen/TEC_CF_CSV/03_c_ContributionData.sql
\i sql/gen/TEC_CF_CSV/04_c_CoverSheet1Data.sql
\i sql/gen/TEC_CF_CSV/05_c_CoverSheet2Data.sql
\i sql/gen/TEC_CF_CSV/06_c_CoverSheet3Data.sql
\i sql/gen/TEC_CF_CSV/07_c_CreditData.sql
\i sql/gen/TEC_CF_CSV/08_c_DebtData.sql
\i sql/gen/TEC_CF_CSV/09_c_ExpendData.sql

\echo LOADING LOBY REPORTS [TEC_LA_CSV.zip]
\i sql/gen/TEC_LA_CSV/01_l_CoverSheetLaData.sql
\i sql/gen/TEC_LA_CSV/02_l_IndividualReportingData.sql
\i sql/gen/TEC_LA_CSV/03_l_SubjectMatterData.sql
\i sql/gen/TEC_LA_CSV/04_l_DocketData.sql
\i sql/gen/TEC_LA_CSV/05_l_TransportationData.sql
\i sql/gen/TEC_LA_CSV/06_l_FoodBeverageData.sql
\i sql/gen/TEC_LA_CSV/07_l_EntertainmentData.sql
\i sql/gen/TEC_LA_CSV/08_l_GiftData.sql
\i sql/gen/TEC_LA_CSV/09_l_AwardMementoData.sql
\i sql/gen/TEC_LA_CSV/10_l_EventData.sql

-- Needs both SJC and SCJ
INSERT INTO tec.codes_office (office_id)
VALUES ('DISTATTY_HR'), ('JUSTICEAPP'), ('SJC'), ('SCJ'), ('JUDGECRIM'), ('DISTATTY_MULTI_KL_KN'), ('COMPTROLLR'), ('CRIMAL_DISTATTY');

-- BEGIN;
-- 	-- SELECT FORMAT(
-- 	-- 	$$UPDATE %I.%I.%I SET %I = NULL WHERE %I IN ( 'OTHER', 'UNKNOWN', '' );$$,
-- 	-- 	table_catalog,
-- 	-- 	table_schema,
-- 	-- 	table_name,
-- 	-- 	column_name,
-- 	-- 	column_name
-- 	-- )
-- 	-- FROM information_schema.columns
-- 	-- WHERE table_schema = 'tec'
-- 	-- 	AND column_name LIKE '%countycd'
-- 	-- ORDER BY table_catalog, table_schema, table_name;
-- 
UPDATE test.tec.c_candidatedata SET candidateholdofficecountycd = NULL WHERE candidateholdofficecountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_candidatedata SET candidateseekofficecountycd = NULL WHERE candidateseekofficecountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_contributiondata SET contributorstreetcountycd = NULL WHERE contributorstreetcountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_coversheet1data SET treasmailingcountycd = NULL WHERE treasmailingcountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_coversheet1data SET treasstreetcountycd = NULL WHERE treasstreetcountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_coversheet1data SET politicalpartycountycd = NULL WHERE politicalpartycountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_coversheet1data SET filerstreetcountycd = NULL WHERE filerstreetcountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_coversheet1data SET filerseekofficecountycd = NULL WHERE filerseekofficecountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_coversheet1data SET filerholdofficecountycd = NULL WHERE filerholdofficecountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_coversheet1data SET chairmailingcountycd = NULL WHERE chairmailingcountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_coversheet1data SET chairstreetcountycd = NULL WHERE chairstreetcountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_coversheet2data SET treasstreetcountycd = NULL WHERE treasstreetcountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_coversheet2data SET notifierstreetcountycd = NULL WHERE notifierstreetcountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_coversheet3data SET activityseekofficecountycd = NULL WHERE activityseekofficecountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_coversheet3data SET activityholdofficecountycd = NULL WHERE activityholdofficecountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_creditdata SET payorstreetcountycd = NULL WHERE payorstreetcountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_debtdata SET lenderstreetcountycd = NULL WHERE lenderstreetcountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_expenddata SET payeestreetcountycd = NULL WHERE payeestreetcountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_filerdata SET chairmailingcountycd = NULL WHERE chairmailingcountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_filerdata SET filerholdofficecountycd = NULL WHERE filerholdofficecountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_filerdata SET contestseekofficecountycd = NULL WHERE contestseekofficecountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_filerdata SET treasstreetcountycd = NULL WHERE treasstreetcountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_filerdata SET treasmailingcountycd = NULL WHERE treasmailingcountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_filerdata SET assttreasstreetcountycd = NULL WHERE assttreasstreetcountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_filerdata SET chairstreetcountycd = NULL WHERE chairstreetcountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_filerdata SET ctaseekofficecountycd = NULL WHERE ctaseekofficecountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_filerdata SET filerstreetcountycd = NULL WHERE filerstreetcountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_filerdata SET filermailingcountycd = NULL WHERE filermailingcountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_loandata SET lenderstreetcountycd = NULL WHERE lenderstreetcountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_pledgedata SET pledgerstreetcountycd = NULL WHERE pledgerstreetcountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_spacdata SET ctaseekofficecountycd = NULL WHERE ctaseekofficecountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_spacdata SET candidateseekofficecountycd = NULL WHERE candidateseekofficecountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.c_spacdata SET candidateholdofficecountycd = NULL WHERE candidateholdofficecountycd IN ( 'OTHER', 'UNKNOWN', '' );
UPDATE test.tec.l_individualreportingdata SET onbehalfmailingcountycd = NULL WHERE onbehalfmailingcountycd IN ( 'OTHER', 'UNKNOWN', '' );

-- END;

UPDATE tec.c_candidatedata
SET candidateholdofficecd = NULL
WHERE candidateholdofficecd = 'T';

UPDATE tec.c_candidatedata
SET expendCatCd = NULL
WHERE expendCatCd IN ('', 'UNKNOWN');

UPDATE tec.c_expenddata
SET expendCatCd = NULL
WHERE expendCatCd IN ('', 'UNKNOWN');

-- The CSV schema dumps as seperate columns
-- But the readme shows it as an array
-- So we convert back to array
BEGIN;
	ALTER TABLE tec.c_coversheet1data
		ADD COLUMN reporttype text[];

	UPDATE tec.c_coversheet1data
	SET reporttype = array_remove(ARRAY[
		reportTypeCd1,reportTypeCd2,reportTypeCd3,reportTypeCd4,reportTypeCd5,
		reportTypeCd6,reportTypeCd7,reportTypeCd8,reportTypeCd9,reportTypeCd10
	],null);

	ALTER TABLE tec.c_coversheet1data
		DROP COLUMN reportTypeCd1, DROP COLUMN reportTypeCd2, DROP COLUMN reportTypeCd3, DROP COLUMN reportTypeCd4, DROP COLUMN reportTypeCd5,
		DROP COLUMN reportTypeCd6, DROP COLUMN reportTypeCd7, DROP COLUMN reportTypeCd8, DROP COLUMN reportTypeCd9, DROP COLUMN reportTypeCd10;

	UPDATE tec.c_coversheet1data
	SET filerholdofficecd = NULL
	WHERE filerholdofficecd = 'T';
COMMIT;
	
