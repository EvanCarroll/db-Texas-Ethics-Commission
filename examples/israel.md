Which candidate takes their bribes in firearms?

	```sql
	SELECT recipientnamelast, recipientnamefirst, activitydescription
	FROM tec.l_giftdata
	WHERE activitydescription ILIKE ANY ( ARRAY [
		'%gun%',
		'%rifle%',
		'%pistol%',
		'%firearm%',
		'%glock%',
		'%caliber%',
		'%weapon%',
		'%shooting%'
	] )
	ORDER BY recipientnamelast;
	```

----

Which lobbiest are working for Israeli interests?

	```sql
	SELECT filerident, filername, onbehalfname
	FROM tec.l_individualreportingdata
	WHERE onbehalfname like '%American Israel%';
	```

	For Texas,
		* Mr. Jeffrey Mendelsohn, who works for
			* American Israel Education Foundation
			* American Israel Public Affairs committee
		* Mr. Santiago Lucero, working for AIPAC

----


Which politicians got paid travel to or in Israel?

	```sql
	SELECT recipientnamefirst, recipientnamelast, travelpurpose
	FROM l_transportationdata
	WHERE travelpurpose ILIKE '%Israel%'
	OR lodgingstreetcity LIKE ANY(ARRAY[
					'%Hagoshrim%', '%Jerusalem%', '%Safed%', '%Tel Aviv%', '%Tiberias%', '%Metulla%'
	])
	OR arrivalcity LIKE ANY(ARRAY[
					'%Hagoshrim%', '%Jerusalem%', '%Safed%', '%Tel Aviv%', '%Tiberias%', '%Metulla%'
	])
	OR lodgingstreetcountrycd = 'IRL'
	ORDER BY recipientnamelast;
	```
