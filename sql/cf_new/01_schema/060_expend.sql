DROP TABLE IF EXISTS tec.codes_expend;
CREATE TABLE tec.codes_expend (
	expend_type     text PRIMARY KEY,
	expend_number   text,
	expend_notes    text
);

INSERT INTO tec.codes_expend
VALUES
	( 'EXPEND'      , '1'         , 'Basic information about an expenditure' ),
	( 'EXPENDNOCON' , '0 or more' , 'Information about a single no consent for the expenditure' ),
	( 'TRAVEL'      , '0 or more' , 'Information about a single travel item for the expenditure'  );
