TTFDIR="./TTFs"
rm -r $TTFDIR/*.ttf

fontmake -g ./Glyphs/sen.glyphs -o ttf -i --output-dir $TTFDIR -a

for f in $TTFDIR/*.ttf
do
	gftools fix-dsig --autofix $f
	gftools fix-hinting $f $f.fix
	mv $f.fix $f
done

# # Clean up
rm -r instance_ufo
rm -r master_ufo
