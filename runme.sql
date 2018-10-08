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
\i sql/cf_new/02_data/6_office.sql
\i sql/cf_new/02_data/7_report.sql
\i sql/cf_new/02_data/8_counties.sql
\i sql/cf_new/02_data/9_total.sql

\echo LOADING FORM 1295 [1295Certificates.csv]
\i sql/form1295.sql

\echo LOADING CAMPAIGN FINANCE REPORTS [TEC_CF_CSV.zip]
\i sql/gen/TEC_CF_CSV/10_ExpendCategory.sql
\i sql/gen/TEC_CF_CSV/11_FilerData.sql
\i sql/gen/TEC_CF_CSV/12_FinalData.sql
\i sql/gen/TEC_CF_CSV/13_LoanData.sql
\i sql/gen/TEC_CF_CSV/14_PledgeData.sql
\i sql/gen/TEC_CF_CSV/15_SpacData.sql
\i sql/gen/TEC_CF_CSV/16_TravelData.sql
\i sql/gen/TEC_CF_CSV/01_AssetData.sql
\i sql/gen/TEC_CF_CSV/02_CandidateData.sql
\i sql/gen/TEC_CF_CSV/03_ContributionData.sql
\i sql/gen/TEC_CF_CSV/04_CoverSheet1Data.sql
\i sql/gen/TEC_CF_CSV/05_CoverSheet2Data.sql
\i sql/gen/TEC_CF_CSV/06_CoverSheet3Data.sql
\i sql/gen/TEC_CF_CSV/07_CreditData.sql
\i sql/gen/TEC_CF_CSV/08_DebtData.sql
\i sql/gen/TEC_CF_CSV/09_ExpendData.sql

\echo LOADING LOBY REPORTS [TEC_LA_CSV.zip]
\i sql/gen/TEC_LA_CSV/01_CoverSheetLaData.sql
\i sql/gen/TEC_LA_CSV/02_IndividualReportingData.sql
\i sql/gen/TEC_LA_CSV/03_SubjectMatterData.sql
\i sql/gen/TEC_LA_CSV/04_DocketData.sql
\i sql/gen/TEC_LA_CSV/05_TransportationData.sql
\i sql/gen/TEC_LA_CSV/06_FoodBeverageData.sql
\i sql/gen/TEC_LA_CSV/07_EntertainmentData.sql
\i sql/gen/TEC_LA_CSV/08_GiftData.sql
\i sql/gen/TEC_LA_CSV/09_AwardMementoData.sql
\i sql/gen/TEC_LA_CSV/10_EventData.sql

BEGIN;
	INSERT INTO tec.codes_office (office_id)
	VALUES ('DISTATTY_HR'), ('JUSTICEAPP'), ('SCJ'), ('JUDGECRIM'), ('DISTATTY_MULTI_KL_KN'), ('COMPTROLLR'), ('CRIMAL_DISTATTY');

	UPDATE tec.candidatedata
	SET candidateholdofficecd = NULL
	WHERE candidateholdofficecd = 'T';

	UPDATE tec.coversheet1data
	SET filerholdofficecd = NULL
	WHERE filerholdofficecd = 'T';

	UPDATE tec.CandidateData
		SET expendCatCd = NULL
		WHERE expendCatCd IN ('', 'UNKNOWN');

	ALTER TABLE tec.CandidateData
		ADD FOREIGN KEY ( expendCatCd )
		REFERENCES tec.ExpendCategory;
COMMIT;

-- The CSV schema dumps as seperate columns
-- But the readme shows it as an array
-- So we convert back to array
BEGIN;
	ALTER TABLE tec.coversheet1data
		ADD COLUMN reporttype text[];
	UPDATE tec.coversheet1data
		SET reporttype = array_remove(ARRAY[
			reportTypeCd1,reportTypeCd2,reportTypeCd3,reportTypeCd4,reportTypeCd5,
			reportTypeCd6,reportTypeCd7,reportTypeCd8,reportTypeCd9,reportTypeCd10
	],null);
	ALTER TABLE tec.coversheet1data
		DROP COLUMN reportTypeCd1, DROP COLUMN reportTypeCd2, DROP COLUMN reportTypeCd3, DROP COLUMN reportTypeCd4, DROP COLUMN reportTypeCd5,
		DROP COLUMN reportTypeCd6, DROP COLUMN reportTypeCd7, DROP COLUMN reportTypeCd8, DROP COLUMN reportTypeCd9, DROP COLUMN reportTypeCd10;
COMMIT;
