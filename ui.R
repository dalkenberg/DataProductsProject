#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)

df_hikes <- data.frame(name = c("LATOURELL FALLS","CAPE HORN","ANGEL'S REST"
                                ,"MULTNOMAH FALLS LOOP","WAHCLELLA FALLS",
                                "ST. CLOUD LOOP","SAMS WALKER LOOP","BRIDAL VEIL FALLS"),
                       miles = c(2.4,7,4.4,5,2.2,1,1.1,0.6),
                       elevation = c(520,1350,1450,870,200,25,15,70),
                       latitude = c(45.538714 ,45.58852,45.56081,45.57616,45.63060,45.60,45.6118,45.55362),
                       longitude = c(-122.218115,-122.17874,-122.17184,-122.115776,-121.95382,-122.1117,-122.0520,-122.18265)
)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Local Hike Selector"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        div("Map displays local hikes in the the Columbia Gorge area in Oregon."),
        br(),
        div("Select ranges for the number of miles and elevation to find hikes appropriate for desired difficulty."),        
        br(),
       sliderInput("min_miles",
                   "Min Number of miles:",
                   min = 0,
                   max = max(df_hikes$miles),
                   value = 0),
       sliderInput("max_miles",
                   "Max Number of miles:",
                   min = 0,
                   max = max(df_hikes$miles),
                   value = max(df_hikes$miles)),
       sliderInput("min_elevation",
                   "Min Elevation:",
                   min = 0,
                   max = max(df_hikes$elevation),
                   value = 0),
       sliderInput("max_elevation",
                   "Max Elevation:",
                   min = 0,
                   max = max(df_hikes$elevation),
                   value = max(df_hikes$elevation))

           ),
    
    # Show a plot of the generated distribution
    mainPanel(
      leafletOutput("hikeMap")
    )
  )
))
