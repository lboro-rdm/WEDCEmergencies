library(shiny)
library(DT)
library(lubridate)
library(shinycssloaders)
library(httr)
library(jsonlite)
library(dplyr)

ui <- tags$html(
  lang = "en",
  fluidPage(
    tags$head(
      tags$title("WEDC, Loughborough University: Publications for Emergencies and Disasters "),  # Add page title here
      tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
    ),
    tags$div(
      HTML('<span class="wedc-title">WEDC, Loughborough University: Publications for Emergencies and Disasters </span><br><br>')
    ),
    
    # Layout for inputs and outputs
    sidebarLayout(
      sidebarPanel(
        style = "margin-top: 20px;",
        
        # Author Search
        textInput(
          inputId = "authorSearch",
          label = "Search by Author:",
          placeholder = "Enter author's name"
        ),
        
        # Title Search
        textInput(
          inputId = "titleSearch",
          label = "Search by Title:",
          placeholder = "Enter book or manual title"
        )

      ),
      
      mainPanel(
        fluidRow(
          style = "margin-left: 20px; margin-right: 20px;",
          withSpinner(
            uiOutput("bookDetails"),
            type = 3,
            color = "#009BC9",
            color.background = "#FFFFFF"
          )
        )
      )
    ),
    tags$div(class = "footer", 
             fluidRow(
               column(12, 
                      tags$a(href = 'https://doi.org/10.17028/rd.lboro.28525481', 
                             "Accessibility Statement")
               )
             )
    )
    
  )
)