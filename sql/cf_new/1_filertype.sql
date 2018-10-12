--
-- I copied this data set from the html at this site
-- https://www.ethics.state.tx.us/TECFilerWeb/pages/home/forgotChallenge.jsf
-- Not all of these values are in the data, but this set covers all of the data.
--
CREATE TABLE tec.codes_filertype (
	filertype_id text PRIMARY KEY,
	filertype_name text UNIQUE
);

INSERT INTO tec.codes_filertype(filertype_id, filertype_name)
VALUES 
	( 'ASIFSPAC', 'AS-IF Specific-Purpose Committee' ),
	( 'CEC',      'County Executive Committee (Semiannual Filer)' ),
	( 'COH',      'Candidate/Officeholder (Non-judicial)' ),
	( 'DCE',      'Direct Campaign Expenditures' ),
	( 'GPAC',     'General-Purpose Committee (Semiannual Filer)' ),
	( 'JCOH',     'Judicial Candidate/Officeholder' ),
	( 'JSPC',     'Judicial Specific-Purpose Committee' ),
	( 'LEG',      'Legislative Caucus' ),
	( 'LOBB',     'Lobbyist' ),
	( 'MCEC',     'County Executive Committee (Monthly Filer)' ),
	( 'MPAC',     'General-Purpose Committee (Monthly Filer)' ),
	( 'PFS',      'Personal Financial Statement/State Officer' ),
	( 'PTYCORP',  'Political Party Report Regarding Corporate/Labor Funds' ),
	( 'SCC',      'State/County Chair Candidate' ),
	( 'SCPC',     'State/County Chair Specific-Purpose Committee' ),
	( 'SPAC',     'Specific-Purpose Committee (Non-judicial)' ),
	( 'SPK',      'Speaker of the House' );
