DROP TABLE IF EXISTS tec.codes_reports;

CREATE TABLE tec.codes_reports (
	report_id   text PRIMARY KEY,
	report_name text
);

INSERT INTO tec.codes_reports
VALUES
	( '500EXCEED'       ,'Exceeded $500 limit' ),
	( 'A10DAYAFT'       ,'10th day after campaign treasurer termination' ),
	( 'A15DAYAFT'       ,'15 day after treasurer appointment' ),
	( 'BRSSPK'          ,'Speaker-Day Before Regular Session Convenes Report' ),
	( 'BSSSPK'          ,'Speaker-Day Before Special Session Convenes Report' ),
	( 'CFAPR'           ,'CF Monthly Report - April' ),
	( 'CFAUG'           ,'CF Monthly Report - August' ),
	( 'CFDEC'           ,'CF Monthly Report - December' ),
	( 'CFFEB'           ,'CF Monthly Report - February' ),
	( 'CFJAN'           ,'CF Monthly Report - January' ),
	( 'CFJUL'           ,'CF Monthly Report - July' ),
	( 'CFJUN'           ,'CF Monthly Report - June' ),
	( 'CFMAR'           ,'CF Monthly Report - March' ),
	( 'CFMAY'           ,'CF Monthly Report - May' ),
	( 'CFNOV'           ,'CF Monthly Report - November' ),
	( 'CFOCT'           ,'CF Monthly Report - October' ),
	( 'CFSEP'           ,'CF Monthly Report - September' ),
	( 'CFTREASAPPT'     ,'CF Appointment of a Campaign Treasurer' ),
	( 'DAILYCCOH'       ,'Daily Pre-Election Report of Contributions' ),
	( 'DAILYCPAC'       ,'Daily Pre-Election Report of Contributions' ),
	( 'DAILYEPAC'       ,'Daily Pre-Election Report of Expenditures' ),
	( 'E08DAYBEF'       ,'8th day before election' ),
	( 'E30DAYBEF'       ,'30th day before election' ),
	( 'E50DAYBEF'       ,'50th day before general election' ),
	( 'FINAL'           ,'Final' ),
	( 'LOBBYACT1000EX'  ,'Lobby Activities Exceeded $1000 Report' ),
	( 'LOBBYACTANNUAL'  ,'Modified Lobby Activities Report (Annual)' ),
	( 'LOBBYACTAPR'     ,'Regular Lobby Activities Report - April' ),
	( 'LOBBYACTAUG'     ,'Regular Lobby Activities Report - August' ),
	( 'LOBBYACTDEC'     ,'Regular Lobby Activities Report - December' ),
	( 'LOBBYACTFEB'     ,'Regular Lobby Activities Report - February' ),
	( 'LOBBYACTJAN'     ,'Regular Lobby Activities Report - January' ),
	( 'LOBBYACTJUL'     ,'Regular Lobby Activities Report - July' ),
	( 'LOBBYACTJUN'     ,'Regular Lobby Activities Report - June' ),
	( 'LOBBYACTMAR'     ,'Regular Lobby Activities Report - March' ),
	( 'LOBBYACTMAY'     ,'Regular Lobby Activities Report - May' ),
	( 'LOBBYACTNOV'     ,'Regular Lobby Activities Report - November' ),
	( 'LOBBYACTOCT'     ,'Regular Lobby Activities Report - October' ),
	( 'LOBBYACTSEP'     ,'Regular Lobby Activities Report - September' ),
	( 'LOBBYAREG_MOD'   ,'Modified Lobby Amended Registration Report (Annual Reporting Schedule)' ),
	( 'LOBBYAREG_REG'   ,'Regular Lobby Amended Registration Report (Monthly Reporting Schedule)' ),
	( 'LOBBYFINAL'      ,'Lobby Final Report' ),
	( 'LOBBYREG_MOD'    ,'Modified Lobby Registration Report (Annual Reporting Schedule)' ),
	( 'LOBBYREG_REG'    ,'Regular Lobby Registration Report (Monthly Reporting Schedule)' ),
	( 'PACDR'           ,'Dissolution' ),
	( 'PFS'             ,'Personal Financial Statement' ),
	( 'RUNOFF'          ,'Runoff' ),
	( 'SEMIJAN'         ,'January 15th semiannual' ),
	( 'SEMIJUL'         ,'July 15th semiannual' ),
	( 'SPKJAN'          ,'Speaker of the House of Representatives Report JAN 1' ),
	( 'SPKJUL'          ,'Speaker of the House of Representatives Report JULY 1' ),
	( 'SPKMAR'          ,'Speaker of the House of Representatives Report MAR 1' ),
	( 'SPKMAY'          ,'Speaker of the House of Representatives Report MAY 1' ),
	( 'SPKNOV'          ,'Speaker of the House of Representatives Report NOV 1' ),
	( 'SPKSEP'          ,'Speaker of the House of Representatives Report SEPT 1' ),
	( 'SPKUC'           ,'Speaker Annual Report of Unexpended Contributions' ),
	( 'SS'              ,'Legislative Special Session Report' ),
	( 'UNEXPCONT'       ,'Unexpended Contributions Report-Annual' ),
	( 'UNEXPCONT_FINAL' ,'Unexpended Contributions Report-Final' ),
	( 'UNKNOWN'         ,'Unknown' );
