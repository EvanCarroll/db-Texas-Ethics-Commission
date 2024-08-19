Basic
====


Information on the candidate
----

Top 10 Largest Fundraising Campaigns

```sql
SELECT
	filer.filerident,
	filer.filername,
	sum(cd.contributionamount)
FROM tec.c_filerdata filer
JOIN tec.c_coversheet1data cs USING (filerident, filertypecd)
JOIN tec.c_contributiondata cd USING (reportinfoident)
GROUP BY filer.filerident, filer.filername
ORDER BY sum(cd.contributionamount) DESC
FETCH FIRST 10 ROWS ONLY;
```

George P Bush
====

Candidate Information
----

```sql
SELECT *
FROM tec.c_filerdata
WHERE filernamelast = 'Bush'
	AND filernamefirst = 'George P.';
```


Reports filed with TEC for George P Bush
----

```sql
SELECT filer.filername
	, fileddt
	, periodstartdt
	, periodenddt
	, totalcontribamount
	, contribsmaintainedamount
	, totalexpendamount
	, loanbalanceamount
FROM tec.c_filerdata AS filer
JOIN tec.c_coversheet1data AS cs
	USING (filerident, filertypecd)
WHERE filer.filernamelast = 'Bush'
	AND filer.filernamefirst = 'George P.'
ORDER BY fileddt;
```


Contributions to George P. Bush
----

```sql
SELECT filer.filername
	, contributoroccupation
	, contributorjobtitle
	, contributionamount
	, contributornamelast
	, contributornamefirst
	, contributorstreetcity
	, contributorstreetpostalcode
	, contributorspouselawfirmname
	, contributorparent1lawfirmname
FROM tec.c_filerdata AS filer
INNER JOIN tec.c_coversheet1data AS cs
	USING (filerident, filertypecd)
INNER JOIN tec.c_contributiondata AS cd
	USING (reportinfoident)
WHERE filer.filernamelast = 'Bush'
	AND filer.filernamefirst = 'George P.'
ORDER BY contributiondt;
```



Campaign Expenses
----

```sql
SELECT
	cs.filername
	, ed.receiveddt
	, ed.expenddt
	, expendcategorycodelabel
	, expenddescr
	, expendamount
	, expendcatdescr
	
	, expendinfoid         
	, expenddt             
	, expendamount         
	, expenddescr          
	, expendcatcd          
	, expendcatdescr       
	, payeepersenttypecd   
	, payeenameorganization
	, payeenamelast        
	, payeenamefirst       
	, payeestreetaddr1     
	, payeestreetcity      
	, payeestreetstatecd   
	, payeestreetpostalcode
FROM tec.c_filerdata AS filer
INNER JOIN tec.c_coversheet1data AS cs
	USING (filerident, filertypecd)
INNER JOIN tec.c_expenddata AS ed
	USING (reportinfoident)
LEFT OUTER JOIN tec.c_expendcategory AS ec
	ON ( ec.expendcategorycodevalue = ed.expendcatcd )
WHERE filer.filernamelast = 'Bush'
	AND filer.filernamefirst = 'George P.'
ORDER BY ed.expenddt;
```

External entities that spend money on the candidate
----

```sql
-- filerident is not for the candidate, filed by third parties
SELECT candidatenamelast
	, candidatenamefirst
	, expenddt
	, filername
	, expendamount
	, expendcategorycodelabel
	, expenddescr
	, receiveddt
FROM tec.c_candidatedata AS cd
JOIN tec.c_expendcategory AS cat
	ON (cat.expendcategorycodevalue = cd.expendcatcd)
WHERE candidatenamelast LIKE '%Bush%'
	AND candidatenamefirst LIKE '%George P%'
ORDER BY expenddt;
```


Pledges to George P. Bush
----

```sql
SELECT filer.filername, pledgedt, pledgeroccupation, pledgerstreetcity, pledgernamefirst, pledgernamelast, pledgeamount
FROM tec.c_filerdata AS filer
INNER JOIN tec.c_coversheet1data AS cs
	USING (filerident, filertypecd)
INNER JOIN tec.c_pledgedata
	USING (reportinfoident)
WHERE filer.filernamelast = 'Bush'
	AND filer.filernamefirst = 'George P.';
```


-- Small mostly dead tables
-- Nothing here to make sense of even
-- SELECT
-- 	filer.filername, *
-- FROM tec.c_filerdata AS filer
-- JOIN tec.c_coversheet1data AS cs
-- 	USING (filerident, filertypecd)
-- JOIN tec.c_assetdata AS ad
-- 	USING (reportinfoident)
-- WHERE filer.filernamelast = 'Bush'
-- 	AND filer.filernamefirst = 'George P.';

-- There is also a specific purpose committee table but it's mostly empty
-- SELECT * FROM tec.c_spacdata WHERE candidatefilername like '%Bush%'
