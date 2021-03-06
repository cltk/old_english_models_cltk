#!/usr/bin/gawk -f

/<title>/ {
	in_oe = 0
	match($0, /<title>(.*)<\/title>/, a)
	title = a[1]
}

/==Old English==/ {
	in_oe = 1
	get_template = 1
}

/<comment>/ {
	next
}


/=+Declension=+/ {

	if (in_oe == 1) {
		getline
		gsub("</text>", "")
		print title "\t" $0
	}
}

/=+Conjugation=+/ {
	if (in_oe == 1) {
		printf title "\t"
		do {
			getline
			gsub("</text>", "")
			printf $0
		} while ($0 !~ /\}\}/)
		print ""
	}
}

/----/ {
	in_oe = 0
}



