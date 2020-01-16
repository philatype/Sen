TTFDIR="./TTFs"
rm -r $TTFDIR/*.ttf

fontmake -g ./Glyphs/sen.glyphs -o ttf -i --output-dir $TTFDIR

for f in $TTFDIR/*.ttf
do
	gftools fix-dsig --autofix $f
	gftools fix-nonhinting $f $f.fix
	mv $f.fix $f
	rm ${f//.ttf/-backup-fonttools-prep-gasp.ttf}
done

# # Clean up
rm -r instance_ufo
rm -r master_ufo
