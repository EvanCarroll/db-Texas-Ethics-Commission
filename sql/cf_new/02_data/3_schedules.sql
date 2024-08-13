DROP TABLE IF EXISTS codes_schedules;

CREATE TYPE schedule_category
	AS ENUM ( 'CONTRIBUTION', 'CREDIT', 'EXPENDITURE', 'LOAN', 'PLEDGE' );

CREATE TABLE codes_schedules (
	schedule_code     text PRIMARY KEY,
	schedule_name     text,
	schedule_category schedule_category
);


INSERT INTO codes_schedules
VALUES
	( 'A1'     , 'Monetary Political Contributions'                                             , 'CONTRIBUTION' ),
	( 'A2'     , 'Non-Monetary (In-Kind) Political Contributions'                               , 'CONTRIBUTION' ),
	( 'A2SS'   , 'Non-Monetary (In-Kind) Political Contributions (Special Session)'             , 'CONTRIBUTION' ),
	( 'AJ1'    , 'Monetary Political Contributions (Judicial)'                                  , 'CONTRIBUTION' ),
	( 'AL'     , 'Non-Caucus Member Contributions'                                              , 'CONTRIBUTION' ),
	( 'AS1'    , 'Monetary Contributions (Speaker)'                                             , 'CONTRIBUTION' ),
	( 'AS2'    , 'In-Kind Contributions (Speaker)'                                              , 'CONTRIBUTION' ),
	( 'C1'     , 'Monetary Contributions From Corporation Or Labor Organization'                , 'CONTRIBUTION' ),
	( 'C2'     , 'Non-Monetary (In-Kind) Contributions From Corporation Or Labor Organization'  , 'CONTRIBUTION' ),
	( 'C3'     , 'Monetary Support From Corporation Or Labor Organization'                      , 'CONTRIBUTION' ),
	( 'C4'     , 'Non-Monetary Support From Corporation Or Labor Organization'                  , 'CONTRIBUTION' ),
	( 'K'      , 'Interest, Credits, Gains, Refunds, And Contributions Returned To Filer'       , 'CREDIT' ),
	( 'COHUC2' , 'Candidate/Officeholder Report Of Unexpended Contributions Part 2'             , 'EXPENDITURE' ),
	( 'F1'     , 'Political Expenditures From Political Contributions'                          , 'EXPENDITURE' ),
	( 'F2'     , 'Unpaid Incurred Obligations'                                                  , 'EXPENDITURE' ),
	( 'F3'     , 'Purchase Of Investments From Political Contributions'                         , 'EXPENDITURE' ),
	( 'F4'     , 'Expenditures Made by Credit Card'                                             , 'EXPENDITURE' ),
	( 'FL'     , 'Legislative Caucus Expenditures'                                              , 'EXPENDITURE' ),
	( 'FS'     , 'Expenditures (Speaker)'                                                       , 'EXPENDITURE' ),
	( 'G'      , 'Political Expenditures From Personal Funds'                                   , 'EXPENDITURE' ),
	( 'H'      , 'Payment From Political Contributions To The Business Of A C/OH'               , 'EXPENDITURE' ),
	( 'I'      , 'Non-Political Expenditures From Political Contributions'                      , 'EXPENDITURE' ),
	( 'SPKUCFS', 'Expenditures (Speaker)'                                                       , 'EXPENDITURE' ),
	( 'E'      , 'Loans'                                                                        , 'LOAN' ),
	( 'EJ'     , 'Loans (Judicial)'                                                             , 'LOAN' ),
	( 'EL'     , 'Loans To Legislative Caucus'                                                  , 'LOAN' ),
	( 'ES'     , 'Loans (Speaker)'                                                              , 'LOAN' ),
	( 'L'      , 'Outstanding Loans'                                                            , 'LOAN' ),
	( 'B'      , 'Pledged Contributions'                                                        , 'PLEDGE' ),
	( 'BJ'     , 'Pledged Contributions (Judicial)'                                             , 'PLEDGE' ),
	( 'BJSS'   , 'Pledged Contributions (Judicial Special Session)'                             , 'PLEDGE' ),
	( 'BSS'    , 'Pledged Contributions (Special Session)'                                      , 'PLEDGE' ),
	( 'D'      , 'Pledged Contributions From Corporation Or Labor Organization'                 , 'PLEDGE' )
;
