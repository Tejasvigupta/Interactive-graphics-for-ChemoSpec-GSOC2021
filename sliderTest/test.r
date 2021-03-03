library(shiny)
library(ggplot2)
library(ChemoSpec)
library(plotly)

data(SrE.IR)


plotSpectra4<-function(spectra,which,
                       main = "none",
                       yrange = range(spectra$data),
                       amplify = 1.0,
                       lab.pos=mean(spectra$freq),
                       showGrid = TRUE , ...) {
  chkSpectra(spectra)
  
  #Extracting the data from spectra object and amplifying it
  spectrum<-spectra$data[which,]*amplify
  
  #Extracting the frequency
  frequency<-spectra$freq
  
  #Creating a New dataframe with extracted data for creating a ggplot
  df<-data.frame(spectrum,frequency)
  lab.x<-lab.pos
  lab.y<-spectrum[findInterval(lab.x,sort(spectra$freq))]
  
  #Creating and storing the ggplot 
  p<-ggplot(df)+
    labs(x=spectra$unit[1],y=spectra$unit[2])+
    theme(plot.title=element_text(size=12,color="red" ,hjust=0.5))+
    theme_bw()+
    theme(legend.position = "none")+
    geom_text(aes(x=lab.x,y=lab.y+0.1,label=spectra$names[which]))+
    ylim(yrange)+
    theme(panel.border = element_blank(),axis.line = element_line(colour = "black"))
  
  #Checking the optional conditions in the function
  if(!showGrid) 
  {
    p = p + theme(panel.grid.minor = element_blank(),panel.grid.major = element_blank())
  }
  if(main!="none")
  {
    p = p + ggtitle(main) + theme(plot.title = element_text(hjust = 0.5,size=20))
  }
  p=p+geom_line(aes(x=frequency,y=spectrum),color=spectra$colors[which])
  p=p+geom_line(aes(x=frequency,y=(spectra$data[2,]+0.3)*amplify),color=spectra$colors[2])
  
  #Passing the previously created ggplot as an object in plotly
  fig<-ggplotly(p)
  fig
}

data(SrE.IR)
#plotSpectra4(SrE.IR,10,
#             amplify=10,
#             showGrid=TRUE,
#             yrange=c(0,3),
#             lab.pos = 2000)

ui<-fluidPage(
  titlePanel("Shiny Interactive visualization"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId="offset",
                        label="offset",
                        min = 0,
                        max = 1,
                        value = 0.3),
      sliderInput(inputId = "amplify",
                  label = "Amplify",
                  min = 1,
                  max = 5,
                  value = 1),
      sliderInput(inputId = "yrange",
                  label = "Yrange",
                  min = 0,
                  max = 5,
                  value = 3)
      
    ),
    mainPanel(
      plotlyOutput(outputId="distPlot")
    )
  )
)

#Server logic

server <- function(input ,output){
  
  output$distPlot<-renderPlotly({
    
    plotSpectra5<- function(spectra, which = c(1),
                            main="none",
                            yrange = range(spectra$data),
                            offset = 0.0, amplify = 1.0,
                            lab.pos = mean(spectra$freq),
                            showGrid = TRUE, leg.loc = "none", ...) {
      .chkArgs(mode = 11L)
      chkSpectra(spectra)
      
      df<-0
      df<-data.frame(spectra$freq)
      
      for (i in which){
        i<-(spectra$data[i,])
        df<-cbind(df,i)
      }
      name<-c()
      for (i in which)
      {
        name<-c(name,spectra$names[which[i]])
      }
      names(df)<-c("WaveNumber",name)
      #df
      count<-0
      #offset<-0.4
      for (i in 2:ncol(df)){
        df[,i]<-(df[,i]+ (count*offset))*amplify
        count<-count+1
      }
      molten.data<-melt(df,id=c("WaveNumber"))
      p<-ggplot() +geom_line(data=molten.data ,aes(x=WaveNumber ,y=value, group=variable,color=spectra$colors[variable]))+
        labs(x=spectra$unit[1],y=spectra$unit[2])+
        theme(plot.title=element_text(size=12,color="red" ,hjust=0.5))+
        theme_bw()+
        ylim(yrange)+
        theme(legend.position = "none")+
        theme(panel.border = element_blank(),axis.line = element_line(colour = "black"))
      if(!showGrid)
      {
        p = p + theme(panel.grid.minor = element_blank(),panel.grid.major = element_blank())
      }
      if(main!="none")
      {
        p = p + ggtitle(main) + theme(plot.title = element_text(hjust = 0.5,size=20))
      }
      o<-ggplotly(p)
      #o
    }
    
    plotSpectra5(SrE.IR,which=c(1,2),amplify=input$amplify ,yrange=c(0,input$yrange),offset=input$offset)
    
  })
}

shinyApp(ui = ui,server = server)
