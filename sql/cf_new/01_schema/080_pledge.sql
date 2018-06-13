DROP TABLE IF EXISTS tec.codes_pledge;
CREATE TABLE tec.codes_pledge (
	pledge_type     text PRIMARY KEY,
	pledge_number   text,
	pledge_notes    text
);

INSERT INTO tec.codes_pledge
VALUES
	( 'PLEDGE'  , '1'          , 'Basic information about a pledge' ),
	( 'LAWFIRM' , '0 or more'  , 'Information about lawfirm associated with the pledger' ),
	( 'TRAVEL'  , '0 or more'  , 'Information about a single travel item for the pledge' );
