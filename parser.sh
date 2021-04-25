OLDIFS=$IFS; IFS=';' blocks=$(sed -n '/Nmap scan report /,/\\n/ {/Nmap scan report / s/^/\;/; p}'  $1);
for block in ${blocks#;}; do 
	FILE=$(echo $block | grep "for" | cut -d " " -f 5) 
	mkdir output
	echo $block >> "output/$FILE.txt"
done; IFS=$OLDIFS 
