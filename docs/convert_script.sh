# For all pdf files in sub-directories, fill the html tags, enter to markdown output

cat > index.md <<'EOF'
# Introduction

<p>Hello there !</p>

<p>I am Ali (short for Aliakbar Akbaritabar)</p>

<p>I like to call myself a <strong>Social Data Scientist</strong>. It is mainly what data scientists are doing plus a sociological approach which is what I have been studying for most of my academic life. A couple of times I have been asked what does it mean, I have added a description below.</p>

<hr />

<p>What do I mean by <strong>Social Data Scientist</strong>?!</p>
<p>In 2017, when I was shortly back to my country, Iran, my friend's colleague asked me a short question about my everyday job. A short, but hard question, she asked:</p>
<blockquote>
<p>"When you say, you work on a daily basis with data, as a social data scientist, what does that mean? What do you do with data?"</p>
</blockquote>
<p>I gave an answer, which seemed incomplete to myself by then. I have been searching and thinking about it. Once more, I was describing it to someone else and the answer seems more mature to me. My job includes taking a few steps:</p>
<ol style="list-style-type: decimal">
<li><strong>Question</strong>: First I need to ask relevant questions. I also need to figure out which kind of data can help in answering those questions. The questions can come from many sources, "<em>social</em>" adjective in above title means some of these questions are sociological.</li>
<li><strong>Gather</strong>: I need to gather the data. It can mean scrapping the web for it, sending requests to databases to capture it, building API solutions, or spending time and building a tool to make up data from scratch. I have even designed and carried out my own surveys (both online and offline, see in my <a href="./CV_MD/Aliakbar_Akbaritabar_CV.html">CV</a>).</li>
<li><strong>Clean</strong>: Organizing the data, reshaping it, cleaning it, making it ready to be used is the next step. It can be long and frustrating if previous step has not been done reasonably.</li>
<li><strong>Model</strong>: Then comes the phase when we need to find out which way is the best way to use this data to answer our starting questions. Modeling the data in statistical, relational (Networks and network analysis is here) and structural or other modeling frameworks appear here. Sometimes, I need to first learn those models, reshape my data according to them and then apply the models. "<em>Social</em>" adjective in above title means some of these models are stemmed from sociological theories or methodologies.</li>
<li><strong>Report</strong>: At the end, my main job is to prepare reports describing all above steps and main findings. I have put quite a high level of energy to generate reports dynamically from previous steps. It has made my life so much easier, faster, and replicable in future and besides, less prone to errors (read more about it <a href="./CV_MD/git_github_for_academic_writing.html">here</a>).</li>
<li><strong>Present</strong>: sharing the results in conferences and publishing them, which in itself is another world, is the next step. Of course, then comes getting feedback and repeating all of the above.</li>
</ol>
<p>These are <strong>the main steps</strong>, in short: ask questions, gather data, clean data, model it, interpret, report and present it.</p>

<hr />

## CV
You can see a CV of me [here](./CV_MD/Aliakbar_Akbaritabar_CV.html)

<hr />

## How to reach me?
Twitter: @akbaritabar, <a rel="me" href="https://mastodon.social/@Akbaritabar">https://mastodon.social/@Akbaritabar</a> or email (akbaritabar [at] demogr.mpg.de)!

<hr />

## Computational Social Science Events Worldwide
You can see the calendar I am publicly maintaining [here](./CV_MD/CSS_events_calendar.html)

<hr />


## Blog posts from older website
My older website (available here: https://akbaritabar.netlify.app/) had some blog posts on data science and analysis related topics. Some are available here:

<ul>
<li><a href="./CV_MD/out_of_memory_ETL.html">Parallelized and out of memory data analysis using Dask in Python and DuckDB and DBeaver in SQL. Using example of publicly accessible ORCID 2019 XML files</a></li>
<li><a href="./CV_MD/How_to_use_a_Wikidata_dump.html">How to use a Wikidata full json dump, requirements, steps and script</a></li>
<li><a href="./CV_MD/herss_world_map_flexdashboard.html">Key Actors in Higher Education Research and Science Studies (HERSS), a Flexdashobrd developed in R</a></li>
<li><a href="./CV_MD/replicable_network_vis.html">Get publication-ready, fully replicable network visualizations bringing Visone layouts to R</a></li>
<li><a href="./CV_MD/gScholarShinyApp.html">Google Scholar Shiny App</a>: A brief application to work with google scholar and build and show coauthorship networks <a href="https://www.youtube.com/watch?v=NZ5WdBnZ-CE">(see video intro here)</a></li>
<li><a href="./CV_MD/git_github_for_academic_writing.html">Git &amp; Github (or Gitlab) for academic writing; UPDATE: advanced topics video added</a>: How do I use git and github to version control my academic writing projects as a social data scientist!</li>
</ul>

<hr />

## Presentations on reverse chronological order

See here for the files of all presentations available under GPL-3.0 License: [https://github.com/akbaritabar/akbaritabar.github.io](https://github.com/akbaritabar/akbaritabar.github.io) 

**To cite**:

> Akbaritabar, A. (2022). Intro, CV and archive of presentations by Aliakbar Akbaritabar. https://github.com/akbaritabar/akbaritabar.github.io/docs/NAME-OF-SPECIFIC-PRESENTATION-FILE

```bibtex

@misc{akbaritabarIntroCVArchive2022,
	title = {Intro, {CV} and archive of presentations by {Aliakbar} {Akbaritabar}},
	copyright = {GPL-3.0},
	url = {https://github.com/akbaritabar/akbaritabar.github.io},
	abstract = {Intro, CV and archive of presentations by Aliakbar Akbaritabar (https://akbaritabar.github.io/), use under GPL-3.0 License},
	urldate = {2022-04-17},
	author = {Akbaritabar, Aliakbar},
	year = {2022},
	note = {original-date: 2022-01-11T21:20:21Z},
}

```

Click on links to open each year's presentations.

<!-- pdfs here -->

EOF

read -r -d '' html_needed <<'EOF'

### %s

<object data="%s" type="application/pdf" frameborder="0" width="600px" height="550px" style="padding: 20px;">
    <embed src="https://docs.google.com/viewer?url=https://github.com/akbaritabar/akbaritabar.github.io/raw/main/docs/%s&embedded=true" width="600px" height="550px"/>
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
