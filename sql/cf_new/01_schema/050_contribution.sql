DROP TABLE IF EXISTS tec.codes_contribution;
CREATE TABLE tec.codes_contribution (
	contribution_type        text PRIMARY KEY,
	contribution_number      text,
	contribution_notes text
);

INSERT INTO tec.codes_contribution
VALUES
	( 'CONTRIBUTION' , '1'         , 'Basic information about a contribution' ),
	( 'LAWFIRM'      , '0 or more' , 'Information about lawfirm associated with contributor' ),
	( 'TRAVEL'       , '0 or more' , 'Information about a single travel item for the contribution' );
