DROP TABLE IF EXISTS codes_counties;

CREATE TABLE codes_counties (
	county_code text PRIMARY KEY,
	county_name text UNIQUE
);
INSERT INTO codes_counties
VALUES
	( 'AD'  , 'Andrews' ),
	( 'AG'  , 'Angelina' ),
	( 'AM'  , 'Armstrong' ),
	( 'AN'  , 'Anderson' ),
	( 'AR'  , 'Archer' ),
	( 'AS'  , 'Aransas' ),
	( 'AT'  , 'Atascosa' ),
	( 'AU'  , 'Austin' ),
	( 'BA'  , 'Bailey' ),
	( 'BC'  , 'Blanco' ),
	( 'BD'  , 'Borden' ),
	( 'BE'  , 'Bee' ),
	( 'BI'  , 'Briscoe' ),
	( 'BK'  , 'Brooks' ),
	( 'BL'  , 'Bell' ),
	( 'BN'  , 'Bandera' ),
	( 'BO'  , 'Brazoria' ),
	( 'BP'  , 'Bastrop' ),
	( 'BQ'  , 'Bosque' ),
	( 'BR'  , 'Brown' ),
	( 'BS'  , 'Brewster' ),
	( 'BT'  , 'Burnet' ),
	( 'BU'  , 'Burleson' ),
	( 'BW'  , 'Bowie' ),
	( 'BX'  , 'Bexar' ),
	( 'BY'  , 'Baylor' ),
	( 'BZ'  , 'Brazos' ),
	( 'CA'  , 'Callahan' ),
	( 'CAS' , 'Castro' ),
	( 'CB'  , 'Crosby' ),
	( 'CC'  , 'Concho' ),
	( 'CD'  , 'Colorado' ),
	( 'CE'  , 'Cherokee' ),
	( 'CF'  , 'Cameron' ),
	( 'CG'  , 'Collingsworth' ),
	( 'CH'  , 'Chambers' ),
	( 'CI'  , 'Childress' ),
	( 'CJ'  , 'Comanche' ),
	( 'CK'  , 'Coke' ),
	( 'CL'  , 'Calhoun' ),
	( 'CM'  , 'Comal' ),
	( 'CN'  , 'Coleman' ),
	( 'CO'  , 'Cooke' ),
	( 'COL' , 'Collin' ),
	( 'CP'  , 'Camp' ),
	( 'CQ'  , 'Cochran' ),
	( 'CR'  , 'Crane' ),
	( 'CS'  , 'Cass' ),
	( 'CT'  , 'Cottle' ),
	( 'CU'  , 'Culberson' ),
	( 'CV'  , 'Coryell' ),
	( 'CW'  , 'Caldwell' ),
	( 'CX'  , 'Crockett' ),
	( 'CY'  , 'Clay' ),
	( 'CZ'  , 'Carson' ),
	( 'DA'  , 'Dallam' ),
	( 'DF'  , 'Deaf Smith' ),
	( 'DK'  , 'Dickens' ),
	( 'DL'  , 'Dallas' ),
	( 'DM'  , 'Dimmitt' ),
	( 'DN'  , 'Denton' ),
	( 'DS'  , 'Dawson' ),
	( 'DT'  , 'Delta' ),
	( 'DV'  , 'Duval' ),
	( 'DW'  , 'De Witt' ),
	( 'DY'  , 'Donley' ),
	( 'EA'  , 'Eastland' ),
	( 'EC'  , 'Ector' ),
	( 'ED'  , 'Edwards' ),
	( 'EL'  , 'Ellis' ),
	( 'EP'  , 'El Paso' ),
	( 'ER'  , 'Erath' ),
	( 'FA'  , 'Falls' ),
	( 'FB'  , 'Fort Bend' ),
	( 'FD'  , 'Foard' ),
	( 'FK'  , 'Franklin' ),
	( 'FL'  , 'Floyd' ),
	( 'FN'  , 'Fannin' ),
	( 'FR'  , 'Frio' ),
	( 'FS'  , 'Fisher' ),
	( 'FT'  , 'Freestone' ),
	( 'FY'  , 'Fayette' ),
	( 'GA'  , 'Gaines' ),
	( 'GC'  , 'Glasscock' ),
	( 'GD'  , 'Goliad' ),
	( 'GG'  , 'Gregg' ),
	( 'GL'  , 'Gillespie' ),
	( 'GM'  , 'Grimes' ),
	( 'GR'  , 'Garza' ),
	( 'GS'  , 'Grayson' ),
	( 'GU'  , 'Guadalupe' ),
	( 'GV'  , 'Galveston' ),
	( 'GY'  , 'Gray' ),
	( 'GZ'  , 'Gonzales' ),
	( 'HA'  , 'Hale' ),
	( 'HC'  , 'Hutchinson' ),
	( 'HD'  , 'Hood' ),
	( 'HE'  , 'Henderson' ),
	( 'HF'  , 'Hansford' ),
	( 'HG'  , 'Hidalgo' ),
	( 'HH'  , 'Hemphill' ),
	( 'HI'  , 'Hill' ),
	( 'HK'  , 'Haskell' ),
	( 'HL'  , 'Hall' ),
	( 'HM'  , 'Hamilton' ),
	( 'HN'  , 'Hardin' ),
	( 'HO'  , 'Houston' ),
	( 'HP'  , 'Hopkins' ),
	( 'HQ'  , 'Hockley' ),
	( 'HR'  , 'Harris' ),
	( 'HS'  , 'Harrison' ),
	( 'HT'  , 'Hartley' ),
	( 'HU'  , 'Hunt' ),
	( 'HW'  , 'Howard' ),
	( 'HX'  , 'Hardeman' ),
	( 'HY'  , 'Hays' ),
	( 'HZ'  , 'Hudspeth' ),
	( 'IR'  , 'Irion' ),
	( 'JA'  , 'Jack' ),
	( 'JD'  , 'Jeff Davis' ),
	( 'JF'  , 'Jefferson' ),
	( 'JH'  , 'Jim Hogg' ),
	( 'JK'  , 'Jackson' ),
	( 'JN'  , 'Johnson' ),
	( 'JP'  , 'Jasper' ),
	( 'JS'  , 'Jones' ),
	( 'JW'  , 'Jim Wells' ),
	( 'KA'  , 'Karnes' ),
	( 'KE'  , 'Kendall' ),
	( 'KF'  , 'Kaufman' ),
	( 'KG'  , 'King' ),
	( 'KL'  , 'Kleberg' ),
	( 'KM'  , 'Kimble' ),
	( 'KN'  , 'Kenedy' ),
	( 'KR'  , 'Kerr' ),
	( 'KT'  , 'Kent' ),
	( 'KX'  , 'Knox' ),
	( 'KY'  , 'Kinney' ),
	( 'LA'  , 'Lamb' ),
	( 'LB'  , 'Liberty' ),
	( 'LC'  , 'Lavaca' ),
	( 'LE'  , 'Lee' ),
	( 'LK'  , 'Live Oak' ),
	( 'LL'  , 'Llano' ),
	( 'LM'  , 'Lampasas' ),
	( 'LN'  , 'Leon' ),
	( 'LP'  , 'Lipscomb' ),
	( 'LR'  , 'Lamar' ),
	( 'LS'  , 'La Salle' ),
	( 'LT'  , 'Limestone' ),
	( 'LU'  , 'Lubbock' ),
	( 'LV'  , 'Loving' ),
	( 'LY'  , 'Lynn' ),
	( 'MA'  , 'Madison' ),
	( 'MC'  , 'McMullen' ),
	( 'MD'  , 'Midland' ),
	( 'ME'  , 'Medina' ),
	( 'MG'  , 'Matagorda' ),
	( 'MH'  , 'Mitchell' ),
	( 'MI'  , 'Mills' ),
	( 'MK'  , 'McCulloch' ),
	( 'ML'  , 'McLennan' ),
	( 'MM'  , 'Milam' ),
	( 'MN'  , 'Menard' ),
	( 'MO'  , 'Moore' ),
	( 'MQ'  , 'Montgomery' ),
	( 'MR'  , 'Marion' ),
	( 'MS'  , 'Mason' ),
	( 'MT'  , 'Martin' ),
	( 'MU'  , 'Montague' ),
	( 'MV'  , 'Maverick' ),
	( 'MX'  , 'Morris' ),
	( 'MY'  , 'Motley' ),
	( 'NA'  , 'Nacogdoches' ),
	( 'NL'  , 'Nolan' ),
	( 'NU'  , 'Nueces' ),
	( 'NV'  , 'Navarro' ),
	( 'NW'  , 'Newton' ),
	( 'OC'  , 'Ochiltree' ),
	( 'OL'  , 'Oldham' ),
	( 'OR'  , 'Orange' ),
	( 'PC'  , 'Pecos' ),
	( 'PK'  , 'Polk' ),
	( 'PM'  , 'Parmer' ),
	( 'PN'  , 'Panola' ),
	( 'PP'  , 'Palo Pinto' ),
	( 'PR'  , 'Parker' ),
	( 'PS'  , 'Presidio' ),
	( 'PT'  , 'Potter' ),
	( 'RA'  , 'Rains' ),
	( 'RB'  , 'Roberts' ),
	( 'RD'  , 'Randall' ),
	( 'RE'  , 'Real' ),
	( 'RF'  , 'Refugio' ),
	( 'RG'  , 'Reagan' ),
	( 'RK'  , 'Rusk' ),
	( 'RN'  , 'Runnels' ),
	( 'RR'  , 'Red River' ),
	( 'RT'  , 'Robertson' ),
	( 'RV'  , 'Reeves' ),
	( 'RW'  , 'Rockwall' ),
	( 'SA'  , 'San Augustine' ),
	( 'SB'  , 'Sabine' ),
	( 'SC'  , 'Scurry' ),
	( 'SE'  , 'Stephens' ),
	( 'SF'  , 'Shackelford' ),
	( 'SH'  , 'Sherman' ),
	( 'SJ'  , 'San Jacinto' ),
	( 'SL'  , 'Schleicher' ),
	( 'SM'  , 'Smith' ),
	( 'SN'  , 'Stonewall' ),
	( 'SP'  , 'San Patricio' ),
	( 'SR'  , 'Starr' ),
	( 'SS'  , 'San Saba' ),
	( 'ST'  , 'Sterling' ),
	( 'SU'  , 'Sutton' ),
	( 'SV'  , 'Somervell' ),
	( 'SW'  , 'Swisher' ),
	( 'SY'  , 'Shelby' ),
	( 'TA'  , 'Taylor' ),
	( 'TE'  , 'Terrell' ),
	( 'TG'  , 'Tom Green' ),
	( 'TH'  , 'Throckmorton' ),
	( 'TL'  , 'Tyler' ),
	( 'TN'  , 'Trinity' ),
	( 'TR'  , 'Tarrant' ),
	( 'TT'  , 'Titus' ),
	( 'TV'  , 'Travis' ),
	( 'TY'  , 'Terry' ),
	( 'UR'  , 'Upshur' ),
	( 'UT'  , 'Upton' ),
	( 'UV'  , 'Uvalde' ),
	( 'VN'  , 'Van Zandt' ),
	( 'VT'  , 'Victoria' ),
	( 'VV'  , 'Val Verde' ),
	( 'WA'  , 'Walker' ),
	( 'WB'  , 'Webb' ),
	( 'WC'  , 'Wichita' ),
	( 'WD'  , 'Wood' ),
	( 'WE'  , 'Wheeler' ),
	( 'WG'  , 'Wilbarger' ),
	( 'WH'  , 'Wharton' ),
	( 'WK'  , 'Winkler' ),
	( 'WL'  , 'Waller' ),
	( 'WM'  , 'Williamson' ),
	( 'WN'  , 'Wilson' ),
	( 'WR'  , 'Ward' ),
	( 'WS'  , 'Wise' ),
	( 'WT'  , 'Washington' ),
	( 'WY'  , 'Willacy' ),
	( 'YK'  , 'Yoakum' ),
	( 'YN'  , 'Young' ),
	( 'ZP'  , 'Zapata' ),
	( 'ZV'  , 'Zavala' );
