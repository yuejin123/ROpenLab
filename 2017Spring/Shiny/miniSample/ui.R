# the layout of the webpage

library(shiny);


shinyUI(fluidPage(
 # tags$style(type="text/css",
  #           ".shiny-output-error { visibility: hidden; }",
   #          ".shiny-output-error:before { visibility: hidden; }"),
             
  titlePanel("Shiny Example"),
  
  sidebarPanel(
    fileInput('CDS', 'Choose a CVS file',
              accept=c('text/csv','text/comma-separated-values,text/plain','.csv')),
    #inputID; label; other arguments
    fileInput('disc', 'Choose another CVS file',
              accept=c('text/csv','text/comma-separated-values,text/plain','.csv')),
    
    selectInput("num", 
                  label = h3("Number of digits"), 
                  choices=c(1,2,3,4))
  ),
  
  fluidRow(
    
    column(2,
           tableOutput('CDS')       
    ),
    
    column(4,
           tableOutput('disc')
    ),
    
    column(8,
           textOutput('text1')
    ),
    column(10,
         plotOutput("plot")
    )
  )
))
