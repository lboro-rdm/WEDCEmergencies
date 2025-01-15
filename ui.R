library(shiny)
library(DT)
library(lubridate)
library(shinycssloaders)
library(httr)
library(jsonlite)
library(dplyr)

ui <- tags$html(
  lang = "en",  # Set the language attribute
  fluidPage(
    titlePanel(
      HTML('<span style="color: #002c3d;"><strong>WEDC, Loughborough University:</strong></span>
          <span style="color: #009BC9;">Emergencies and Disasters</span><br><br>')
    ),
    
    # CSS to set the background color and font size
    tags$head(
      tags$style(HTML("
        body {
          background-color: #FFFFFF;
          font-size: 16px;
        }
        h2, a {
          color: #6F3092;
        }
        a.hover-underline:hover {
          text-decoration: underline;
        }
      "))
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
    )
  )
)
