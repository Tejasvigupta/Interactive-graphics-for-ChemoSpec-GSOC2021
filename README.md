<img src="Images/GSOC.png" width="800" height="150">

## Project Description
[Interactive Graphics for ChemoSpec](https://github.com/rstats-gsoc/gsoc2021/wiki/Interactive-Graphics-for-ChemoSpec)

## Mentors
* [Bryan Hanson](https://github.com/bryanhanson) <br>
* [Erick Oduniyi](https://github.com/eoduniyi) <br>

## Tasks completed
* [Community Bonding period](https://github.com/bryanhanson/ChemoSpec/issues/31) <br>
* [Phase 1](https://github.com/bryanhanson/ChemoSpec/issues/36) <br>
* [Phase 2](https://github.com/bryanhanson/ChemoSpec/issues/66) <br>

## New imports included in ChemoSpec
* [ggplot2](https://ggplot2.tidyverse.org/)
* [plotly](https://plotly.com/r/)
* [ggrepel](https://cran.r-project.org/web/packages/ggrepel/vignettes/ggrepel.html)
* [patchwork](https://patchwork.data-imaginist.com/)
* [reshape2](https://cran.r-project.org/web/packages/reshape2/index.html)

## Example plots with `patchwork`,`ggrepel` and `ggplot2` packages
 <img src="Images/plotLoadings.jpeg" width="550" height="450"><br>
   <p> Package patchwork was used for this plot as different geoms were needed in the top two panels, which cannot be handled by ggplot2.  However, patchwork is not supported by plotly so this function was not enhanced by plotly.</p><br>
 <img src="Images/plot2Loadings.jpeg" width="550" height="450"> 
 <p>This is one of several plots in which the labeling of points was greatly improved compared to the base graphics implementation.  In particular, using ggrepel gives a much better visual experience with less code on our end.</p><br>
 
## What's done!
*  After several weeks of experimentation, it was decided that creating new graphics modes using `ggplot2` and `plotly` would greatly enhance `ChemoSpec`, and that extension to shiny would not add much to user experience. With that change in plans by the mentors, <b>all project goals were reached</b>.
*  New function `chkGraphicsOpt` has been created to check the graphics mode.
* `ggplot2` graphics mode has been added to the functions listed in [Phase 1](https://github.com/bryanhanson/ChemoSpec/issues/36) tasklist.
* `plotly` graphics mode has been added to the functions listed in [Phase 2](https://github.com/bryanhanson/ChemoSpec/issues/66) tasklist.
*  Many helper functions such as `.prepLegendCoords` and `.ggAddLegend` were written to avoid repeating code, and these will also make it much easier to convert other functions to ggplot2 mode in the future.

## What's next for the project?!
*  Some functions that were not in the original plan could still benefit from adding the new graphics mode.
*  `plotLoadings` was created using the `patchwork` package for the best scientific and visual experience.`patchwork` does not yet work with `plotly`, so in the future if this becomes possible then `plotly` should be integrated.
* `annotate_custom()` function is implemented in `ggplot2` but it is yet to be implemented in `plotly` mode so a couple of labels might not work in `plotly` graphics mode. As soon as `annotate_custom()` is translated by the `plotly` developers, `ChemoSpec` will be able to use to use it in `plotly` graphics mode as well.
*  The project mentors will be double-checking everything and preparing both `ChemoSpec` and `ChemoSpecUtils` for release within a month.

# Weekly Blogs with Commits :

## Community Bonding period
Community bonding period started right after the announcement of results. The very first task was to set up a solid communication medium as there is a difference of about 12 hour time difference. Erick set up the slack channel for the project. Most of my time during this period went in understanding the codebase of `ChemoSpec` and `ChemoSpecUtils`. Along with learning about the working of the package I also learned about github actions, build and check process of the package, roxygen documentation and tinytest. Bryan setup the new branch `gsoc1` and the mechanism for switching between the graphic modes of the plotting function.The graphics option can now be switched by simply `options(chemoSpecGraphics= "any")` where any is the name of the graphic mode. After all the learning I wrote my first function `chkGrafOpt()` which I later renamed to `chkGraphicsOpt()` for better understanding of the function. It is a very simple function but yet very important. Even though it was very simple to code I still learnt something new from it. To test the function I had to create the test for it. As `ChemoSpec` is majorly used for plotting the spectra, it uses `tinytest` for testing. After the successful completion and documentation of the function, my first pull request was merged. It felt great! After that my second pull request also got merged. 

### My commits during this period :
[https://github.com/bryanhanson/ChemoSpec/pull/33/commits](https://github.com/bryanhanson/ChemoSpec/pull/33/commits) <br>
[https://github.com/bryanhanson/ChemoSpec/pull/37/commits](https://github.com/bryanhanson/ChemoSpec/pull/37/commits) <br>


## Week 1
With all the preparations done for the project, I started my work on the `plotSpectra` function. The `plotSpectra` plots the spectra object. Unlike the `base` graphics, I had to come up with a new way for plotting data in `ggplot2` as things work slightly different in `ggplot2`. I used `melt` function from `reshape2` to organize the data which helped me in plotting multiple `geom_lines`. As `ggplot2` was using NPC(Normalized Plot Coordinates) to plot the legend on the plot, we decided to implement the same in `base` graphics too. It was a little trickier to implement in `ggplot2` and so I had to come up with something new. I used `grobTree` and `textgrob` for capturing the group names along with their group colors and used `annotate_custom` to attach it with the `ggplot2` plot. Apart from `build and check` the function is working fine and hopefully I will be able to merge it without any error the following week.

As this was my first week I made a lot mistakes but Bryan was always there to the rescue. It was an amazing week and I learnt a lot of cool stuff. Let's go to Week 2!

### My commits during this period :
[https://github.com/bryanhanson/ChemoSpec/pull/38/commits](https://github.com/bryanhanson/ChemoSpec/pull/38/commits) <br>


## Week 2
After an amazing first week, things have started to pick up the pace. This week started with me fixing the minor bugs in the `plotSpectra` function. After `plotSpectra` function was merged, I decided to work on the `loopThruSpectra` function. For `loopThruSpectra` function we decided to make some changes in the `ggplot2` mode. In base grahpics mode the user goes through all the `spectra` available in the data one by one but in `ggplot2` mode the user will be able to review all the `spectra` stored as all of them will be stacked vertically in a single plot. Because `loopThruSpectra` function will basically help in reviewing all the `spectra` stored in the data, Bryan decided to rename the function as `reviewAllSpectra`.
After the completion of `reviewAllSpectra` function and it's documentation I decided to work on `surveySpectra` function. The main thing in `surveySpectra` function was to implement the faceting. Once I understood the concept of faceting in `ggplot2`, I completed the function and it's documentaion without any problem. During this week Bryan also made some changes in the `base` graphics mode to speed up the function. After this I decided to work on the `plotLoading` function rather than `surveySpectra2` function as it seemed a little less complicated. `plotLoading` was kind of similar to `surveySpectra` function so I was able to wrap it up quickly without any problems. I first used `geom_area` for the plot, but later on close inspection of the function in `base` mode on `metMUD1` dataset I decided to switch to `geom_segment`.

Overall this was great week with lot's of new learning! On to Week 3!

### My commits during this period :
[https://github.com/bryanhanson/ChemoSpec/pull/39/commits](https://github.com/bryanhanson/ChemoSpec/pull/39/commits)<br>
[https://github.com/bryanhanson/ChemoSpec/pull/40/commits](https://github.com/bryanhanson/ChemoSpec/pull/40/commits)<br>
[https://github.com/bryanhanson/ChemoSpec/pull/41/commits](https://github.com/bryanhanson/ChemoSpec/pull/41/commits)<br>
[https://github.com/bryanhanson/ChemoSpec/pull/42/commits](https://github.com/bryanhanson/ChemoSpec/pull/42/commits)<br>


## Week 3
This week started with me working on the `ggplot2` mode for `surveySpectra2` function. This function was a lot similar to the `plotSpectra` function so after understanding the `base` mode I was able to figure out the logic for the same for `ggplot2` mode. Now that most of the 1d plot functions were over, it was time for 2d plot functions. Working on the even the first function turned out to be a very big deal. Most of the 2d functions in `ChemoSpec` depends on the `ChemoSpecUtils` package. I decided to start my work with `pcaDiag` function. `pcaDiag` was fairly simple to code until I got to the `.labelExtreme` part. `.labelExtreme` is a utility function from `ChemoSpecUtils` which plots the label of the extreme data points. As the `base` mode is slightly different from `ggplot2` mode, we decided to  make another function `getExtremeCoords` specifically for `ggplot2` mode.  `getExtremeCoords` uses `labelExtreme` function to get the coordinates of the labels and returns a list of them. The main idea for creating this function is to get the data and not interfere with `base` mode code. Finally, I have completed the code for `pcaDiag` function. Some problems still remains regarding build and check though but these will be rectified in the next week.

On to week 4!

### My commits during this period :
[https://github.com/bryanhanson/ChemoSpec/pull/43/commits](https://github.com/bryanhanson/ChemoSpec/pull/43/commits)<br>
[https://github.com/bryanhanson/ChemoSpecUtils/pull/2/commits](https://github.com/bryanhanson/ChemoSpecUtils/pull/2/commits)<br>
[https://github.com/bryanhanson/ChemoSpecUtils/pull/3/commits](https://github.com/bryanhanson/ChemoSpecUtils/pull/3/commits)<br>


## Week 4
The very first task in this week was to solve the build and check process issue. Because `ChemoSpec` depends on `ChemoSpecUtils` we have decided to only locally run the build and check process for now. Since `pcaDiag` function was working fine locally, we merged it. After `pcaDiag` I decided to work on `splotSpectra`. `splotSpectra` was relativly simple to code and so I was able to do it without any problem. After this I worked on `plotSpectraDist` function. This function was also relativly simple to code, however I faced a problem in labeling part. This wasn't the first time I was facing this problem, so for now I decided to use a fudge factor to make the labels seperated from the plot points. While working on all the new functions we came across a new package `patchwork`. I had already worked on `plotLoading` function's `ggplot2` mode but we thought of giving a try to `patchwork` package.`patchwork` package helps user in organizing the different plots in a grid. The plot has turned out to be really nice, maybe even better than before. However, we are still thinking about the function. Overall it required quite a lot of thinking as I had to change the way data was organized in the `base` graphics for the code to work. Best part of coding this function was discovering a new way to plot multiple `ggplots` using `for` loop. For now we are sticking to plot made using `patchwork`.

Next week we have use R! conference! 

### My commits during this period :
[https://github.com/bryanhanson/ChemoSpec/pull/44/commits](https://github.com/bryanhanson/ChemoSpec/pull/44/commits)<br>
[https://github.com/bryanhanson/ChemoSpec/pull/45/commits](https://github.com/bryanhanson/ChemoSpec/pull/45/commits)<br>
[https://github.com/bryanhanson/ChemoSpec/pull/47/commits](https://github.com/bryanhanson/ChemoSpec/pull/47/commits)<br>
[https://github.com/bryanhanson/ChemoSpec/pull/49/commits](https://github.com/bryanhanson/ChemoSpec/pull/49/commits)<br>


## Week 5
With this week, the first half of GSoC has come to an end. This week was different from all the previous weeks. This week I attended use R! conference. It was a really nice experience for me as I got to know more about the R language,it's packages and it's community. 

Apart form use R! conference I worked on the remaining funcitons. I started my work with `plot2Loadings` function. As `plot2loading` was similar to functions previously done by me, I was able to write the `ggplot2` mode without any problem. While I was completing the function, Bryan came across a bug in `surveySpectra` function. So after I completed the `plot2loading` function, I worked on the `surveySpectra` function and added the missing code. After completing these functions I started my work on `plotScree` function in the `ChemoSpecUtils` package. The print statement was causing a little problem in rendering of the ggplots, so we decided to "return" the ggplots rather than printing them. This will ensure that `ggplot` plot always gets printed after the function is called. Lastly, I completed the code for `ggplot2` mode of the `plotScree` function. 

### My commits during this period :
[https://github.com/bryanhanson/ChemoSpec/pull/50/commits](https://github.com/bryanhanson/ChemoSpec/pull/50/commits)<br>
[https://github.com/bryanhanson/ChemoSpec/pull/51/commits](https://github.com/bryanhanson/ChemoSpec/pull/51/commits)<br>
[https://github.com/bryanhanson/ChemoSpec/pull/52/commits](https://github.com/bryanhanson/ChemoSpec/pull/52/commits)<br>
[https://github.com/bryanhanson/ChemoSpecUtils/pull/4/commits](https://github.com/bryanhanson/ChemoSpecUtils/pull/4/commits)<br>


## Week 6
This week was probably the most toughest week till now.This week I worked on `plotScores` function. `plotScores` function is a combination of 4 functions working together to make the plot. It was a little difficult to get started with it as the code was more complex than the rest of the functions. Once I understood the code of the function, I started with plotting the points. This is a special function as it used two kinds of symbol modes. In case of `use.sym==FALSE` the function plots a plot with same symbols but different colors, representing differnt `spectra`. On the other hand `use.sym==TRUE` plots a black and white plot with different `spectra` representing different symbols.
After plotting the points I worked on plotting the `ellipses`. Initially I decided to to use the `stat_ellipse` geom, but later decied to use `geom_path` over it. `Stat_ellipse` basically calculates the coordinates of the ellipse and then plot them, however in our case we already had the coordinates precalculated, so using `stat_ellipse` seemed unnecessary. There are three options for plotting an ellipse in `plotScores`. First is classical way, second is robust way and the third way is plotting both of them together. I coded the ellipses one by one. After coding th plot my main focus was to use somehow use the `leg.loc` (legend location) used in base mode in `ggplot2` mode. Sadly, `ggplot2` does not provide a way of directly putting the `legend` in the desired position such as `topright` or `bottomright` etc . I manually coded the conditions in `ggplot2` mode. Finally I worked on putting the ellipse information and method on the plot along with labelling of the points. 

With this function `ggplot2` mode is comming to an end with final testing and documentation remaining. By the end of next week I will hopefully start my work on `plotly` mode.

### My commits during this period :
Commits of this week will be in the the pull request which will be merged next week.<br>

## Week 7
This week started with me completing the `plotScores` function in `ChemoSpecUtils`. The function was merged successfully. With this function the major part of `ggplot2` mode is completed. While reviewing the code Bryan found a lot of functions where the code was getting repeated and could be simplified so I started my work on such functions.The main idea behind simplification was to create a function inside of the function, so instead of writing many lines of code a simple call to the function will do the job.I worked on `plot2Loadings` and many other other functions. After that I spent most of the time fixing small-small bugs in the functions. Legend layout was a little cramped so I had to work on that too. This week I learned about `Rmarkdown` too. I made some changes in the development version of the `Rmakdown` file. 

Overall, there were a lot of minor tasks were worked on and completed throughout the week. Next week will mark the beginning of `plotly` mode!

### My commits during this period :
[https://github.com/bryanhanson/ChemoSpecUtils/pull/5/commits](https://github.com/bryanhanson/ChemoSpecUtils/pull/5/commits)<br>
[https://github.com/bryanhanson/ChemoSpec/pull/59/commits](https://github.com/bryanhanson/ChemoSpec/pull/59/commits)<br>
[https://github.com/bryanhanson/ChemoSpec/pull/60/commits](https://github.com/bryanhanson/ChemoSpec/pull/60/commits)<br>
[https://github.com/bryanhanson/ChemoSpec/pull/61/commits](https://github.com/bryanhanson/ChemoSpec/pull/61/commits)<br>
[https://github.com/bryanhanson/ChemoSpec/pull/63/commits](https://github.com/bryanhanson/ChemoSpec/pull/63/commits)<br>
[https://github.com/bryanhanson/ChemoSpec/pull/64/commits](https://github.com/bryanhanson/ChemoSpec/pull/64/commits)<br>
[https://github.com/bryanhanson/ChemoSpec/pull/65/commits](https://github.com/bryanhanson/ChemoSpec/pull/65/commits)<br>
[https://github.com/bryanhanson/ChemoSpecUtils/pull/7/commits](https://github.com/bryanhanson/ChemoSpecUtils/pull/7/commits)<br>
[https://github.com/bryanhanson/ChemoSpecUtils/pull/8/commits](https://github.com/bryanhanson/ChemoSpecUtils/pull/8/commits)<br>

## Week 8
After giving the final touches in the `ggplot2` mode, I started my work on the `plotly` mode. The very first thing was to learn how to combine the `ggplot` and `plotly` code together. `plotly` provides a function specifically for `ggplot2` plot, `ggplotly`. The very first thing to do was to include the necessary imports for `plotly` mode.
 After adding the imports I worked on the very first `plotSpectra` function. At first I decided to use the seperate `if` conditions for `plotly` mode, however most of the code was getting repeated so Bryan suggested to put `ggplot2` and `plotly` mode together, greatly reducing the code size. Since it was the first function in `plotly` mode I tried adding new stuff to it. After that I did some work on the `surveySpectra` and `surveySpectra2` function. Overall, not much work was done in the first half of the week as a lot of the time was spent on reading the documentation. 
 
With the end of this week, I move into the final and probably the most exciting phase of GSOC!

### My commits during this period :
[https://github.com/bryanhanson/ChemoSpec/pull/71/commits](https://github.com/bryanhanson/ChemoSpec/pull/71/commits)<br>

## Week 9
This week was a really long week. I started to work on the remaining functions of the `ChemoSpec` and `ChemoSpecUtils`. I first completed the `surveySpectra` and `surveySpectra2` functions from the previous week. After that I worked on `reviewAllSpectra`, `ploat2Loadings`,`sPlotSpectra`, `plotSpectraDist` and finally `pcaDiag`. Adding plotly mode to all these functions was a similar process. I encountered a problem while adding plotly mode in `plotLoadings` function. The `plotLoading` function uses a `patchwork` package to put together all the plots in a grid. `patchwork` package works great with `ggplot2` plots. However, it is yet to be implemented for `plotly` plots, so after a little research we decided to pause the work on `plotLoadings` function. 
After completing the `plotly` mode in `ChemoSpec` package, I decided to work on the `ChemoSpecUtils` functions. Bryan observed that some code was getting repeated in many functions, so my first task was to create a new function which could replace all the lengthy code into a single function call. I created `.prepLegendCoords` function to solve the issue. After that I worked on the previous listed issue in `plotScore` function regarding `x and y axes labels`. After that Bryan came up with an idea to further reduce the extra code by creating a specific legend function(`.ggAddLegend`) for `ggplot2` mode. These both functoin together have removed a lot of repeated code and will be useful for further functions. 

With this week over, we move on to the final week of the coding period!

### My commits during this period :
[https://github.com/bryanhanson/ChemoSpec/pull/72/commits](https://github.com/bryanhanson/ChemoSpec/pull/72/commits)<br>
[https://github.com/bryanhanson/ChemoSpec/pull/73/commits](https://github.com/bryanhanson/ChemoSpec/pull/73/commits)<br>
[https://github.com/bryanhanson/ChemoSpec/pull/74/commits](https://github.com/bryanhanson/ChemoSpec/pull/74/commits)<br>
[https://github.com/bryanhanson/ChemoSpecUtils/pull/9/commits](https://github.com/bryanhanson/ChemoSpecUtils/pull/9/commits)<br>

## Week 10
This week marks the end of the coding period.Ten weeks long journey final comes to end. This week I first added the newly created `.ggAddLegend` function in `.scorePlot` and then in `plotSpectra`. After that I worked on adding `plotly` graphics mode in `plotscores`,`aovPCAcores` and `plotScree` function. I did stumbled in the middle when I tried to change the default graphics mode from `base` to `ggplot2`.After lot's of searching and debugging I was able to reset it again to `base` graphics mode. After finishing all the plotting functions I worked on the small bugs that crept in due to me switching between the `ChemoSpec` and `ChemoSpecUtils`. After removing the bugs I updated the graphics option back to `ggplot2` mode. With this I finally completed my work! 

### My commits during this period :
[https://github.com/bryanhanson/ChemoSpec/pull/75/commits](https://github.com/bryanhanson/ChemoSpec/pull/75/commits)<br>
[https://github.com/bryanhanson/ChemoSpec/pull/76/commits](https://github.com/bryanhanson/ChemoSpec/pull/76/commits)<br>
[https://github.com/bryanhanson/ChemoSpecUtils/pull/10/commits](https://github.com/bryanhanson/ChemoSpecUtils/pull/10/commits)<br>
[https://github.com/bryanhanson/ChemoSpecUtils/pull/11/commits](https://github.com/bryanhanson/ChemoSpecUtils/pull/11/commits)<br>
[https://github.com/bryanhanson/ChemoSpecUtils/pull/12/commits](https://github.com/bryanhanson/ChemoSpecUtils/pull/12/commits)<br>
[https://github.com/bryanhanson/ChemoSpecUtils/pull/13/commits](https://github.com/bryanhanson/ChemoSpecUtils/pull/13/commits)<br>
[https://github.com/bryanhanson/ChemoSpecUtils/pull/14/commits](https://github.com/bryanhanson/ChemoSpecUtils/pull/14/commits)<br>

# My Overall Experience
Participating in GSOC has been an <b>amazing</b> journey. I worked on different plotting functions, used differnt R packages and gained a lot of experience by working under my mentor. There were a lot times when I was lost and even behind the deadline but I was able to figure out the things and complete my work in the end. My mentor, Bryan, helped me throughout the journey and it would have been impossible to finish all this without him. 

## My whole coding journey can be summarised as:
1. Understand the previously written code.
2. Write the new code.
3. Test the code.
4. Try to come up with optimal solution to minimise the time and space complexity.
5. If some code is getting repeated, create a helper function to remove the excess code.
6. Finally write documentation of the code. 
7. Repeat.

I hope that the new graphics modes raise the bar of `ChemoSpec` package and benefit the community who uses this package. 

### Special mention: <br>
<img src="Images/meme_1.jpg" width="400" height="400"> <br>
<br>

More about `ChemoSpec` can be found [here](https://bryanhanson.github.io/ChemoSpec/).
