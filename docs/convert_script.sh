# For all pdf files in sub-directories, fill the html tags, enter to markdown output

cat > index.md <<'EOF'
# Presentations by Aliakbar Akbaritabar 

See here for the files of all presentations available under GPL-3.0 License: [https://github.com/akbaritabar/presentations](https://github.com/akbaritabar/presentations) 

**To cite**:

> Akbaritabar, A. (2022). Presentations. https://github.com/akbaritabar/presentations/docs/NAME-OF-SPECIFIC-PRESENTATION-FILE

```bibtex
@misc{akbaritabar2022,
  title = {Presentations: NAME-OF-SPECIFIC-PRESENTATION-FILE},
  author = {Akbaritabar, Aliakbar},
  year = {2022},
  month = jan,
  copyright = {GPL-3.0}
}
```

## CV
You can see a CV of me [here](./CV_MD/Aliakbar_Akbaritabar_CV.html)

## Presentations on reverse chronological order

Click on links to open each year's presentations.

<!-- pdfs here -->

EOF

read -r -d '' html_needed <<'EOF'

### %s

<object data="%s" type="application/pdf" frameborder="0" width="600px" height="550px" style="padding: 20px;">
    <embed src="https://docs.google.com/viewer?url=https://github.com/akbaritabar/presentations/raw/main/docs/%s&embedded=true" width="600px" height="550px"/>
</object>     

EOF

for filename in `ls ./*/*.pdf | sort -r` ; do

    # create a markdown file per year
    # echo $(dirname "$filename")
    # write year's markdown url to index
    printf "["$filename"]($(dirname "$filename").html)" >> index.md
    printf "\n" >> index.md
    printf "\n" >> index.md

    echo "##### importing file: " $filename " "
    printf "\n" >> "$(dirname "$filename").md"
    printf "$html_needed" $filename $filename $filename >> "$(dirname "$filename").md"
    printf "\n" >> "$(dirname "$filename").md"
done

# Learned and adopted many hints on bash script from here: http://www.compciv.org/topics/web/heredocs_and_html/