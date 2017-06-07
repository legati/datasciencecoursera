library(leaflet)

icon1 <- makeIcon('trololo.jpg', iconAnchorX = 20, iconAnchorY = 25)

map1 <- leaflet() %>% 
        addTiles() %>%
        addMarkers(0, 0, popup = 'Center', icon = icon1)
map1

x <- c(TRUE,TRUE,FALSE)
mean(x)
