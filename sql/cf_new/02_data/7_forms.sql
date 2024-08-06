DROP TABLE IF EXISTS tec.codes_forms;

-- https://www.ethics.state.tx.us/data/search/cf/CFS-Codes.txt
CREATE TABLE tec.codes_forms (
	form_id          text PRIMARY KEY,
	form_description text
);
INSERT INTO tec.codes_forms
VALUES
	-- From https://www.ethics.state.tx.us/data/search/cf/CFS-Codes.txt
	( 'COH',            'Candidate/Officeholder' ),
	( 'JCOH',           'Judicial Candidate/Officeholder' ),
	( 'COHFR',          'Candidate/Officeholder Designation of Final Report' ),
	( 'COHUC',          'Unexpended Contributions For Candidates/Officeholders' ),
	( 'COHSS',          'Candidate/Officeholder Special Session Report' ),
	( 'SCCOH',          'State/County Chair Candidate/Officeholder' ),
	( 'SCCOHFR',        'State/County Chair Candidate/Officeholder Designation of Final Report' ),
	( 'GPAC',           'General-Purpose Committee' ),
	( 'MPAC',           'Monthly Filing General-Purpose Committee' ),
	( 'SPAC',           'Specific-Purpose Committee' ),
	( 'SPACSS',         'Specific-Purpose Committee Special Session Report' ),
	( 'JSPAC',          'Judicial Specific-Purpose Committee' ),
	( 'JSPACSS',        'Judicial Specific-Purpose Committee Special Session Report' ),
	( 'SCSPAC',         'State/County Specific-Purpose Committee' ),
	( 'DCE',            'Report of Direct Campaign Expenditures' ),
	( 'PACDR',          'Political Committee Affidavit of Dissolution' ),
	( 'JSPACDR',        'Judicial Specific-Purpose Committee Affidavit of Dissolution' ),
	( 'SCSPACDR',       'State/County Specific-Purpose Committee Affidavit of Dissolution' ),
	( 'CEC',            'County Executive Committee' ),
	( 'MCEC',           'Monthly Filing County Executive Committee' ),
	( 'PTYCORP',        'Political Party Report Regarding Funds from Corporations and Labor Organizations' ),
	( 'SPK',            'Candidate For Speaker Of The Texas House Of Representatives' ),
	( 'SPKUC',          'Unexpended Contributions For Former Candidate For Speaker Of The Texas House Of Representatives' ),
	( 'LEG',            'Legislative Caucus Report of Contributions and Expenditures' ),
	( 'ASIFSPAC',       'As-If Specific Purpose Committee' ),
	( 'DAILYCCOH',      'Candidate/Officeholder Daily Pre-Election Report' ),
	( 'DAILYCPAC',      'Political Committee Daily Pre-Election Report of Contributions' ),
	( 'DAILYEPAC',      'Political Committee Daily Pre-Election Report of Expenditures' ),
	( 'DIRE',           'Daily Pre-Election Report of Direct Expenditures' ),
	( 'CORCOH',         'Correction Affidavit For Candidate/Officeholder' ),
	( 'CORJCOH',        'Correction Affidavit For Judicial Candidate/Officeholder' ),
	( 'CORPAC',         'Correction Affidavit For Candidate/OfficeholdPolitical Committee' ),
	( 'CORPTY',         'Correction Affidavit For Political Party Report Regarding Funds from Corporations/Labor Organizations' ),
	( 'CORSPK',         'Correction Affidavit For Candidate For Speaker Of The Texas House Of Representatives' ),
	( 'CORLEG',         'Correction Affidavit For Legislative Caucus' ),
	( 'CORDAILYCCOH',   'Correction Affidavit For Candidate/Officeholder Daily Pre-Election Report' ),
	( 'CORDAILYCPAC',   'Correction Affidavit For Political Committee Daily Pre-Election Report of Contributions' ),
	( 'CORDAILYEPAC',   'Correction Affidavit For Political Committee Daily Pre-Election Report of Expenditures' ),

	-- From https://www.ethics.state.tx.us/data/search/cf/CFS-Codes.txt
	( 'LOBBYACT',       'Lobby Activities Report' ),
	( 'CORLOBBYACT',    'Corrected Lobby Activities Report' )
;
