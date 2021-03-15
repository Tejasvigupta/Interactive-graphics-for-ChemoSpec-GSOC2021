#Importing Libraries
library(shiny)
library(shinyWidgets)
library(ggplot2)
library(ChemoSpec)
library(plotly)
library(reshape2)

#Loading data
data(SrE.IR)


#Main function
plotspectra6<-function(spectra, which = c(1),
                       main="none",
                       yrange = range(spectra$data),
                       offset = 0.0, amplify = 1.0,
                       lab.pos = mean(spectra$freq),
                       showGrid = TRUE, leg.loc = "none", ...)
{
  
  ui<-fluidPage(
    titlePanel("Shiny Interactive visualization"),
    fluidRow(
      column(3,offset=1,sliderInput(inputId="offset",
                    label="offset",
                    min = 0,
                    max = 1,
                    value = 0.3)),
        column(3,offset=1,sliderInput(inputId = "amplify",
                    label = "Amplify",
                    min = 1,
                    max = 5,
                    value = 1)),
        column(3,offset=1,sliderInput(inputId = "yrange",
                    label = "Yrange",
                    min = 0,
                    max = 5,
                    value = 3))
        ),
    column(12,offset=2,mainPanel(
      plotlyOutput(outputId="distPlot")
    ))
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
        p<-ggplot() +geom_line(data=molten.data ,aes(x=WaveNumber ,y=value, group=variable,color=spectra$colors[variable],
                                                     text=paste("WaveNumber:",WaveNumber,"<br>Absorbance:",value,"<br>",variable)))+
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
        o<-ggplotly(p,tooltip="text",height=600)
      }
      
      plotSpectra5(SrE.IR,which=which,amplify=input$amplify ,yrange=c(0,input$yrange),offset=input$offset)
      
    })
    
  }
  shinyApp(ui=ui,server=server)
}


#Function to plot 
plotspectra6(SrE.IR,which=c(1,2,3))
