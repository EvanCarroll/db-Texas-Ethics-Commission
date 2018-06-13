.PHONY: all clean
	
all: textify

textify: cf_new.txt cf_old.txt

cf_new.txt:
	ps2txt TX_ERF13_7.pdf > "$@"

cf_old.txt:
	ps2txt CampaignFinanceCSVFileFormat.pdf > "$@"

clean:
	rm -vf cf_new.txt cf_old.txt

#1295CertificatesCSVFormat.pdf
