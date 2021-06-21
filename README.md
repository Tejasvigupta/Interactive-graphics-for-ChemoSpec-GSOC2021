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


## Week2
After an amazing first week, things have started to pick up the pace.This week started with me fixing the minor bugs in the `plotSpectra` function. After `plotSpectra` function was merged, I decided to work on the `loopThruSpectra` function. For `loopThruSpectra` function we decided to make some changes in the `ggplot2` mode. In base grahpics mode the user goes through all the `spectra` available in the data one by one but in `ggplot2` mode the user will be able to review all the `spectra` stored as all of them will be stacked vertically. Because `loopThruSpectra` function will basically help in reviewing all the `spectra` sstored in the data, Bryan decided to rename the function as `reviewAllSpectra`.
After the completion of `reviewAllSpectra` function and its documentation I decided to work on `surveySpectra` function. The main thing in `surveySpectra` function was to implement the faceting. Once I understood the concept of faceting in `ggplot2`, I completed the function and it's documentaion without any problem. My pull request was merged after it passed the build and check. During this week Bryan also made some changes in the `base` graphics mode to speed up the working of the function. After this I decided to work on the `plotLoading` function rather than `surveySpectra2` function as it seeemed a little less less complicated. `plotLoading` was kind of similar to `surveySpectra` function so I was able to wrap it up quickly without any problems. I had first used `geom_area` for the plot, but later on close inspection of the function in `base` mode on `metMUD1` dataset I decided to switch to `geom_segment`. Apart from coding I also had a chance to interact with Bryan about NMR Spectroscopy and its working.

Overall this was great week with lot's of new learning! On to Week 3!

### My commits during this period :
https://github.com/bryanhanson/ChemoSpec/pull/39/commits<br>
https://github.com/bryanhanson/ChemoSpec/pull/40/commits<br>
https://github.com/bryanhanson/ChemoSpec/pull/41/commits<br>
https://github.com/bryanhanson/ChemoSpec/pull/42/commits<br>
