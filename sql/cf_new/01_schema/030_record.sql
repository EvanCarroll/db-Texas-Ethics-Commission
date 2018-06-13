DROP TABLE IF EXISTS tec.codes_record;
CREATE TABLE tec.codes_record (
	record_type        text PRIMARY KEY,
	record_parent      text,
	record_description text
);

INSERT INTO tec.codes_record
VALUES
	( 'ANNOTATION'    , ARRAY['REPORT']                           , 'Text annotation' ),
	( 'ASSET'         , ARRAY['REPORT']                           , 'Asset' ),
	( 'COMMACTIVITY'  , ARRAY['REPORT']                           , 'Committee activity' ),
	( 'CONTRIBUTION'  , ARRAY['REPORT']                           , 'Contribution' ),
	( 'COVERED'       , ARRAY['REPORT']                           , 'Report type covered' ),
	( 'CREDIT'        , ARRAY['REPORT']                           , 'Credit' ),
	( 'EXPEND'        , ARRAY['REPORT']                           , 'Expenditure' ),
	( 'EXPENDNOCON'   , ARRAY['EXPEND']                           , 'No consent for an expenditure' ),
	( 'LAWFIRM'       , ARRAY['CONTRIBUTION', 'LOAN', 'PLEDGE']   , 'Law firm' ),
	( 'LOAN'          , ARRAY['REPORT']                           , 'Loan' ),
	( 'LOANGUAR'      , ARRAY['LOAN']                             , 'Guarantor for a loan' ),
	( 'PLEDGE'        , ARRAY['REPORT']                           , 'Pledge' ),
	( 'REPORT'        , NULL                                      , 'Report' ),
	( 'TOTAL'         , ARRAY['REPORT']                           , 'Report total' ),
	( 'TRAVEL'        , ARRAY['CONTRIBUTION', 'EXPEND', 'PLEDGE'] , 'Travel' );
