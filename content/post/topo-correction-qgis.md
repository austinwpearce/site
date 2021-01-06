---
title: Topographic Correction In QGIS
date: '2016-11-15'
slug: topo-correct-qgis
tags: [Spatial, GIS, Remote Sensing]
header:
  caption: ''
  image: ''
summary: "Light reflects better from flat surfaces."
---

Before performing image analyses, it is wise to control for reflectance anomalies (shadows and whatnot) which may be due to local topography. This can be done inside QGIS 2.14, a free GIS program that has some nifty features nowhere to be found in ENVI or ArcGIS.
 
What you'll need:
  + Elevation model
  + Single band image^*^
  + QGIS 2.14 with SAGA GIS Toolbox enabled
  + To watch the following video

*Seems to me that the Topo Correction Tool will not work on multiband images, which is a bit annoying since most useful imagery is multiband. Looks like splitting and recompositing imagery will be my new hobby.

* Still works in QGIS 2.18 as of 2017-11-27

<iframe width="700" height="432" src="https://www.youtube.com/embed/Z0iuK3rkBsI?rel=0" frameborder="0" allowfullscreen></iframe>