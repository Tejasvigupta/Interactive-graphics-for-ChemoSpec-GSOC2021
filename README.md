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
After an amazing first week, things have started to pick up the pace. This week started with me fixing the minor bugs in the `plotSpectra` function. After `plotSpectra` function was merged, I decided to work on the `loopThruSpectra` function. For `loopThruSpectra` function we decided to make some changes in the `ggplot2` mode. In base grahpics mode the user goes through all the `spectra` available in the data one by one but in `ggplot2` mode the user will be able to review all the `spectra` stored as all of them will be stacked vertically. Because `loopThruSpectra` function will basically help in reviewing all the `spectra` stored in the data, Bryan decided to rename the function as `reviewAllSpectra`.
After the completion of `reviewAllSpectra` function and its documentation I decided to work on `surveySpectra` function. The main thing in `surveySpectra` function was to implement the faceting. Once I understood the concept of faceting in `ggplot2`, I completed the function and it's documentaion without any problem. During this week Bryan also made some changes in the `base` graphics mode to speed up the working of the function. After this I decided to work on the `plotLoading` function rather than `surveySpectra2` function as it seemed a little less complicated. `plotLoading` was kind of similar to `surveySpectra` function so I was able to wrap it up quickly without any problems. I had first used `geom_area` for the plot, but later on close inspection of the function in `base` mode on `metMUD1` dataset I decided to switch to `geom_segment`.

Overall this was great week with lot's of new learning! On to Week 3!

### My commits during this period :
https://github.com/bryanhanson/ChemoSpec/pull/39/commits<br>
https://github.com/bryanhanson/ChemoSpec/pull/40/commits<br>
https://github.com/bryanhanson/ChemoSpec/pull/41/commits<br>
https://github.com/bryanhanson/ChemoSpec/pull/42/commits<br>


## Week3
This week started with me working on the `ggplot2` mode for `surveySpectra2` function. This function was a lot similar to the `plotSpectra` function so after understanding the `base` mode I was able to figure out the logic for the same for `ggplot2` mode. Now that nost of the 1d plot functions were over, it was time for 2d plot functions. Working on the even the first function turned out to be a very big deal. Most of the 2d functions in `ChemoSpec` depends on the `ChemoSpecUtils` package. I decided to start my work with `pcaDiag` function. `pcaDiag` was fairly simple to code until I got to the `.labelExtreme` part. `.labelExtreme` is a utility function from `ChemoSpecUtils` which plots the label of the extrme data points. As the `base` mode is slightly different from `ggplot2` mode so we decided to  make another function `getExtremeCoords` specifically for `ggplot2` mode.  `getExtremeCoords` basically uses `labelExtreme` function to get the coordinates of the labels and returns a list of them. The main idea for creating this function was to get the data and not interfere with `base` mode code. Finally I have completed the code for `pcaDiag` function. Some problems still remains regarding build and check though but these will be rectified in the next week.

On to week 4!

### My commits during this period :
https://github.com/bryanhanson/ChemoSpec/pull/43/commits<br>
https://github.com/bryanhanson/ChemoSpecUtils/pull/2/commits<br>
https://github.com/bryanhanson/ChemoSpecUtils/pull/3/commits<br>


## Week4
The very first task in this week was to solve the build and check process issue. Because `ChemoSpec` depends on `ChemoSpecUtils` we have decided to only locally run the build and check process for now. Since `pcaDiag` function was working fine locally, we merged it. After `pcaDiag` I decied to work on `splotSpectra`. `splotSpectra` was a relativly simple to code and so I was able to do it without any problem. After this I worked on `plotSpectraDist` function. This function was also relativly simple to code, however I faced a problem in labeling part. This wasn't the first time I was facing this problem, so for now I decided to use a fudge factor to make the labels seperated from the plot points. While working on all the new functions we came across a new package `patchwork`. I had already worked on `plotLoading` function's `ggplot2` mode but we thought of giving a try to `patchworks` package.`patchwork` package helps user in organizing the different plots in a grid. The plot has turned out to be really nice, maybe even better than before. However, we are still thinking about the function. Overall it required quite a lot of thinking as I had to change the way data was organized in the `base` graphics for the code to work. Best part of coding this function was discovering a new way to plot multiple `ggplots` using `for` loop. For now we are sticking to plot made using `patchwork`.

Next week we have use R! conference! This is the first time I will be attending any live conference, so I am looking forward to it. 

### My commits during this period :
https://github.com/bryanhanson/ChemoSpec/pull/44/commits<br>
https://github.com/bryanhanson/ChemoSpec/pull/45/commits<br>
https://github.com/bryanhanson/ChemoSpec/pull/47/commits<br>
https://github.com/bryanhanson/ChemoSpec/pull/49/commits<br>


## Week5
With this week, the first half of GSoC has come to an end. This week was different from all the previous weeks. This week I attended `use R!` conference. It was a really nice experience for me as I got to know more about the R language,it's packages and it's community. 

Apart form `use R!` conference I worked on the remaining funcitons. I started my work with `plot2Loadings` function. As `plot2loading` was similar to functions previously done by me, I was able to write the `ggplot2` mode without any problem. While I was completing the function, Brayan came across a bug in `surveySpectra` function. So so after I completed the `plot2loading` function, I worked on the `surveySpectra` function and added the missing code. After completing these functions I started my work on `plotScree` function in the `ChemoSpecUtils` package. The print statement was causing a little problem in rendering of the ggplots, so we decided to "return" the ggplots rather than printing them. This will ensure that `ggplot` plot always gets printed after the function is called. Lastly, I completed the code for `ggplot` mode of the `plotScree` function. 

### My commits during this period :
https://github.com/bryanhanson/ChemoSpec/pull/50/commits<br>
https://github.com/bryanhanson/ChemoSpec/pull/51/commits<br>
https://github.com/bryanhanson/ChemoSpec/pull/52/commits<br>
https://github.com/bryanhanson/ChemoSpecUtils/pull/4/commits<BR>
