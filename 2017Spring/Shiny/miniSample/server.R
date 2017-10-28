# how to process input and produce output

library(shiny)

shinyServer(function(input, output) {
  
  get.data1 <- reactive({
    CDS <- input$CDS
    if (is.null(CDS)) {
      # User has not uploaded a file yet
      return(NULL)
    }
    data1<-read.csv(CDS$datapath, header=T, sep=",")
    return(data1)
  })
  
  get.data2 <- reactive({
    disc <- input$disc
    if (is.null(disc)) {
      # User has not uploaded a file yet
      return(NULL)
    }
    data2<-read.csv(disc$datapath, header=T, sep=",")
    return(data2)
  })
  
  output$CDS <- renderTable({
    if(is.null(get.data1())) return(NULL)
    get.data1()
  },digits = 2)
  
  output$disc <- renderTable({
    if(is.null(get.data2())) return(NULL)
    get.data2()
  },digits = 2)
  
  output$text1<-renderPrint({
    if(is.null(get.data1())|is.null(get.data2())) return()
    data<-get.data1()
    data2<-get.data2()
    df1<-data.frame(cbind(data[,2]/100,data[,1],data[,1]^2,data[,1]^3))
    colnames(df1)<- c("CDS","t1","t2","t3");
    n=0;
    k=4;
    for (i in 2:ncol(df1)){
      lm <- lm(CDS~df1[,i], data=df1);
      if (summary(lm)$adj.r.squared>n)
      {n=summary(lm)$adj.r.squared;
      k=i;
      }
    }
    lm1 <- lm(CDS~df1[,k], data=df1);
    
    print(summary(lm1)$adj.r.squared,digits=input$num)
    
  })
  
  output$plot<-renderPlot({
    if(is.null(get.data1())|is.null(get.data2())) return()
    data<-get.data1()[,2]
    plot(data,xlim=c(1,length(data)),ylim=c(min(data),max(data)),xlab="Number",ylab="Number2",main="Plot")
  })
  
})