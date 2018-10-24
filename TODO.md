# TODO

## Technical

### Constraint

It would be nice to abstract out column and table constraints to an fkey
constraint object which we could render on either one. All column constraints
are table constraints, but I could see it useful to have both. Currently we're
suffering from shortcomming of column constraints that we need to make null.

### Examine and create foreign keys

All things that are marked end in,

* `id`
* `cd`

Should link, *somewhere*. We don't always know where they should link, or where
that data comes. In many cases, we can presume that the reference is *weak*.
All weak referneces should be made as [`NOT
VALID`](https://www.postgresql.org/docs/current/static/sql-altertable.html) and
we should make notations about them, perhaps here.  This query will show all
columns that end in `id` or `cd` that do *not* already have indexes, like this..

```
SELECT table_catalog, table_schema, table_name, column_name
FROM information_schema.columns AS c
-- no views
WHERE NOT EXISTS (
	SELECT
	FROM information_schema.views AS v
	WHERE v.table_catalog = c.table_catalog
		AND v.table_schema  = c.table_schema
		AND v.table_name    = c.table_name
)
-- where there is no constraint
AND NOT EXISTS (
	SELECT
	FROM information_schema.table_constraints AS tc
	JOIN information_schema.key_column_usage AS kcu
		USING ( constraint_name )
	WHERE kcu.table_catalog = c.table_catalog
		AND kcu.table_schema  = c.table_schema
		AND kcu.table_name    = c.table_name
		AND kcu.column_name   = c.column_name
)
AND table_schema = 'tec'
AND column_name LIKE any(ARRAY['%id', '%cd']);
```

This is our list to work towards for completion. You can further generate a
list of distinct values like this,

```
SELECT 'CREATE TEMP TABLE results AS ' || string_agg(
	FORMAT('SELECT DISTINCT %I FROM %I.%I.%I ', column_name, table_catalog, table_schema, table_name),
	E'\n\tUNION '
) 
FROM information_schema.columns AS c
WHERE NOT EXISTS (
  SELECT
  FROM information_schema.views AS v
  WHERE v.table_catalog = c.table_catalog
    AND v.table_schema  = c.table_schema
    AND v.table_name    = c.table_name
)
AND NOT EXISTS (
  SELECT
  FROM information_schema.table_constraints AS tc
  JOIN information_schema.key_column_usage AS kcu
    USING ( constraint_name )
  WHERE kcu.table_catalog = c.table_catalog
    AND kcu.table_schema  = c.table_schema
    AND kcu.table_name    = c.table_name
    AND kcu.column_name   = c.column_name
)
AND table_schema = 'tec'
AND column_name LIKE any(ARRAY['%id', '%cd'])
	AND column_name = 'formtypecd'
GROUP BY table_catalog;
```

## Social TODO

It would be great if someone could make contact with Jessie Haug. I have not
yet been successful.

```
Jessie Haug
(512) 463-5800
jessie.haug@ethics.state.tx.us
Director of Disclosure Filing and Computer Services
https://www.ethics.state.tx.us/tec/contact.htm
```

