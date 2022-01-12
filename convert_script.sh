# For all pdf files in sub-directories, fill the html tags, enter to markdown output

cat > index.md <<'EOF'
# Presentations by Aliakbar Akbaritabar 
## On reverse chronological order

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

<!-- pdfs here -->

EOF

read -r -d '' html_needed <<'EOF'

### %s

<object data="%s" type="application/pdf" width="500px" height="500px">
    <embed src="%s">
        <p>This browser does not support PDFs. Please download the PDF to view it: <a href="%s">Download PDF</a>.</p>
    </embed>
</object>

EOF

for filename in `ls ./docs/*/*.pdf | sort -r` ; do
    echo "##### importing file: " $filename " "
    printf "\n" >> index.md
    printf "$html_needed" $filename $filename $filename $filename >> index.md
    printf "\n" >> index.md
done

# Learned and adopted many hints on bash script from here: http://www.compciv.org/topics/web/heredocs_and_html/