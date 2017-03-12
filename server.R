#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
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

shinyServer(function(input, output) {
  
 
  
  
  output$hikeMap <- 
    renderLeaflet({
    df_hikes[which(df_hikes$miles >= input$min_miles & df_hikes$miles <= input$max_miles & df_hikes$elevation >= input$min_elevation & df_hikes$elevation <= input$max_elevation),] %>% 
    leaflet() %>%
    addTiles() %>%
    addCircles(lat = ~latitude, lng = ~longitude, weight = 5, radius = 500, color=c("RED","BLUE","GREEN","YELLOW","PURPLE","BLACK", "GRAY", "ORANGE")[1:nrow(df_hikes)]) %>%
    addLegend(labels=df_hikes$name, colors=c("RED","BLUE","GREEN","YELLOW","PURPLE","BLACK", "GRAY", "ORANGE")[1:nrow(df_hikes)])
  })
  
})


