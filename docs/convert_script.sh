# For all pdf files in sub-directories, fill the html tags, enter to markdown output

cat > index.md <<'EOF'
# Introduction

Hello! I am Ali (Aliakbar Akbaritabar), Assistant Professor of Computational Social Science at the University of Rostock and Research Scientist at the Max Planck Institute for Demographic Research.

I am a computational social scientist with a sociology background, working at the intersection of social data science, demography, high-skilled migration, inequalities in the science system, and reproducible and open science practices.

**Read more**: [Thinking spatially in computational social science (EPJ Data Science, 2024)](https://doi.org/10.1140/epjds/s13688-023-00443-0)

I am open to tenure-track, tenured, and permanent positions in computational social science, social data science, demography, and sociology, broadly defined.

Below you can find my CV, publications, open materials, course resources, and presentation archive.

<img src="CV_MD/productivity_cumulative_2013_2026.png" alt="Cumulative whole and fractional counts of publications, courses, and presentations (2013 - June 2026) by item type" style="width: 85%;">

<hr />

## CV
See and download my CV [here](./CV_MD/Aliakbar_Akbaritabar_CV.html).

<hr />

## Recent Publications

For a complete and up-to-date publication list:

- [Google Scholar](https://scholar.google.com/citations?user=zufgVroAAAAJ&hl=en)
- [ORCID](https://orcid.org/0000-0003-3828-1533)
- [OpenAlex](https://openalex.org/works?filter=authorships.author.id:a5110124154\|a5067953991\|a5075794287)

<hr />

## Replication Materials, Code, and Data

- [Zenodo](https://zenodo.org/search?q=metadata.creators.person_or_org.name%3A%22Akbaritabar%2C%20Aliakbar%22)
- [GitHub](https://github.com/akbaritabar)
- [GitLab](https://gitlab.com/akbaritabar)

<hr />

## Courses and Syllabi

Current course syllabi (University of Rostock and MPIDR) are available [here](./Courses_Syllabus.html).

Selected openly available course materials:

- [Introduction to Computational Social Science (2025)](https://doi.org/10.5281/zenodo.21419599)
- [Computational Approaches to Migration Research (2025-2026)](https://doi.org/10.5281/zenodo.21419603)
- [Interactive Self-Paced Course on Git, GitHub, and Reproducible Collaboration (2026)](https://doi.org/10.5281/zenodo.21439793)
- [Introduction to Demographic Methods (2026)](https://doi.org/10.5281/zenodo.21419594)

<hr />

## Open Science Demography

With several colleagues, we have started the Open Science Demography, a community of demographers and social scientists committed to open science practices.

- Community: [OpenScienceDemography](https://github.com/OpenScienceDemography)
- Resource list: [Awesome Demographic Methods](https://opensciencedemography.github.io/awesome-demographic-methods/)

In June 2026 at the European Population Conference (University of Bologna), Tom Theile and I received the EAPS Open Science and Outreach Award for Population Studies for contributions to the [Scholarly Migration Database](https://www.scholarlymigration.org/). 

Award details: [EAPS Outreach Award](https://eaps.nl/page/Outreach-award)

<hr />

## Computational Social Science Events Worldwide

I maintain a public calendar of computational social science events.  
Read more and subscribe [here](./CV_MD/CSS_events_calendar.html).

<iframe src="https://calendar.google.com/calendar/embed?src=19jm0329h91akpv0srml6c24ec%40group.calendar.google.com&ctz=Europe%2FRome" style="border: 0" width="600" height="550" frameborder="0" scrolling="no"></iframe>

<hr />

## Selected Posts from My Previous Website

My previous website included posts on data science and computational methods. Selected posts:

- [Parallelized and Out-of-Memory Data Analysis with Dask, DuckDB, and DBeaver (ORCID 2019 XML case)](./CV_MD/out_of_memory_ETL.html)
- [How to Use a Wikidata Full JSON Dump](./CV_MD/How_to_use_a_Wikidata_dump.html)
- [Key Actors in HERSS: Flexdashboard in R](./CV_MD/herss_world_map_flexdashboard.html)
- [Publication-Ready, Replicable Network Visualizations from Visone to R](./CV_MD/replicable_network_vis.html)
- [Google Scholar Shiny App](./CV_MD/gScholarShinyApp.html) ([video intro](https://www.youtube.com/watch?v=NZ5WdBnZ-CE))
- [Git and GitHub/GitLab for Academic Writing (advanced topics update)](./CV_MD/git_github_for_academic_writing.html)
- [Quantitative sociology of academic work in an era of hypercompetition and rankings](https://akbaritabar.github.io/CV_MD/UNIMI_thesis/)

<hr />

## Contact

Email: akbaritabar [at] demogr.mpg.de  
[LinkedIn](https://www.linkedin.com/in/akbaritabar/) | [BlueSky](https://bsky.app/profile/akbaritabar.bsky.social) | [Mastodon](https://mastodon.social/@Akbaritabar) | Twitter: @akbaritabar

<hr />

## PDF Files of Presentations, Course Materials, and Dissertations

Presentation files are available under GPL-3.0 in this repository:  
[akbaritabar/akbaritabar.github.io](https://github.com/akbaritabar/akbaritabar.github.io)

**Citation template**:

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
