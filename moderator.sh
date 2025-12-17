#!/usr/bin/bash
# moderator.sh

for file in *.chem
do
    chem "$file" | groff -p -Tpdf > "$file".pdf && \
    pdf2svg "$file".pdf "$file".svg && \
    cairosvg "$file".svg  -f png --dpi 120 -o "$file".png && \
    convert "$file".png -trim "$file".png  && \
    rm "$file".pdf "$file".svg
done
