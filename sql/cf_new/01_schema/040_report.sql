DROP TABLE IF EXISTS tec.codes_report;
CREATE TABLE tec.codes_report (
	report_type        text PRIMARY KEY,
	report_parent      text,
	report_description text
);

INSERT INTO tec.codes_report
VALUES
	( 'REPORT'     , '1'         , 'Basic information about a report' ),
	( 'COVERED'    , '0 or more' , NULL ),
	( 'TOTAL'      , '1 or more' , 'Normally, there are 10 or more of these ' ),
	( 'ANNOTATION' , '0 or more' , NULL ),
	( 'ASSET'      , '0 or more' , NULL );
