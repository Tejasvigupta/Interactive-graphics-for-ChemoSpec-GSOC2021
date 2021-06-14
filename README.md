# Weekly Progress Report

## Project Link
[Interactive Graphics for ChemoSpec](https://github.com/rstats-gsoc/gsoc2021/wiki/Interactive-Graphics-for-ChemoSpec)

## Mentors
* Bryan Hanson <br>
* Erick Oduniyi


## Community Bonding period
Community bonding period started right after the announcement of results. The very first task was to set up a solid communication medium as there is a difference of about 12 hour time difference. Erick set up the slack channel for the project. Most of my time during this period went in understanding the codebase of `ChemoSpec` and `ChemoSpecUtils`. Along with learning about the working of the package I also learned about github actions, build and check process of the package, roxygen documentation and tinytest. Bryan setup the new branch `gsoc1` and the mechanism for switching between the graphic modes of the plotting function.The graphics option can now be switched by simply `options(chemoSpecGraphics= "any")` where any is the name of the graphic mode. After all the learning I wrote my first function `chkGrafOpt()` which I later renamed to `chkGraphicsOpt()` for better understanding of the function. It is a very simple function but yet very important. Even though it was very simple to code I still learnt something new from it. To test the function I had to create the test for it. As `ChemoSpec` is majorly used for plotting the spectra, it uses `tinytest` for testing. After the successful completion and documentation of the function my first pull request was merged. It felt great! After that my second pull request also got merged. 

### My commits during this period :
https://github.com/bryanhanson/ChemoSpec/pull/33/commits <br>
https://github.com/bryanhanson/ChemoSpec/pull/37/commits <br>


## Week1
With all the preparations done for the project, I started my work on the `plotSpectra` function. The `plotSpectra` plots the spectra object. Unlike the `base` graphics, I had to come up with a new way for plotting data in `ggplot2` as things work slightly different in `ggplot2`. I used `melt` function from `reshape2` to organize the data which helped me in plotting multiple `geom_lines`. As `ggplot2` was using NPC(Normalized Plot Coordinates) to plot the legend on the plot, we decided to implement the same in `base` graphics too. It was a little trickier to implement in `ggplot2` and so I had to come up with something new. I used `grobTree` and `textgrob` for capturing the group names along with their group colors and used `annotate_custom` to attach it with the `ggplot2` plot. Apart from `build and check` the function is working fine and hopefully I will be able to merge it without any error the following week.

As this was my first week I made a lot mistakes but Bryan was always there to the rescue. It was an amazing week and I learnt a lot of cool stuff. Let's go Week 2!

### My commits during this period :
https://github.com/bryanhanson/ChemoSpec/pull/38/commits
