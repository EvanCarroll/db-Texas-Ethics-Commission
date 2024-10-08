DROP TABLE IF EXISTS codes_totals;

CREATE TABLE codes_totals (
	total_code           text PRIMARY KEY,
	total_description  text
);
INSERT INTO codes_totals(total_code, total_description)
VALUES
	( 'LOBB_CAT_AWARDS'        , 'Awards & Momentos' ),
	( 'LOBB_CAT_ENTERTAIN'     , 'Entertainment' ),
	( 'LOBB_CAT_EVENTS'        , 'Political Fundraisers/Charity Events' ),
	( 'LOBB_CAT_FOOD'          , 'Food & Beverages' ),
	( 'LOBB_CAT_GIFTS'         , 'Gifts (other than awards & momentos)' ),
	( 'LOBB_CAT_MEDIA'         , 'Mass Media Communications' ),
	( 'LOBB_CAT_TRANSPORT'     , 'Transportation & Lodging' ),
	( 'LOBB_PER_EXECUTIVE'     , 'Executive Agency Employees' ),
	( 'LOBB_PER_FAMILY'        , 'Immediate Family of Legislative/Executive Branch Member' ),
	( 'LOBB_PER_GUESTS'        , 'Guests' ),
	( 'LOBB_PER_LEGINVITE'     , 'Events to Which All Legislators Are Invited' ),
	( 'LOBB_PER_LEGISLATIVE'   , 'Legislative Branch Employees' ),
	( 'LOBB_PER_OTHER'         , 'Other Elected/Appointed State Officers' ),
	( 'LOBB_PER_REPRESENT'     , 'State Representatives' ),
	( 'LOBB_PER_SENATORS'      , 'State Senators' ),
	( 'SUBT_A1'                , 'Monetary Political Contributions' ),
	( 'SUBT_A2'                , 'Non-Monetary Political Contributions' ),
	( 'SUBT_AJ1'               , 'Monetary Political Contributions (Judicial)' ),
	( 'SUBT_AL'                , 'Non-Caucus Member Contributions' ),
	( 'SUBT_ALC'               , 'Contributions from Caucus Member' ),
	( 'SUBT_AS1'               , 'Contributions (Speaker) (Monetary)' ),
	( 'SUBT_AS2'               , 'Contributions (Speaker) (Non-Monetary)' ),
	( 'SUBT_B'                 , 'Pledged Contributions' ),
	( 'SUBT_BJ'                , 'Pledged Contributions (Judicial)' ),
	( 'SUBT_BSS'               , 'Pledged Contributions' ),
	( 'SUBT_C1'                , 'Monetary Contributions From Corporation Or Labor Organization' ),
	( 'SUBT_C2'                , 'Non-Monetary Contributions From Corporation Or Labor Organization' ),
	( 'SUBT_C3'                , 'Monetary Support From Corporation Or Labor Organization' ),
	( 'SUBT_C4'                , 'Non-Monetary Support From Corporation Or Labor Organization' ),
	( 'SUBT_D'                 , 'Pledged Contributions From Corporation Or Labor Organization' ),
	( 'SUBT_E'                 , 'Loans' ),
	( 'SUBT_EJ'                , 'Loans (Judicial)' ),
	( 'SUBT_EL'                , 'Loans To Legislative Caucus' ),
	( 'SUBT_ES'                , 'Loans (Speaker)' ),
	( 'SUBT_F1'                , 'Political Expenditures From Political Contributions' ),
	( 'SUBT_F2'                , 'Unpaid Incurred Obligations' ),
	( 'SUBT_F3'                , 'Purchase Of Investments From Political Contributions' ),
	( 'SUBT_FL'                , 'Legislative Caucus Expenditures' ),
	( 'SUBT_FS'                , 'Expenditures (Speaker)' ),
	( 'SUBT_G'                 , 'Political Expenditures From Personal Funds' ),
	( 'SUBT_H'                 , 'Payment From Political Contributions To The Business Of A C/OH' ),
	( 'SUBT_I'                 , 'Non-Political Expenditures From Political Contributions' ),
	( 'SUBT_K'                 , 'Interest, Credits, Gains, Refunds, And Contributions Returned To Filer' ),
	( 'SUBT_L'                 , 'Outstanding Loans' ),
	( 'SUBT_M'                 , 'Assets Valued At $500 Or More' ),
	( 'SUBT_T'                 , 'Out Of State Travel' ),
	( 'TOT_CNTRB'              , 'Total Political Contributions' ),
	( 'TOT_CNTRB_BALANCE'      , 'Total Contributions Maintained As Of The Last Day Of The Reporting Period' ),
	( 'TOT_EXPND'              , 'Total Expenditures' ),
	( 'TOT_INKIND_POL_CNTRB'   , 'Total Of Unitemized In-Kind Political Contributions.' ),
	( 'TOT_INTEREST_EARNED'    , 'Total Amount Of Interest Earned During Reporting Period' ),
	( 'TOT_INTEREST_INCOME'    , 'Total Amount Of Interest And Other Income Earned On Unexpended Political Contributions During The Previous Year.' ),
	( 'TOT_LOAN'               , 'Total Loans' ),
	( 'TOT_LOAN_PRINCIPAL'     , 'Total Principal Amount Of All Outstanding Loans As Of The Last Day of the Reporting Period' ),
	( 'TOT_PLEDGE'             , 'Total Amount Of Pledges.' ),
	( 'TOT_UNEXPEND_CNTRB'     , 'Total Amount Of Unexpended Political Contributions' ),
	( 'TOT_UNPAID_INCUR_OBLIG' , 'Total of Unitemized Unpaid Incurred Obligations' )
;
