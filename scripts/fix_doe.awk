#!/usr/bin/gawk -f

$0 !~ /<foreign>/ && $0 !~ /<tei/{
	gsub(/&a?e;/, "æ")
	gsub(/&A?E;/, "Æ")
	gsub(/&amp;/, "&")
	gsub(/&d;/, "ð")
	gsub(/&D;/, "Ð")
	gsub(/&t;/, "þ")
	gsub(/&T;/, "Þ")

	#get rid of all other entities
	gsub(/&[a-zA-Z]+;/, "")
	gsub(/&/, "")

	gsub(/filedesc/, "fileDesc")
	gsub(/<catref[^>]+>/, "")

	#remove markup
	gsub(/<[^>]*>/, "")
	gsub(/^ +/, "")

	if ($0 != "" && $0 !~ /^ +$/)
		print
}

