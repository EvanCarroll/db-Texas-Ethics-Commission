#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

.PHONY: all clean unzip devgen perlinstall fixups perlscripts mkdir

all: download unzip combinecerts perlscripts 

DIR_DATA=./data
DIR_TEC_DOCS=${DIR_DATA}/tec_docs
TEC_URL=https://ethics.state.tx.us/data

devgen: download unzip combinecerts textify perlinstall gen_schema.pl

%.pl:
	perl "scripts/$@"

textify: $(DIR_TEC_DOCS)/cf_new.txt $(DIR_TEC_DOCS)/cf_old.txt

mkdir:
	- mkdir ${DIR_DATA} ${DIR_TEC_DOCS} 2>/dev/null || true

download:
	curl --progress-bar \
		-o "${DIR_TEC_DOCS}/TX_ERF13_7.pdf"                              "${TEC_URL}/search/cf/TX_ERF13_7.pdf"                                \
		-o "${DIR_TEC_DOCS}/HowToImportContributionsAndExpenditures.pdf" "${TEC_URL}/filinginfo/HowToImportContributionsAndExpenditures.pdf"  \
		-o "${DIR_TEC_DOCS}/CampaignFinanceCSVFileFormat.pdf"            "${TEC_URL}/search/cf/CampaignFinanceCSVFileFormat.pdf"              \
		-o "${DIR_TEC_DOCS}/1295CertificatesCSVFormat.pdf"               "${TEC_URL}/search/1295/1295CertificatesCSVFormat.pdf"               \
		-o "$(DIR_DATA)/1295Certificates_2016_to_2020.csv"               "${TEC_URL}/search/1295/1295Certificates_2016_to_2020.csv"           \
		-o "$(DIR_DATA)/1295Certificates_2021_to_2025.csv"               "${TEC_URL}/search/1295/1295Certificates_2021_to_2025.csv"           \
		-o "$(DIR_DATA)/1295Certificates_2026_to_2030.csv"               "${TEC_URL}/search/1295/1295Certificates_2026_to_2030.csv"           \
		-o "${DIR_DATA}/TEC_LA_CSV.zip"                                  "https://prd.tecprd.ethicsefile.com/public/lobby/public/TEC_LA_CSV.zip"                             \
		-o "${DIR_DATA}/TEC_CF_CSV.zip"                                  "https://prd.tecprd.ethicsefile.com/public/cf/public/TEC_CF_CSV.zip";

unzip:
	unzip -o -d "${DIR_DATA}/TEC_LA_CSV" "${DIR_DATA}/TEC_LA_CSV.zip"
	unzip -o -d "${DIR_DATA}/TEC_CF_CSV" "${DIR_DATA}/TEC_CF_CSV.zip"

# Combine the split 1295 cert files to single file
combinecerts:
	cat "$(DIR_DATA)/1295Certificates_2016_to_2020.csv" \
	    "$(DIR_DATA)/1295Certificates_2021_to_2025.csv" \
		  "$(DIR_DATA)/1295Certificates_2026_to_2030.csv" \
	> "$(DIR_DATA)/1295Certificates.csv"
	rm "$(DIR_DATA)/1295Certificates_2016_to_2020.csv"  \
		"$(DIR_DATA)/1295Certificates_2021_to_2025.csv"   \
		"$(DIR_DATA)/1295Certificates_2026_to_2030.csv"

%cf_old.txt:
	ps2txt "$(DIR_TEC_DOCS)/TX_ERF13_7.pdf" > "$@"

%cf_new.txt:
	ps2txt "$(DIR_TEC_DOCS)/CampaignFinanceCSVFileFormat.pdf" > "$@"

clean:
	git clean -fx data/

perlinstall:
	cpanm --local-lib=~/perl5 local::lib && eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib); perl -MMoose -e1 2>/dev/null || cpanm Moose
	cpanm --local-lib=~/perl5 local::lib && eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib); perl -MDataExtract::FixedWidth -e1 2>/dev/null || cpanm DataExtract::FixedWidth
	cpanm --local-lib=~/perl5 local::lib && eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib); perl -MText::CSV -e1 2>/dev/null || cpanm Text::CSV

perlscripts:
	cpanm --local-lib=~/perl5 local::lib && eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib); perl scripts/1295_seperator.pl

fixups:
	echo "Running fixups"
	sed -i -e 's/ LANDCOMM/LANDCOMM/g'                            \
		-e 's/" NONE"/"NONE"/g' data/TEC_CF_CSV/*.csv # strip leading space
## Pad CSV rows with missing trailing columns to match header
	perl scripts/pad_csv_columns.pl data/TEC_CF_CSV/filers.csv
	echo 'EXCAT,UNKNOWN,"User added UNKNOWN"' >> data/TEC_CF_CSV/expn_catg.csv
## Clear filerIdent field if it contains an email address (field 2, should be integer)
	perl -F',' -i.bak -lane 'if ($$F[1] =~ /@/) { warn "CLEARING: filerIdent detected email address [$$F[1]]\n"; $$F[1] = ""; } print join(",", @F);' data/TEC_CF_CSV/filers.csv && rm -f data/TEC_CF_CSV/filers.csv.bak
## fix up the CFS-ReadMe.txt file's missing missing commActivityName column definition found in the purpose.csv, and update 06_c_CoverSheet3Data.sql to match the new column definition
	./scripts/purpose_csv_fix.sh sql/gen/TEC_CF_CSV/06_c_CoverSheet3Data.sql		
	echo "FINISHED Make fixups"
