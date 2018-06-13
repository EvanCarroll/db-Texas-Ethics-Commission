DROP TABLE IF EXISTS tec.codes_person_entity;
CREATE TABLE tec.codes_person_entity (
	person_entity_id         text PRIMARY KEY,
	person_entity_count      smallint,
	person_entity_addresses  text,
	person_entity_phone      text,
	person_entity_notes      text
);

COMMENT ON TABLE tec.codes_person_entity IS
	$$The following record types have the person/entity data listed in Table 10.  Person/entity data is always placed on the end of a record. A record type may have multiple person/entities. See the record layouts for exact contents and field order.$$;

INSERT INTO tec.codes_person_entity
VALUES
	( 'COMMACTIVITY' ,2,'Street'      ,'None'   ,'For candidate, treasurer, etc.' ),
	( 'CONTRIBUTION' ,1,'Street'      ,'None'   ,'For contributor.' ),
	( 'CREDIT'       ,1,'Street'      ,'None'   ,'For payor.' ),
	( 'EXPEND'       ,1,'Street'      ,'None'   ,'For payee.' ),
	( 'EXPENDNOCON'  ,1,'Street'      ,'None'   ,$$For 'no consent'. A single expenditure can have multiple records.$$ ),
	( 'LOAN'         ,2,'Street'      ,'None'   ,'For lender – person and/or financial instutution.' ),
	( 'LOANGUAR'     ,1,'Street'      ,'None'   ,'For guarantor. A single loan can have multiple records.' ),
	( 'PLEDGE'       ,1,'Street'      ,'None'   ,'For pledger.' ),
	( 'REPORT'       ,3,'Mail/Street' ,'Primary','For chair, filer and treasurer.' ),
	( 'TRAVEL'       ,1,'None'        ,'None'   ,'For traveller.' );

