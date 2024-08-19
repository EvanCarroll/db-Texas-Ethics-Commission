Which candidate takes their bribes in firearms?
====

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
