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

.PHONY: all clean unzip devgen
	
all: download unzip 1295_seperator.pl

DIR_DATA=./data
DIR_TEC_DOCS=$(DIR_DATA)/tec_docs

devgen: download unzip textify gen_schema.pl

%.pl:
	perl "scripts/$@"

textify: $(DIR_TEC_DOCS)/cf_new.txt $(DIR_TEC_DOCS)/cf_old.txt
unzip:   $(DIR_DATA)/TEC_CF_CSV     $(DIR_DATA)/TEC_LA_CSV

download: TEC_CF_CSV.zip TEC_LA_CSV.zip 1295Certificates.csv
	(cd "$(DIR_TEC_DOCS)" && curl --progress-bar --remote-name-all -- \
		"https://www.ethics.state.tx.us/software/TX_ERF13_7.pdf" \
		"https://www.ethics.state.tx.us/software/CampaignFinanceCSVFileFormat.pdf" \
		"https://www.ethics.state.tx.us/tedd/1295CertificatesCSVFormat.pdf"; )

%.zip %.csv:
	(cd "$(DIR_DATA)"     && curl --progress-bar --remote-name-all -- \
		"https://www.ethics.state.tx.us/tedd/$@"; )

%TEC_LA_CSV:
	unzip -o -d "$@" "$@.zip"

%TEC_CF_CSV:
	unzip -o -d "$@" "$@.zip"

%cf_old.txt:
	ps2txt "$(DIR_TEC_DOCS)/TX_ERF13_7.pdf" > "$@"

%cf_new.txt:
	ps2txt "$(DIR_TEC_DOCS)/CampaignFinanceCSVFileFormat.pdf" > "$@"

clean:
	rm -vf "$(DIR_TEC_DOCS)/cf_new.txt" "$(DIR_TEC_DOCS)/cf_old.txt" "$(DIR_DATA)/*.zip"

#1295CertificatesCSVFormat.pdf
