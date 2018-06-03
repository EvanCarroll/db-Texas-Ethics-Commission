# Download and Extract utility for ethics.state.tx.us
# Copyright (C) 2018  Evan Carroll
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

cat <<'EOF'
	Texas Ethics Commission - downloader
	Starting to downoad now, make sure you have `curl`
EOF

if [ ! -d "./data" ]; then
	mkdir "./data";
fi

curl --progress-bar --remote-name-all -- \
	"https://www.ethics.state.tx.us/tedd/TEC_CF_CSV.zip" \
	"https://www.ethics.state.tx.us/tedd/TEC_LA_CSV.zip" \
	"https://www.ethics.state.tx.us/tedd/1295Certificates.csv";

cat <<'EOF'
	Unzipping contents
	Acknowledge yes to update any ReadMe.txt with the latest version
EOF
unzip -d "./data/TEC_LA_CSV" "TEC_LA_CSV.zip"
unzip -d "./data/TEC_CF_CSV" "TEC_CF_CSV.zip"
mv "1295Certificates.csv" "./data/1295Certificates.csv"

rm "TEC_CF_CSV.zip" "TEC_LA_CSV.zip"
