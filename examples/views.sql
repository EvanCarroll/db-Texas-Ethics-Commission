--
-- These are views I may want to later on include in the standard distribution
--

SELECT *
FROM tec.c_filerdata
WHERE filernamelast = 'Bush'
	AND filernamefirst = 'George P.';


CREATE VIEW tec.view_reports AS
	SELECT filer.filerident, filer.filertypecd, filer.filername
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
	ORDER BY fileddt;

CREATE VIEW tec.view_contribution AS
	SELECT filer.filerident, filer.filertypecd, filer.filername
		, reportinfoident
		, contributioninfoid
		, contributionamount
		, contributornameorganization
		, contributoremployer
		, contributoroccupation
		, contributorjobtitle
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
	ORDER BY contributiondt;

CREATE VIEW tec.view_expense AS
	SELECT filer.filerident, filer.filertypecd, filer.filername
		, ed.receiveddt
		, ed.expenddt
		, expendcategorycodelabel
		, expenddescr
		, expendcatdescr
		
		, expendinfoid         
		, expendamount         
		, expendcatcd          
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
	ORDER BY ed.expenddt;

CREATE VIEW tec.view_pledges AS
	SELECT filer.filerident, filer.filertypecd, filer.filername
		pledgedt,
		pledgeroccupation,
		pledgerstreetcity,
		pledgernamefirst,
		pledgernamelast,
		pledgeamount
	FROM tec.c_filerdata AS filer
	INNER JOIN tec.c_coversheet1data AS cs
		USING (filerident, filertypecd)
	INNER JOIN tec.c_pledgedata
		USING (reportinfoident);
	
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
