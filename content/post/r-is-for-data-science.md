---
title: R is for Data Science
author: Austin Pearce
date: '2017-12-14'
slug: r-is-for-data-science
tags: [R, Data Science, Research]
header:
  caption: ''
  image: ''
summary: "R is a statistics language that can be used for quite a bit more than finding means."
---

R is a "statistics" language that can be used for quite a bit more than finding means. Quotes surround "statistics" because the [R programming language](https://www.r-project.org/) is really more complete and expansive than for just crunching averages and linear models, for example. R is "*a freely available language and environment for statistical computing and graphics*" and is completely open source.

R can be used to organize data, transform it, visualize it, build statistical models, and so on and so on. I'm still learning the vast utility of this program. One good resource to start with is [R for Data Science](http://r4ds.had.co.nz/) by Garrett Grolemund and [Hadley Wickham](http://hadley.nz/). As for the name **Wickham**, get used to seeing it around as you learn about R. He has done a lot to advance the use of R in data science.

## RStudio

While operating within the basic R software is possible and normal, [RStudio](https://www.rstudio.com/) offers a nifty front-end to the R console, file directories, packages, plots, and so on. For example, I really enjoy (as a novice user) the autocomplete feature in RStudio. Begin typing a command, and autocomplete is there to help me remember what to type. Below is a comparison of the work space environment in R and RStudio.

RStudio Desktop is free, and can be downloaded [here](https://www.rstudio.com/products/rstudio/download/). Also on the RStudio website is a small collection of valuable [cheatsheets](https://www.rstudio.com/resources/cheatsheets/) for using various R methods or packages (which cheatsheets can also be accessed in RStudio > Help > Cheatsheets).

## Writing Good R Code

This subject is still somewhat new to me, but here are some solid resources I'm using:

* [Google's R Style Guide](https://google.github.io/styleguide/Rguide.xml)
* [Hadley Wickham's Style Guide](http://adv-r.had.co.nz/Style.html)
* [Sharing R Code - With Style](https://onepager.togaware.com/StyleO.pdf)
* [Writing Better R Code](https://www.bioconductor.org/help/course-materials/2013/CSAMA2013/friday/afternoon/R-programming.pdf)
* [Effecient R Programming](https://bookdown.org/csgillespie/efficientR/)

## Packages

Packages are really what make R so appealing.  Packages are sets of functions designed to perform specific tasks, which saves the user the time of having to develop functions independently. Packages can be developed by anyone, really, and most come with good documentation and scrupulous users that are looking for ways to improve the packages. Recently the number of R packages crossed the 10,000 milestone.

Here are some I have experience with and have found useful.

### swirl

This package was developed to help budding users (like me) learn R effectively. More information can be found at [swirlstats.com](http://swirlstats.com/), but it's simply described as follows:
>Use the R console as an interactive learning environment. Users receive immediate feedback as they are guided through self-paced lessons in data science and R programming.

Lessons within the swirl package include:

* The basics of R programming
* Data analysis
* Regression models
* Getting and cleaning data
* Statistical inference
* Exploratory data analysis

I like that the tutorials are run inside the R console. Learning takes on a much more real feel, rather than looking at a cookbook on a website and copying code over and whatnot. I like that the tutorials are setup in small, incremental steps, allowing the learner to process one new piece of information at a time. I don't like, however, that syntax is such an issue when following instructions. For instance, it's a bit annoying that `x <- something` and `x = something` are not interpreted as equivalent right answers. That aside, swirl has been helpful to my introduction to R.

### ggplot2

While R obviously provides plotting capabilities, other packages for plotting data are available, such as [ggplot2](http://ggplot2.tidyverse.org/reference/). There is a `ggplot2` cheatsheet quickly available through RStudio under RStudio > Help > Cheatsheets.

>"ggplot2 is a plotting system for R, based on the grammar of graphics, which tries to take the good parts of base and lattice graphics and none of the bad parts. It takes care of many of the fiddly details that make plotting a hassle (like drawing legends) as well as providing a powerful model of graphics that makes it easy to produce complex multi-layered graphics.

### plotly

>Easily translate 'ggplot2' graphs to an interactive web-based version and/or create custom web-based visualizations directly from R. Once uploaded to a 'plotly' account, 'plotly' graphs (and the data behind them) can be viewed and modified in a web browser.

I enjoy using [Plotly](https://plot.ly/) mostly because of its simplicity in creating interactive, web-based graphs, not requiring someone like myself to know JavaScript or other ways to publish interactive graphs. And while I first used plotly through the web browser interface, it turns out that making plotly graphs in R is pretty simple with the [plotly package](https://plot.ly/r/).

But, as the package description indicates, if one is more comfortable making graphs in ggplot2, most of these graphics can easily be converted into interactive plotly graphics using the `ggplotly()` function.

## Other Packages

Listed below are some other R packages I have either used briefly and found useful, or hope to learn more about soon given their popularity (for example, browse the [RDocumentation](https://www.rdocumentation.org/) website).  Some packages are fun, like `wesanderson`, which, as one might guess, provides color palettes based on his iconic films. `tidyverse` is a great library of packages, including ggplot2, broom, tidyr, dplyr, etc.

## Other resources for learning/working with R

* [Quick-R](https://www.statmethods.net/) - online tutorials and guides
* [Learn R](https://leanpub.com/learnr) - online book by Pedro J. Aphalo
* [DataCamp](https://www.datacamp.com/) - online R/Python tutorials for data science
* [Exploratory Data Analysis with R](https://bookdown.org/rdpeng/exdata/) - online book by Roger D. Peng
* [R Bloggers](https://www.r-bloggers.com/) - R news and tutorials from around the web
* [R Programming for Data Science](https://leanpub.com/rprogramming) - online book by Roger D. Peng
* Or just google your question