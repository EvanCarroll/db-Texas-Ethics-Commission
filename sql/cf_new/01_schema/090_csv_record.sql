DROP TABLE IF EXISTS tec.codes_csv_record;
CREATE TABLE tec.codes_csv_record (
	csv_record_type     text PRIMARY KEY,
	csv_record_number   text,
	csv_record_notes    text
);

INSERT INTO tec.codes_csv_record
VALUES
	( 'REPORT group'       , '1'         , 'See Table 4' ),
	( 'COMMACTIVITY'       , '0 or more' , NULL ),
	( 'CONTRIBUTION group' , '0 or more' , 'See Table 5' ),
	( 'CREDIT'             , '0 or more' , NULL ),
	( 'EXPEND group'       , '0 or more' , 'See Table 6'  ),
	( 'LOAN group'         , '0 or more' , 'See Table 7' ),
	( 'PLEDGE group'       , '0 or more' , 'See Table 8' );
