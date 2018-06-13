DROP TABLE IF EXISTS tec.codes_loan;
CREATE TABLE tec.codes_loan (
	loan_type     text PRIMARY KEY,
	loan_number   text,
	loan_notes    text
);

INSERT INTO tec.codes_loan
VALUES
	( 'LOAN'     , '1'        , 'Basic information about a loan' ),
	( 'LOANGUAR' , '0 or more', 'Information about a single guarantor for the loan' ),
	( 'LAWFIRM'  , '0 or more', 'Information about lawfirm associated with any lender/guarantor' );
