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

## Computational Social Science Events Worldwide
You can see the calendar I am publicly maintaining [here](./CV_MD/CSS_events_calendar.html)

## Blog posts from older website
My older website (available here: ) had some blog posts on data science and analysis related topics. Some are available here:

<ul>
<li><a href="./CV_MD/out_of_memory_ETL.html"><strong>Parallelized and out of memory data analysis using Dask in Python and DuckDB and DBeaver in SQL. Using example of publicly accessible ORCID 2019 XML files</strong></a></li>
<li><a href="./CV_MD/How_to_use_a_Wikidata_dump.html"><strong>How to use a Wikidata full json dump, requirements, steps and script</strong></a></li>
<li><a href="./CV_MD/herss_world_map_flexdashboard.html"><strong>Key Actors in Higher Education Research and Science Studies (HERSS), a Flexdashobrd developed in R</strong></a></li>
<li><a href="./CV_MD/replicable_network_vis.html"><strong>Get publication-ready, fully replicable network visualizations bringing Visone layouts to R</strong></a></li>
<li><a href="./CV_MD/gScholarShinyApp.html"><strong>Google Scholar Shiny App</strong></a>: A brief application to work with google scholar and build and show coauthorship networks <a href="https://www.youtube.com/watch?v=NZ5WdBnZ-CE">(see video intro here)</a></li>
<li><a href="./CV_MD/git_github_for_academic_writing.html"><strong>Git &amp; Github (or Gitlab) for academic writing; UPDATE: advanced topics video added</strong></a>: How do I use git and github to version control my academic writing projects as a social (data) scientist!</li>
</ul>


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