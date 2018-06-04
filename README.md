Texas Ethics Commission - Schema Loader
====

This is a [PostgreSQL schema loader](https://www.postgresql.org/) for the data
provided by [Texas Ethics Commission](https://www.ethics.state.tx.us/).

We provide a utility to

* extract schema from [PDSERF/Plus format](https://dba.stackexchange.com/a/207425/2639) export by reading the ReadMe files and parse them to determine the schema, types, and keys and constraints.
* create the tables needed to load up the 1295 certs -- these are hand written from the pdf documentation by provided by TEC
* load the data up from csv format into the tables we create

Internally, lines from PDSERF readme are either,

 * Table Description rows
 * Column Description-cotd rows
 * Column rows
 * Start-rows for table (Start with "Record #:")
 * End-rows for table   (Containing just a `-`)

Column lines are either

 * Indented as part of a group (array) replicated a certain amount of times
 * Derived from a "single line"

All data is loaded up into PostgreSQL, including the Descriptions which we pull
down as
[`COMMENTS`](https://www.postgresql.org/docs/current/static/sql-syntax.html).

You can find the readmes from the Texas Ethics Commission added in this project here:

* [Contribution Data Readme](./data/TEC_CF_CSV/ReadMe.txt)
* [Lobby Data Readme](./data/TEC_LA_CSV/LobbyLAR-ReadMe.txt)
* [Form 1295](./data/tec_docs/1295CertificatesCSVFormat.pdf)
* [Texas PDSERF/Plus
Electronic Reporting Format](./data/tec_docs/TX_ERF13_7.pdf)

Links
====

* [TEC data](https://www.ethics.state.tx.us/dfs/search_CF.htm).
* [PDSERF](https://dba.stackexchange.com/a/207425/2639) format

Installation
====

Requirements: PostgreSQL, git, curl

Repo download and database setup (example in bash):
```
$ git clone https://github.com/EvanCarroll/db-Texas-Ethics-Commission.git
$ cd ./db-Texas-Ethics-Commission
$ ./scripts/download_and_extract.sh
$ createdb tec
$ psql -f ./runme.sql
```

Background
====

Created at [Houston Hackathon 2018](http://houstonhackathon.com/) as the sole
work of Evan Carroll.

License
====

If you use this, open source all (100%) of your stuff, or I'll litigate.
The GPL is not the AGPL. Please read, and be advised:

[GNU Affero General Public License
v3](https://www.gnu.org/licenses/agpl-3.0.html), see included
[LICENSE.md](./LICENSE.md)

Contact
====

Contact Evan Carroll 281.901.0011 for a quote on development.
