Texas Ethics Commission - Schema Loader
====

This is a [PostgreSQL schema loader](https://www.postgresql.org/) for the data
provided by [Texas Ethics Commission](https://www.ethics.state.tx.us/).

We provide a utility to extract schema from [PDSERF/Plus
format](https://dba.stackexchange.com/a/207425/2639) export. We read the ReadMe
files and parse them to determine the schema, types, and keys and constraints.

Internally, lines from the readme are either,

 * Table Description rows
 * Column Description-cotd rows
 * Column rows
 * Start-rows for table (Start with "Record #:")
 * End-rows for table   (Containing just a `-`)

Column rows are either

	* Indented as part of a group (array) replicated a certain amount of times
	* Derived from a "single line"

All data is loaded up into PostgreSQL, including the Descriptions which we pull
down as
[`COMMENTS`](https://www.postgresql.org/docs/current/static/sql-syntax.html).

Links
====

* [the TEC data](https://www.ethics.state.tx.us/dfs/search_CF.htm).
* [PDSERF](https://dba.stackexchange.com/a/207425/2639) format

Background
====

Created at [Houston Hackathon 2018](http://houstonhackathon.com/) as the sole
work of Evan Carroll.

License
====

If you use this, open source all your (100%) of your stuff or I'll litigate.
The GPL is not the AGPL. Please read and be advised.

[GNU Affero General Public License
v3](https://www.gnu.org/licenses/agpl-3.0.html), see included
[LICENSE.md](./LICENSE.md)

Contact
====

Contact Evan Carroll 281.901.0011 for a quote on development.
