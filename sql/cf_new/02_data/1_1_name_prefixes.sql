DROP TABLE IF EXISTS codes_name_prefixes;

CREATE TABLE codes_name_prefixes (
	prefix_code  text PRIMARY KEY,
	prefix_name  text
);

INSERT INTO codes_name_prefixes( prefix_code, prefix_name )
VALUES
	( 'AGENT',           'Agent' ),
	( 'BRIGADIER',       'Brig. Gen.' ),
	( 'CAPTAIN',         'Capt.' ),
	( 'CEO',             'CEO' ),
	( 'COLONEL',         'Colonel' ),
	( 'COMMISSNR',       'Commissioner' ),
	( 'DR',              'Dr.' ),
	( 'ESTATE',          'The Estate of' ),
	( 'GENERAL',         'General' ),
	( 'HONORABLE',       'The Honorable' ),
	( 'JUDGE',           'Judge' ),
	( 'LADY',            'Lady' ),
	( 'LT',              'Lt.' ),
	( 'LTGENERAL',       'Lt. Gen.' ),
	( 'MAJOR',           'Major' ),
	( 'MAJORGEN',        'Maj. Gen.' ),
	( 'MISS',            'Miss' ),
	( 'MONSIGNOR',       'Monsignor' ),
	( 'MR',              'Mr.' ),
	( 'MRS',             'Mrs.' ),
	( 'MS',              'Ms.' ),
	( 'OFFICER',         'Officer' ),
	( 'PROFESSOR',       'Prof.' ),
	( 'RABBI',           'Rabbi' ),
	( 'REPRESENTATIVE',  'Rep.' ),
	( 'REVEREND',        'Rev.' ),
	( 'SENATOR',         'Sen.' ),
	( 'SGT',             'Sgt.' ),
	( 'SISTER',          'Sister' )
;
