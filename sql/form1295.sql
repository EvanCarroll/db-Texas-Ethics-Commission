\echo Schema generation for the Texas Ethics Commission
\echo DATA derived from Form 1295 Acknowledged Certificates Data Record Format (revised 04/06/2016)
\echo Copyright (C) 2018  Evan Carroll
\echo 
\echo This program is free software: you can redistribute it and/or modify
\echo it under the terms of the GNU Affero General Public License as
\echo published by the Free Software Foundation, either version 3 of the
\echo License, or (at your option) any later version.
\echo 
\echo This program is distributed in the hope that it will be useful,
\echo but WITHOUT ANY WARRANTY; without even the implied warranty of
\echo MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
\echo GNU Affero General Public License for more details.
\echo 
\echo You should have received a copy of the GNU Affero General Public License
\echo along with this program.  If not, see <https://www.gnu.org/licenses/>.

DROP TABLE tec.form1295_box123;
DROP TABLE tec.form1295_interested_party;

CREATE TABLE tec.form1295_box123 (
	recordType           text  ,            -- Record Type (identifies this record)  Value: BOX123
	certificateNumber    text  ,            -- Certificate number
	reportNumber         int   PRIMARY KEY, -- Unique report number
	acknowledgeDate      text  ,            -- Date the government entity or state agency acknowledged this certificate.  Value: YYYY-MM-DD
	governmentName       text  ,            -- Name of governmental entity or state agency that is a party to the contract for which this certificate has been filed.  This field is surrounded by double quotes.
	governmentTypeCd     text  ,            -- GOVT_ENTITY, AGENCY
	businessName         text  ,            -- Name of business entity that filed this certificate. This field is surrounded by double quotes.
	businessCityName     text  ,            -- Business location city of business entity that filed this certificate.  This field is surrounded by double quotes.
	businessStateCode    text  ,            -- Business location state of business entity that filed this certificate
	businessCountryCode  char(3)  ,         -- Business location country of business entity that filed this certificate
	govtContractNumber   text  ,            -- Identification number used by the governmental entity or state agency for identification of the contract for which this certificate has been filed. This field is surrounded by double quotes.
	goodsServicesDescr   text               -- Description of the goods or services to be provided under the contract associated with this certificate, This field is surrounded by double quotes.
);

COMMENT ON TABLE  tec.form1295_box123                     IS $$There is a single BOX123 record for each acknowledged certificate.$$;
COMMENT ON COLUMN tec.form1295_box123.recordType          IS $$Record Type (identifies this record)  Value: BOX123$$;
COMMENT ON COLUMN tec.form1295_box123.certificateNumber   IS $$Certificate number$$;
COMMENT ON COLUMN tec.form1295_box123.reportNumber        IS $$Unique report number$$;
COMMENT ON COLUMN tec.form1295_box123.acknowledgeDate     IS $$Date the government entity or state agency acknowledged this certificate.  Value: YYYY-MM-DD$$;
COMMENT ON COLUMN tec.form1295_box123.governmentName      IS $$Name of governmental entity or state agency that is a party to the contract for which this certificate has been filed.  This field is surrounded by double quotes.$$;
COMMENT ON COLUMN tec.form1295_box123.governmentTypeCd    IS $$GOVT_ENTITY, AGENCY$$;
COMMENT ON COLUMN tec.form1295_box123.businessName        IS $$Name of business entity that filed this certificate. This field is surrounded by double quotes.$$;
COMMENT ON COLUMN tec.form1295_box123.businessCityName    IS $$Business location city of business entity that filed this certificate.  This field is surrounded by double quotes.$$;
COMMENT ON COLUMN tec.form1295_box123.businessStateCode   IS $$Business location state of business entity that filed this certificate$$;
COMMENT ON COLUMN tec.form1295_box123.businessCountryCode IS $$Business location country of business entity that filed this certificate$$;
COMMENT ON COLUMN tec.form1295_box123.govtContractNumber  IS $$Identification number used by the governmental entity or state agency for identification of the contract for which this certificate has been filed. This field is surrounded by double quotes.$$;
COMMENT ON COLUMN tec.form1295_box123.goodsServicesDescr  IS $$Description of the goods or services to be provided under the contract associated with this certificate, This field is surrounded by double quotes.$$;

\COPY tec.form1295_box123 FROM './data/1295Certificates_BOX123.csv' WITH ( FORMAT CSV, HEADER true )

