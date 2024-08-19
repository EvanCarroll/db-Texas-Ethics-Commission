\echo DROP ALL IF EXISTS 'l_*'

DO $$
DECLARE
	_sql text;
BEGIN
	FOR _sql IN SELECT FORMAT(
      'DROP TABLE IF EXISTS %I.%I.%I CASCADE;',
      table_catalog,
      table_schema,
      table_name
    )
    FROM information_schema.tables
    WHERE table_name LIKE 'l\_%'
    AND table_type = 'BASE TABLE'
	LOOP
		EXECUTE _sql;
	END LOOP;
END
$$ LANGUAGE plpgsql;

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

UPDATE tec.l_coversheetladata SET filernameprefixcd = NULL WHERE filernameprefixcd = 'ME';
UPDATE tec.l_foodbeveragedata SET recipientnamesuffixcd = NULL WHERE recipientnamesuffixcd = 'MR';
UPDATE tec.l_awardmementodata SET recipientnamesuffixcd = NULL WHERE recipientnamesuffixcd = 'MR';
UPDATE tec.l_eventdata SET recipientnamesuffixcd = NULL WHERE recipientnamesuffixcd = 'MR';

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
      AND relname LIKE 'l\_%'
	LOOP
		EXECUTE _sql;
		GET DIAGNOSTICS rows_affected = ROW_COUNT;
		RAISE NOTICE '[%] %', rows_affected, _sql;
	END LOOP;
END
$$ LANGUAGE plpgsql;
