DROP TABLE IF EXISTS codes_offices;

CREATE TABLE codes_offices (
	office_code text PRIMARY KEY,
	office_name text
);

INSERT INTO codes_offices
VALUES
	-- List from https://www.ethics.state.tx.us/data/search/cf/CFS-Codes.txt
	( 'AGRICULTUR'               , 'Agriculture Commissioner' ),
	( 'ATTYGEN'                  , 'Attorney General' ),
	( 'CHIEFJUSTICE_COA'         , 'Court of Appeals, Chief Justice' ),
	( 'CHIEFJUSTICE_SC'          , 'Supreme Court Chief Justice' ),
	( 'COL_MULTI_1'              , '1st Multicounty Court Of Law' ),
	( 'COL_MULTI_2'              , '2nd Multicounty Court Of Law' ),
	( 'COMPTROLLER'              , 'Comptroller' ),
	( 'CRIMINAL_DISTATTY'        , 'Criminal District Attorney' ),
	( 'CRIMINAL_JUDGEDIST'       , 'Criminal District Court Judge' ),
	( 'CRIMINAL_JUDGEDIST_DAL'   , 'Criminal District Court Judge, Dallas Co.' ),
	( 'CRIMINAL_JUDGEDIST_JEF'   , 'Criminal District Court Judge, Jefferson Co.' ),
	( 'CRIMINAL_JUDGEDIST_TAR'   , 'Criminal District Court Judge, Tarrant Co.' ),
	( 'DISTATTY'                 , 'District Attorney' ),
	( 'DISTATTY_MULTI'           , 'District Attorney (Multi-county)' ),
	( 'GOVERNOR'                 , 'Governor' ),
	( 'JUDGE_COCA'               , 'Court of Criminal Appeals, Judge' ),
	( 'JUDGEDIST'                , 'District Judge' ),
	( 'JUDGEDIST_FAMILY'         , 'Family District Court Judge' ),
	( 'JUDGEDIST_MULTI'          , 'District Judge (Multi-county)' ),
	( 'JUDGE_SENIOR'             , 'Senior Judge' ),
	( 'JUDGESTATCO'              , 'Statutory County Judge' ),
	( 'JUSTICE_COA'              , 'Court of Appeals, Justice' ),
	( 'JUSTICE_SC'               , 'Supreme Court Justice' ),
	( 'LANDCOMM'                 , 'Land Commissioner' ),
	( 'LTGOVERNOR'               , 'Lieutenant Governor' ),
	( 'NONE'                     , 'None' ),
	( 'OTHER'                    , 'Other Office' ),
	( 'PARTYCHAIRCO'             , 'County Party Chair' ),
	( 'PRESIDINGJUDGE_COCA'      , 'Court of Criminal Appeals, Presiding Judge' ),
	( 'RRCOMM'                   , 'Railroad Commissioner' ),
	( 'RRCOMM_UNEXPIRED'         , 'Railroad Commissioner, Unexpired Term' ),
	( 'SOS'                      , 'Secretary of State' ),
	( 'STATE_CHAIR'              , 'State Chairman' ),
	( 'STATEEDU'                 , 'State Board of Education' ),
	( 'STATEREP'                 , 'State Representative' ),
	( 'STATESEN'                 , 'State Senator' ),
	( 'X'                        , 'Legacy Only' ),

	( 'DISTATTY_HR'              , 'District Attorney, Harris Co.' ),
	( 'DISTATTY_MULTI_KL_KN'     , 'District Attorney, Kleberg and Kenedy Co.' )
;

-- Needs both SJC and SCJ, not found in original set
INSERT INTO codes_offices (office_code)
VALUES ('JUSTICEAPP'), ('SJC'), ('SCJ'), ('JUDGECRIM'), ('AGUASUDDIR'), ('JUDGE_BUS'), ('JUDGEDIST_BUS');
