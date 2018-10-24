DROP TABLE IF EXISTS tec.codes_office;

CREATE TABLE tec.codes_office (
	office_id   text PRIMARY KEY,
	office_name text UNIQUE
);

INSERT INTO tec.codes_office
VALUES
	( 'AGRICULTUR'               , 'Agriculture Commissioner' ),
	( 'ATTYGEN'                  , 'Attorney General' ),
	( 'CHIEFJUSTICE_COA'         , 'Court of Appeals,Chief Justice' ),
	( 'CHIEFJUSTICE_SC'          , 'Supreme Court Chief Justice' ),
	( 'COMPTROLLER'              , 'Comptroller' ),
	( 'CRIMINAL_DISTATTY'        , 'Criminal District Attorney' ),
	( 'CRIMINAL_JUDGEDIST'       , 'Criminal District Court Judge' ),
	( 'CRIMINAL_JUDGEDIST_DAL'   , 'Criminal District Court Judge, Dallas Co.' ),
	( 'CRIMINAL_JUDGEDIST_JEF'   , 'Criminal District Court Judge, Jefferson Co.' ),
	( 'CRIMINAL_JUDGEDIST_TAR'   , 'Criminal District Court Judge, Tarrant Co.' ),
	( 'DISTATTY'                 , 'District Attorney' ),
	( 'DISTATTY_MULTI'           , 'District Attorney (Multi-county)' ),
	( 'GOVERNOR'                 , 'Governor' ),
	( 'JUDGE_COCA'               , 'Court Of Criminal Appeals, Judge' ),
	( 'JUDGE_SENIOR'             , 'Senior Judge' ),
	( 'JUDGEDIST'                , 'District Judge' ),
	( 'JUDGEDIST_FAMILY'         , 'Family District Court Judge' ),
	( 'JUDGEDIST_MULTI'          , 'District Judge (Multi-county)' ),
	( 'JUDGESTATCO'              , 'Statutory County Judge' ),
	( 'JUSTICE_COA'              , 'Court Of Appeals, Justice' ),
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
	( 'STATEEDU'                 , 'State Board Of Education' ),
	( 'STATEREP'                 , 'State Representative' ),
	( 'STATESEN'                 , 'State Senator' ),
	( 'X'                        , 'Legacy Only' );

-- Needs both SJC and SCJ, not found in original set
INSERT INTO tec.codes_office (office_id)
VALUES ('DISTATTY_HR'), ('JUSTICEAPP'), ('SJC'), ('SCJ'), ('JUDGECRIM'), ('DISTATTY_MULTI_KL_KN');

