\echo Schema generation for the Texas Ethics Commission
\echo Copyright (C) 2024  Evan Carroll
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


SET SEARCH_PATH = 'tec';

DROP SCHEMA IF EXISTS tec CASCADE;
CREATE SCHEMA tec;
COMMENT ON SCHEMA tec IS $$Texas Ethics Comission dataset$$;


\echo LOADING CODES GENERATED FROM PDF

\i sql/cf_new/1_filertype.sql
\i sql/cf_new/02_data/4_countries.sql
\i sql/cf_new/02_data/5_office.sql
\i sql/cf_new/02_data/6_reports.sql
\i sql/cf_new/02_data/7_forms.sql
\i sql/cf_new/02_data/8_counties.sql
\i sql/cf_new/02_data/9_total.sql

\echo LOADING FORM 1295 [1295Certificates.csv]
\i sql/form1295.sql

\echo LOADING CAMPAIGN FINANCE REPORTS [TEC_CF_CSV.zip]
\i sql/gen/TEC_CF_CSV/12_c_FilerData.sql
\i sql/gen/TEC_CF_CSV/04_c_CoverSheet1Data.sql
\i sql/gen/TEC_CF_CSV/11_c_ExpendCategory.sql
\i sql/gen/TEC_CF_CSV/13_c_FinalData.sql
\i sql/gen/TEC_CF_CSV/14_c_LoanData.sql
\i sql/gen/TEC_CF_CSV/15_c_PledgeData.sql
\i sql/gen/TEC_CF_CSV/16_c_SpacData.sql
\i sql/gen/TEC_CF_CSV/17_c_TravelData.sql
\i sql/gen/TEC_CF_CSV/01_c_AssetData.sql
\i sql/gen/TEC_CF_CSV/02_c_CandidateData.sql
\i sql/gen/TEC_CF_CSV/03_c_ContributionData.sql
\i sql/gen/TEC_CF_CSV/05_c_CoverSheet2Data.sql
\i sql/gen/TEC_CF_CSV/06_c_CoverSheet3Data.sql
\i sql/gen/TEC_CF_CSV/07_c_CreditData.sql
\i sql/gen/TEC_CF_CSV/08_c_DebtData.sql
\i sql/gen/TEC_CF_CSV/09_c_ExpendData.sql
\i sql/gen/TEC_CF_CSV/10_c_ExpendRepayment.sql


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

SET SEARCH_PATH TO tec;

-- UPDATE tec.c_filerdata
-- 	SET ctaseekofficecd = NULL
-- 	WHERE ctaseekofficecd = 'COL_MULTI_2';
-- 
-- UPDATE tec.c_filerdata
-- 	SET filerholdofficecd = NULL
-- 	WHERE filerholdofficecd = 'COL_MULTI_2';

UPDATE tec.tec.c_filerdata
	SET contestseekofficecd = 'COL_MULTI_2'
	WHERE contestseekofficecd = ' COL_MULTI_2';
UPDATE tec.tec.c_filerdata
	SET contestseekofficecd = 'LANDCOMM'
	WHERE contestseekofficecd = ' LANDCOMM';
-- 
-- UPDATE c_coversheet3data
-- 	SET activityseekofficecd = NULL
-- 	WHERE activityseekofficecd = 'COL_MULTI_1';

-- data integrity problems
UPDATE c_CandidateData
	SET CandidateHoldOfficeCd = NULL
	WHERE CandidateHoldOfficeCd = 'T';
UPDATE c_CandidateData
	SET CandidateSeekOfficeCd = NULL
	WHERE CandidateSeekOfficeCd = 'T';
UPDATE c_CoverSheet1Data
	SET filerholdofficecd = NULL
	WHERE filerholdofficecd = 'T';

UPDATE c_CandidateData
	SET CandidateHoldOfficeCd = 'COMPTROLLER'
	WHERE CandidateHoldOfficeCd = 'COMPTROLLR';
UPDATE c_CandidateData
	SET CandidateSeekOfficeCd = 'COMPTROLLER'
	WHERE CandidateSeekOfficeCd = 'COMPTROLLR';
UPDATE c_CoverSheet1Data
	SET filerholdofficecd = 'COMPTROLLER'
	WHERE filerholdofficecd = 'COMPTROLLR';
UPDATE c_CoverSheet1Data
	SET filerseekofficecd = 'COMPTROLLER'
	WHERE filerseekofficecd = 'COMPTROLLR';