-- Field #  Field Name           Value Type   Max Len  Description
-- 01       recordType           String       6        Record Type (identifies this record)  Value: BOX123
-- 02       certificateNumber    String       20       Certificate number
-- 03       reportNumber         String       9        Unique report number
-- 04       acknowledgeDate      String       10       Date the government entity or state agency acknowledged this certificate.  Value: YYYY-MM-DD
-- 05       governmentName       String       100      Name of governmental entity or state agency that is a party to the contract for which this certificate has been filed.  This field is surrounded by double quotes.
-- 06       governmentTypeCd     String       11       GOVT_ENTITY, AGENCY
-- 07       businessName         String       100      Name of business entity that filed this certificate. This field is surrounded by double quotes.
-- 08       businessCityName     String       30       Business location city of business entity that filed this certificate.  This field is surrounded by double quotes.
-- 09       businessStateCode    String       2        Business location state of business entity that filed this certificate
-- 10       businessCountryCode  String       3        Business location country of business entity that filed this certificate
-- 11       govtContractNumber   String       30       Identification number used by the governmental entity or state agency for identification of the contract for which this certificate has been filed. This field is surrounded by double quotes.
-- 12       goodsServicesDescr   String       200      Description of the goods or services to be provided under the contract associated with this certificate, This field is surrounded by double quotes.


----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------

CREATE TABLE tec.form1295_interested_party (
	recordType            text ,                                -- Record Type (identifies this record)  Value: PARTY
	certificateNumber     text ,                                -- Certificate number
	reportNumber          int  REFERENCES tec.form1295_box123,  -- Unique report number
	partyTypeCode         text ,                                -- ENTITY, INDIVIDUAL
	partyOrgName          text ,                                -- Organization name of entity interested party. This field is surrounded by double quotes.
	partyLastName         text ,                                -- Last name of individual interested party. This field is surrounded by double quotes.
	partyFirstName        text ,                                -- First name of individual interested party. This field is surrounded by double quotes.
	partyCity             text ,                                -- Business location city of interested party. This field is surrounded by double quotes.
	partyStateCode        text ,                                -- Business location state of interested party
	partyCountryCode      char(3) ,                             -- Business location country of interested party
	controllingInterest   bool ,                                -- Value: Y or N
	intermediaryInterest  bool                                  -- Value: Y or N
);

COMMENT ON TABLE tec.form1295_interested_party IS $$There are zero or more interested party records for each acknowledged certificate.$$;
COMMENT ON COLUMN tec.form1295_interested_party.recordType            IS $$Record Type (identifies this record)  Value: PARTY$$;
COMMENT ON COLUMN tec.form1295_interested_party.certificateNumber     IS $$Certificate number$$;
COMMENT ON COLUMN tec.form1295_interested_party.reportNumber          IS $$Unique report number$$;
COMMENT ON COLUMN tec.form1295_interested_party.partyTypeCode         IS $$ENTITY, INDIVIDUAL$$;
COMMENT ON COLUMN tec.form1295_interested_party.partyOrgName          IS $$Organization name of entity interested party. This field is surrounded by double quotes.$$;
COMMENT ON COLUMN tec.form1295_interested_party.partyLastName         IS $$Last name of individual interested party. This field is surrounded by double quotes.$$;
COMMENT ON COLUMN tec.form1295_interested_party.partyFirstName        IS $$First name of individual interested party. This field is surrounded by double quotes.$$;
COMMENT ON COLUMN tec.form1295_interested_party.partyCity             IS $$Business location city of interested party. This field is surrounded by double quotes.$$;
COMMENT ON COLUMN tec.form1295_interested_party.partyStateCode        IS $$Business location state of interested party$$;
COMMENT ON COLUMN tec.form1295_interested_party.partyCountryCode      IS $$Business location country of interested party$$;
COMMENT ON COLUMN tec.form1295_interested_party.controllingInterest   IS $$Value: Y or N$$;
COMMENT ON COLUMN tec.form1295_interested_party.intermediaryInterest  IS $$Value: Y or N$$;

-- Field #  Field Name            Value Type   Max Len  Description
-- 01       recordType            String       6        Record Type (identifies this record)  Value: PARTY
-- 02       certificateNumber     String       20       Certificate number
-- 03       reportNumber          String       9        Unique report number
-- 04       partyTypeCode         String       10       ENTITY, INDIVIDUAL
-- 05       partyOrgName          String       100      Organization name of entity interested party. This field is surrounded by double quotes.
-- 06       partyLastName         String       100      Last name of individual interested party. This field is surrounded by double quotes.
-- 07       partyFirstName        String       45       First name of individual interested party. This field is surrounded by double quotes.
-- 08       partyCity             String       30       Business location city of interested party. This field is surrounded by double quotes.
-- 09       partyStateCode        String       2        Business location state of interested party
-- 10       partyCountryCode      String       3        Business location country of interested party
-- 11       controllingInterest   String       1        Value: Y or N
-- 12       intermediaryInterest  String       1        Value: Y or N

\COPY tec.form1295_interested_party FROM './data/1295Certificates_PARTY.csv' WITH ( FORMAT CSV, HEADER true )

CREATE INDEX ON tec.form1295_interested_party ( reportNumber );
