TODO
====

Technical TODO
====

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
WHERE EXISTS (
		SELECT
		FROM information_schema.table_constraints AS tc
		JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name
		WHERE kcu.table_catalog = c.table_catalog
			AND kcu.table_schema  = c.table_schema
			AND kcu.table_name    = c.table_name
			AND kcu.column_name   = c.column_name
	)
	AND table_schema = 'tec'
	AND column_name LIKE any(ARRAY['%id', '%cd']);
```

This is our list to work towards for completion.


Validate Indexes
----

We can use [this query here to validate our indexes](https://dba.stackexchange.com/a/209682/2639).

```
SELECT FORMAT(
  'ALTER TABLE %I.%I.%I VALIDATE CONSTRAINT %I;',
  current_database(),
  nsp.nspname,
  cls.relname,
  con.conname
)
FROM pg_constraint AS con
JOIN pg_class AS cls
  ON con.conrelid = cls.oid
JOIN pg_namespace AS nsp
  ON cls.relnamespace = nsp.oid
WHERE convalidated IS FALSE
  -- or delete it for all constraints in all schemas
  AND nsp.nspname = 'mySchema';
```

Not everyting will validate, much will fail. Things that fail should be
examined thorughly and communicated with TEC. Things that pass should be
examined to make the indexes as `VALID` on table creation.

Social TODO
====

It would be great if someone could make contact with Jessie Haug. I have not
yet been successful.

```
Jessie Haug
(512) 463-5800
jessie.haug@ethics.state.tx.us
Director of Disclosure Filing and Computer Services
https://www.ethics.state.tx.us/tec/contact.htm
```