UPDATE c_CoverSheet1Data
	SET filerholdofficecd = 'CRIMINAL_DISTATTY'
	WHERE filerholdofficecd = 'CRIMAL_DISTATTY';
UPDATE c_CoverSheet1Data
	SET filerseekofficecd = 'CRIMINAL_DISTATTY'
	WHERE filerseekofficecd = 'CRIMAL_DISTATTY';

UPDATE c_coversheet3data
	SET activityseekofficecd = NULL
	WHERE activityseekofficecd = 'T';

DO $$
DECLARE
	_sql text;
	rows_affected INT;
BEGIN
	--SET CONSTRAINTS ALL DEFERRED;
	-- officecd supports other, these do not.
	FOR _sql IN SELECT FORMAT(
			$sql$ UPDATE %I.%I.%I SET %I = NULL WHERE %I IN ( 'UNKNOWN', '', 'OTHER' ); $sql$,
			table_catalog,
			table_schema,
			table_name,
			column_name,
			column_name
		)
		FROM information_schema.columns
		WHERE table_schema = 'tec'
			AND column_name LIKE ANY(ARRAY['%countycd', '%expendcatcd'])
		ORDER BY table_catalog, table_schema, table_name
	LOOP
		RAISE NOTICE '%', _sql;
		EXECUTE _sql;
		GET DIAGNOSTICS rows_affected = ROW_COUNT;
		RAISE NOTICE '	Rows Affected: %', rows_affected;
		COMMIT;
	END LOOP;
END
$$ LANGUAGE plpgsql;

-- Having the two UPDATES modify the same row in the same transaction is problematic
DO $$
DECLARE
	_sql text;
	rows_affected INT;
BEGIN
	--SET CONSTRAINTS ALL DEFERRED;
	FOR _sql IN SELECT FORMAT(
			$sql$ UPDATE %I.%I.%I SET %I = NULL WHERE %I IN ( 'UNKNOWN', '' ); $sql$,
			table_catalog,
			table_schema,
			table_name,
			column_name,
			column_name
		)
		FROM information_schema.columns
		WHERE table_schema = 'tec'
			AND column_name LIKE ANY(ARRAY['%officecd'])
		ORDER BY table_catalog, table_schema, table_name
	LOOP
		RAISE NOTICE '%', _sql;
		EXECUTE _sql;
		GET DIAGNOSTICS rows_affected = ROW_COUNT;
		RAISE NOTICE '	Rows Affected: %', rows_affected;
		COMMIT;
	END LOOP;
END
$$ LANGUAGE plpgsql;

-- The CSV schema dumps as seperate columns
-- But the readme shows it as an array
-- So we convert back to array
BEGIN;
	ALTER TABLE c_coversheet1data
		ADD COLUMN reporttype text[];

	UPDATE c_coversheet1data
	SET reporttype = array_remove(ARRAY[
		reportTypeCd1,reportTypeCd2,reportTypeCd3,reportTypeCd4,reportTypeCd5,
		reportTypeCd6,reportTypeCd7,reportTypeCd8,reportTypeCd9,reportTypeCd10
	],null);

	ALTER TABLE c_coversheet1data
		DROP COLUMN reportTypeCd1, DROP COLUMN reportTypeCd2, DROP COLUMN reportTypeCd3, DROP COLUMN reportTypeCd4, DROP COLUMN reportTypeCd5,
		DROP COLUMN reportTypeCd6, DROP COLUMN reportTypeCd7, DROP COLUMN reportTypeCd8, DROP COLUMN reportTypeCd9, DROP COLUMN reportTypeCd10;

COMMIT;

--
-- Now let's try to validate all the constriants.
--
DO $$
DECLARE
	_sql text;
	rows_affected INT;
BEGIN
	FOR _sql IN SELECT FORMAT(
			'ALTER TABLE %I.%I.%I VALIDATE CONSTRAINT %I;',
			current_database(),
			nsp.nspname,
			cls.relname,
			con.conname
		)
		FROM pg_constraint AS con
		JOIN pg_class AS cls
			ON con.conrelid = cls.oid
		JOIN pg_namespace AS nsp
			ON cls.relnamespace = nsp.oid
		WHERE convalidated IS FALSE
	LOOP
		EXECUTE _sql;
		GET DIAGNOSTICS rows_affected = ROW_COUNT;
		RAISE NOTICE '[%] %', rows_affected, _sql;
	END LOOP;
END
$$ LANGUAGE plpgsql;

VACUUM FULL ANALYZE;
