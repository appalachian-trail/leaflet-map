library(leaflet)
library(sp)
library(rgdal)

# mcafeeknob <- geojsonio::geojson_read("/Users/amullen2/Documents/Appalachian Trail/1980_southern_va_map_2.geojson", what = "sp")
mcafeeknob <- readOGR("/Users/amullen2/Documents/Appalachian Trail/at_shapefiles_ivo_mcafee_knob_20190228/macafee_knob_at_old_trail.shp",
                      layer = "macafee_knob_at_old_trail", GDAL1_integer64_policy = TRUE)
mcafee1963 <- readOGR("/Users/amullen2/Documents/Appalachian Trail/at_shapefiles_ivo_mcafee_knob_20190228/USGS_1963_AT_mcafee_knob.shp")

m <- leaflet() %>%
  setView(lng = -80.0367, lat = 37.3929, zoom = 10) %>%
  addTiles() %>%
  addProviderTiles(providers$MapBox, options = providerTileOptions(accessToken = 'pk.eyJ1IjoiYWJieS1tdWxsZW4iLCJhIjoiY2p0bXp4eDZmMDVmcDQ5cXBxemxlZDU0MyJ9.Mj9YtKzpPHQPIeIVX_O1eA',
                                                                  id = 'abby-mullen.7w159yp9', opacity = .50), group = "USGS 1963") %>%
  addPolylines(data=mcafeeknob, weight = 3, color = "red", group = "Appalachian Trail, c. 1980") %>%
  addPolylines(data=mcafee1963, weight = 3, group = "Appalachian Trail, 1963") %>%
  addMarkers(
    lng = -80.0367, lat = 37.3929,
    label = "McAfee Knob",
    labelOptions = labelOptions(noHide = T, textOnly = TRUE)) %>%
  addLayersControl(
    overlayGroups = c("Appalachian Trail, c. 1980", "Appalachian Trail, 1963"),
    baseGroups = c("USGS 1963"),
    options = layersControlOptions(collapsed = FALSE))
  

  
m

