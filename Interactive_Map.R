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
  addPolylines(data=mcafeeknob, weight = 1.5, group = "McAfee Knob") %>%
  addPolylines(data=mcafee1963, weight = 1.5, group = "McAfee Knob 1963") %>%
  addMarkers(
    lng = -80.0367, lat = 37.3929,
    label = "McAfee Knob",
    labelOptions = labelOptions(noHide = T, textOnly = TRUE)) %>%
  addLayersControl(
    overlayGroups = c("McAfee Knob", "McAfee Knob 1963"),
    options = layersControlOptions(collapsed = FALSE))
  

  
m

