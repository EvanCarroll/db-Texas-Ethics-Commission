-- Schema generation for the Texas Ethics Commission
-- Copyright (C) 2018  Evan Carroll
-- 
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Affero General Public License as
-- published by the Free Software Foundation, either version 3 of the
-- License, or (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Affero General Public License for more details.
-- 
-- You should have received a copy of the GNU Affero General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.

\echo LOADING c_DebtData


CREATE TABLE tec.c_debtdata (
	recordType                              text,
	formTypeCd                              text,
	schedFormTypeCd                         text,
	reportInfoIdent                         int,
	receivedDt                              date,
	infoOnlyFlag                            bool,
	filerIdent                              int,
	filerTypeCd                             text,
	filerName                               text,
	loanInfoId                              bigint,
	loanGuaranteedFlag                      bool,
	lenderPersentTypeCd                     text,
	lenderNameOrganization                  text,
	lenderNameLast                          text,
	lenderNameSuffixCd                      text,
	lenderNameFirst                         text,
	lenderNamePrefixCd                      text,
	lenderNameShort                         text,
	lenderStreetCity                        text,
	lenderStreetStateCd                     text,
	lenderStreetCountyCd                    text,
	lenderStreetCountryCd                   text,
	lenderStreetPostalCode                  text,
	lenderStreetRegion                      text,
	guarantorPersentTypeCd1                 text,
	guarantorNameOrganization1              text,
	guarantorNameLast1                      text,
	guarantorNameSuffixCd1                  text,
	guarantorNameFirst1                     text,
	guarantorNamePrefixCd1                  text,
	guarantorNameShort1                     text,
	guarantorStreetCity1                    text,
	guarantorStreetStateCd1                 text,
	guarantorStreetCountyCd1                text,
	guarantorStreetCountryCd1               text,
	guarantorStreetPostalCode1              text,
	guarantorStreetRegion1                  text,
	guarantorPersentTypeCd2                 text,
	guarantorNameOrganization2              text,
	guarantorNameLast2                      text,
	guarantorNameSuffixCd2                  text,
	guarantorNameFirst2                     text,
	guarantorNamePrefixCd2                  text,
	guarantorNameShort2                     text,
	guarantorStreetCity2                    text,
	guarantorStreetStateCd2                 text,
	guarantorStreetCountyCd2                text,
	guarantorStreetCountryCd2               text,
	guarantorStreetPostalCode2              text,
	guarantorStreetRegion2                  text,
	guarantorPersentTypeCd3                 text,
	guarantorNameOrganization3              text,
	guarantorNameLast3                      text,
	guarantorNameSuffixCd3                  text,
	guarantorNameFirst3                     text,
	guarantorNamePrefixCd3                  text,
	guarantorNameShort3                     text,
	guarantorStreetCity3                    text,
	guarantorStreetStateCd3                 text,
	guarantorStreetCountyCd3                text,
	guarantorStreetCountryCd3               text,
	guarantorStreetPostalCode3              text,
	guarantorStreetRegion3                  text,
	guarantorPersentTypeCd4                 text,
	guarantorNameOrganization4              text,
	guarantorNameLast4                      text,
	guarantorNameSuffixCd4                  text,
	guarantorNameFirst4                     text,
	guarantorNamePrefixCd4                  text,
	guarantorNameShort4                     text,
	guarantorStreetCity4                    text,
	guarantorStreetStateCd4                 text,
	guarantorStreetCountyCd4                text,
	guarantorStreetCountryCd4               text,
	guarantorStreetPostalCode4              text,
	guarantorStreetRegion4                  text,
	guarantorPersentTypeCd5                 text,
	guarantorNameOrganization5              text,
	guarantorNameLast5                      text,
	guarantorNameSuffixCd5                  text,
	guarantorNameFirst5                     text,
	guarantorNamePrefixCd5                  text,
	guarantorNameShort5                     text,
	guarantorStreetCity5                    text,
	guarantorStreetStateCd5                 text,
	guarantorStreetCountyCd5                text,
	guarantorStreetCountryCd5               text,
	guarantorStreetPostalCode5              text,
	guarantorStreetRegion5                  text,
	PRIMARY KEY ( loanInfoId )
);
COMMENT ON TABLE tec.c_debtdata IS $$Debts - Schedule L - Outstanding judicial loans. File: debts.csv$$;
COMMENT ON COLUMN tec.c_debtdata.recordtype IS $$Record type code - always DEBT$$;
COMMENT ON COLUMN tec.c_debtdata.formtypecd IS $$TEC form used$$;
COMMENT ON COLUMN tec.c_debtdata.schedformtypecd IS $$TEC Schedule Used$$;
COMMENT ON COLUMN tec.c_debtdata.reportinfoident IS $$Unique report #$$;
COMMENT ON COLUMN tec.c_debtdata.receiveddt IS $$Date report received by TEC$$;
COMMENT ON COLUMN tec.c_debtdata.infoonlyflag IS $$Superseded by other report$$;
COMMENT ON COLUMN tec.c_debtdata.filerident IS $$Filer account #$$;
COMMENT ON COLUMN tec.c_debtdata.filertypecd IS $$Type of filer$$;
COMMENT ON COLUMN tec.c_debtdata.filername IS $$Filer name$$;
COMMENT ON COLUMN tec.c_debtdata.loaninfoid IS $$Loan unique identifier$$;
COMMENT ON COLUMN tec.c_debtdata.loanguaranteedflag IS $$Loan guaranteed indicator$$;
COMMENT ON COLUMN tec.c_debtdata.lenderpersenttypecd IS $$Type of lender name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.c_debtdata.lendernameorganization IS $$For ENTITY, the lender organization name$$;
COMMENT ON COLUMN tec.c_debtdata.lendernamelast IS $$For INDIVIDUAL, the lender last name$$;
COMMENT ON COLUMN tec.c_debtdata.lendernamesuffixcd IS $$For INDIVIDUAL, the lender name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.c_debtdata.lendernamefirst IS $$For INDIVIDUAL, the lender first name$$;
COMMENT ON COLUMN tec.c_debtdata.lendernameprefixcd IS $$For INDIVIDUAL, the lender name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.c_debtdata.lendernameshort IS $$For INDIVIDUAL, the lender short name (nickname)$$;
COMMENT ON COLUMN tec.c_debtdata.lenderstreetcity IS $$Lender street address - city$$;
COMMENT ON COLUMN tec.c_debtdata.lenderstreetstatecd IS $$Lender street address - state code (e.g. TX, CA) - for           country=USA/UMI only$$;
COMMENT ON COLUMN tec.c_debtdata.lenderstreetcountycd IS $$Lender street address - Texas county$$;
COMMENT ON COLUMN tec.c_debtdata.lenderstreetcountrycd IS $$Lender street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.c_debtdata.lenderstreetpostalcode IS $$Lender street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.c_debtdata.lenderstreetregion IS $$Lender street address - region for country other than USA$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorpersenttypecd1 IS $$1: Type of guarantor name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornameorganization1 IS $$1: For ENTITY, the guarantor organization name$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornamelast1 IS $$1: For INDIVIDUAL, the guarantor last name$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornamesuffixcd1 IS $$1: For INDIVIDUAL, the guarantor name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornamefirst1 IS $$1: For INDIVIDUAL, the guarantor first name$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornameprefixcd1 IS $$1: For INDIVIDUAL, the guarantor name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornameshort1 IS $$1: For INDIVIDUAL, the guarantor short name (nickname)$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetcity1 IS $$1: Guarantor street address - city$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetstatecd1 IS $$1: Guarantor street address - state code (e.g. TX, CA) - for        country=USA/UMI only$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetcountycd1 IS $$1: Guarantor street address - Texas county$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetcountrycd1 IS $$1: Guarantor street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetpostalcode1 IS $$1: Guarantor street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetregion1 IS $$1: Guarantor street address - region for country other than USA$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorpersenttypecd2 IS $$2: Type of guarantor name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornameorganization2 IS $$2: For ENTITY, the guarantor organization name$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornamelast2 IS $$2: For INDIVIDUAL, the guarantor last name$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornamesuffixcd2 IS $$2: For INDIVIDUAL, the guarantor name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornamefirst2 IS $$2: For INDIVIDUAL, the guarantor first name$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornameprefixcd2 IS $$2: For INDIVIDUAL, the guarantor name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornameshort2 IS $$2: For INDIVIDUAL, the guarantor short name (nickname)$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetcity2 IS $$2: Guarantor street address - city$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetstatecd2 IS $$2: Guarantor street address - state code (e.g. TX, CA) - for        country=USA/UMI only$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetcountycd2 IS $$2: Guarantor street address - Texas county$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetcountrycd2 IS $$2: Guarantor street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetpostalcode2 IS $$2: Guarantor street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetregion2 IS $$2: Guarantor street address - region for country other than USA$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorpersenttypecd3 IS $$3: Type of guarantor name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornameorganization3 IS $$3: For ENTITY, the guarantor organization name$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornamelast3 IS $$3: For INDIVIDUAL, the guarantor last name$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornamesuffixcd3 IS $$3: For INDIVIDUAL, the guarantor name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornamefirst3 IS $$3: For INDIVIDUAL, the guarantor first name$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornameprefixcd3 IS $$3: For INDIVIDUAL, the guarantor name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornameshort3 IS $$3: For INDIVIDUAL, the guarantor short name (nickname)$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetcity3 IS $$3: Guarantor street address - city$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetstatecd3 IS $$3: Guarantor street address - state code (e.g. TX, CA) - for        country=USA/UMI only$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetcountycd3 IS $$3: Guarantor street address - Texas county$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetcountrycd3 IS $$3: Guarantor street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetpostalcode3 IS $$3: Guarantor street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetregion3 IS $$3: Guarantor street address - region for country other than USA$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorpersenttypecd4 IS $$4: Type of guarantor name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornameorganization4 IS $$4: For ENTITY, the guarantor organization name$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornamelast4 IS $$4: For INDIVIDUAL, the guarantor last name$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornamesuffixcd4 IS $$4: For INDIVIDUAL, the guarantor name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornamefirst4 IS $$4: For INDIVIDUAL, the guarantor first name$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornameprefixcd4 IS $$4: For INDIVIDUAL, the guarantor name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornameshort4 IS $$4: For INDIVIDUAL, the guarantor short name (nickname)$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetcity4 IS $$4: Guarantor street address - city$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetstatecd4 IS $$4: Guarantor street address - state code (e.g. TX, CA) - for        country=USA/UMI only$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetcountycd4 IS $$4: Guarantor street address - Texas county$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetcountrycd4 IS $$4: Guarantor street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetpostalcode4 IS $$4: Guarantor street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetregion4 IS $$4: Guarantor street address - region for country other than USA$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorpersenttypecd5 IS $$5: Type of guarantor name data - INDIVIDUAL or ENTITY$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornameorganization5 IS $$5: For ENTITY, the guarantor organization name$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornamelast5 IS $$5: For INDIVIDUAL, the guarantor last name$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornamesuffixcd5 IS $$5: For INDIVIDUAL, the guarantor name suffix (e.g. JR, MD, II)$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornamefirst5 IS $$5: For INDIVIDUAL, the guarantor first name$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornameprefixcd5 IS $$5: For INDIVIDUAL, the guarantor name prefix (e.g. MR, MRS, MS)$$;
COMMENT ON COLUMN tec.c_debtdata.guarantornameshort5 IS $$5: For INDIVIDUAL, the guarantor short name (nickname)$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetcity5 IS $$5: Guarantor street address - city$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetstatecd5 IS $$5: Guarantor street address - state code (e.g. TX, CA) - for        country=USA/UMI only$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetcountycd5 IS $$5: Guarantor street address - Texas county$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetcountrycd5 IS $$5: Guarantor street address - country (e.g. USA, UMI, MEX, CAN)$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetpostalcode5 IS $$5: Guarantor street address - postal code - for USA addresses only$$;
COMMENT ON COLUMN tec.c_debtdata.guarantorstreetregion5 IS $$5: Guarantor street address - region for country other than USA$$;
\COPY tec.c_debtdata FROM 'data/TEC_CF_CSV/debts.csv' WITH ( FORMAT CSV , HEADER true );


CREATE INDEX ON tec.c_debtdata (filerIdent, filerTypeCd);

ALTER TABLE tec.c_debtdata
	ADD FOREIGN KEY (lenderStreetCountyCd) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (guarantorStreetCountyCd1) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (guarantorStreetCountyCd2) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (guarantorStreetCountyCd3) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (guarantorStreetCountyCd4) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (guarantorStreetCountyCd5) REFERENCES tec.codes_counties NOT VALID,
	ADD FOREIGN KEY (filerIdent, filerTypeCd) REFERENCES tec.c_FilerData NOT VALID;

CREATE INDEX ON tec.c_debtdata (reportInfoIdent);

