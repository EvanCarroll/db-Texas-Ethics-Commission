-- Created while TEC updates the CFS-Codes.txt file

DROP TABLE IF EXISTS codes_persent_types;

CREATE TABLE codes_persent_types (
	PersentTypeCd text PRIMARY KEY,
	PersentTypeName  text
);

INSERT INTO codes_persent_types( persentTypeCd, persentTypeName )
VALUES
	( 'INDIVIDUAL',   'INDIVIDUAL' ),
	( 'ENTITY',   'Entity' ),
	( 'NOT_OFFICEHOLDER',   'Not Officeholder' ),
	( 'OFFICEHOLDER',   'Officeholder' ),
	( 'CANDIDATE',   'Candidate' ),
	( 'POLITICAL_COMMITTEE',   'Political Committee' ),
	( 'PAC_SUPPORT_ORGANIZATION',   'PAC Support Organization' ),
	( 'SPAC_SUPPORT_ORGANIZATION',   'SPAC Support Org'),
	( 'GPACSUPPORT',  'GPAC support' ),
	( 'SPACSUPPORT',  'SPAC support' ),
	-- filerFilerPersentTypeCd values added 2026 01
	( 'ACTIVE',  'Active' ),
	( 'X',  'X' ),
	( 'CURRENT_OFFICEHOLDER',  'Current Officeholder' )
;

DROP TABLE IF EXISTS codes_states;
CREATE TABLE codes_states (
	state_code char(2) PRIMARY KEY,
	state_name text
);

INSERT INTO codes_states (state_code, state_name)
VALUES
('AL','ALABAMA'),
('AK','ALASKA'),
('AB','ALBERTA'),
('AS','AMERICAN SAMOA'),
('AZ','ARIZONA'),
('AR','ARKANSAS'),
('BC','BRITISH COLUMBIA'),
('CA','CALIFORNIA'),
('PW','CAROLINE ISLANDS'),
('CO','COLORADO'),
('CT','CONNECTICUT'),
('DE','DELAWARE'),
('DC','DISTRICT OF COLUMBIA'),
('FM','FEDERATED STATES OF MICRONESIA'),
('FL','FLORIDA'),
('GA','GEORGIA'),
('GU','GUAM'),
('HI','HAWAII'),
('ID','IDAHO'),
('IL','ILLINOIS'),
('IN','INDIANA'),
('IA','IOWA'),
('KS','KANSAS'),
('KY','KENTUCKY'),
('LA','LOUISIANA'),
('ME','MAINE'),
('MB','MANITOBA'),
('MP','MARIANA ISLANDS'),
('MH','MARSHALL ISLANDS'),
('MD','MARYLAND'),
('MA','MASSACHUSETTS'),
('MI','MICHIGAN'),
('MN','MINNESOTA'),
('MS','MISSISSIPPI'),
('MO','MISSOURI'),
('MT','MONTANA'),
('NE','NEBRASKA'),
('NV','NEVADA'),
('NB','NEW BRUNSWICK'),
('NH','NEW HAMPSHIRE'),
('NJ','NEW JERSEY'),
('NM','NEW MEXICO'),
('NY','NEW YORK'),
('NF','NEWFOUNDLAND'),
('NC','NORTH CAROLINA'),
('ND','NORTH DAKOTA'),
('NT','NORTHWEST TERRITORIES'),
('NS','NOVA SCOTIA'),
('NU','NUNAVUT'),
('OH','OHIO'),
('OK','OKLAHOMA'),
('ON','ONTARIO'),
('OR','OREGON'),
('PA','PENNSYLVANIA'),
('PE','PRINCE EDWARD ISLAND'),
('PR','PUERTO RICO'),
('PQ','QUEBEC'),
('RI','RHODE ISLAND'),
('SK','SASKATCHEWAN'),
('SC','SOUTH CAROLINA'),
('SD','SOUTH DAKOTA'),
('TN','TENNESSEE'),
('TX','TEXAS'),
('UT','UTAH'),
('VT','VERMONT'),
('VI','VIRGIN ISLANDS'),
('VA','VIRGINIA'),
('WA','WASHINGTON'),
('WV','WEST VIRGINIA'),
('WI','WISCONSIN'),
('WY','WYOMING'),
('YT','YUKON TERRITORY'),
('AE','ARMED FORCES - EUROPE'),
('AA','ARMED FORCES - AMERICAS'),
('AP','ARMED FORCES - PACIFIC'),
('ZZ','FOREIGN COUNTRY'),
('XX','UNKNOWN')
;

-- Additional 2-character codes found in TEC data
INSERT INTO codes_states (state_code, state_name)
VALUES
('NL','NETHERLANDS'),
('UM','US MINOR OUTLYING ISLANDS'),
('TE','UNKNOWN'),
('BA','BOSNIA AND HERZEGOVINA'),
('CZ','CZECH REPUBLIC'),
('LY','LIBYA'),
('DA','UNKNOWN'),
('HO','UNKNOWN'),
('KA','UNKNOWN'),
('BR','BRAZIL'),
('EL','UNKNOWN'),
('EN','UNKNOWN'),
('SA','SAUDI ARABIA'),
('ZH','UNKNOWN'),
('BO','BOLIVIA'),
('LO','UNKNOWN'),
('CY','CYPRUS'),
('FI','FINLAND'),
('SU','UNKNOWN'),
('SP','SPAIN'),
('OM','OMAN'),
('KI','KIRIBATI'),
('TH','THAILAND'),
('GB','GREAT BRITAIN'),
('QL','QUEENSLAND'),
('GR','GREECE'),
('FS','UNKNOWN'),
('UN','UNKNOWN'),
('RZ','UNKNOWN'),
('BE','BELGIUM')
ON CONFLICT (state_code) DO NOTHING;
