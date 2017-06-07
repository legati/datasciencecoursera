'US State Facts and Figures' Dataset Visualization Application
========================================================
author: Mykola Klymenko
date: 13/11/2016
autosize: true

First Slide
========================================================

This simple application was created in order to demonstrate
the visualization tools available in R.
More specifically, this Shiny app was developed using googleVis 
package. It allows the user to choose different statistics from
the 'state' dataset pack and see their visualization on a map of
the United States of America.

Dataset description
========================================================

US State Facts and Figures

Data sets related to the 50 states of the United States of America, giving the following statistics in the respective columns:  

Population, Income, Illiteracy, Life Exp, Murder, HS Grad, Frost, Area.

Source:  
1. U.S. Department of Commerce, Bureau of the Census (1977) Statistical Abstract of the United States.  
2. U.S. Department of Commerce, Bureau of the Census (1977) County and City Data Book.  
References:  
Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) The New S Language. Wadsworth & Brooks/Cole.

googleVis Geo Chart
========================================================
Example - Visualization of Life Expectance statistic distribution
<!-- GeoChart generated in R 3.3.1 by googleVis 0.6.1 package -->
<!-- Mon Nov 14 00:17:10 2016 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataGeoChartID383b395d91aa () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"Alabama",
69.05
],
[
"Alaska",
69.31
],
[
"Arizona",
70.55
],
[
"Arkansas",
70.66
],
[
"California",
71.71
],
[
"Colorado",
72.06
],
[
"Connecticut",
72.48
],
[
"Delaware",
70.06
],
[
"Florida",
70.66
],
[
"Georgia",
68.54
],
[
"Hawaii",
73.6
],
[
"Idaho",
71.87
],
[
"Illinois",
70.14
],
[
"Indiana",
70.88
],
[
"Iowa",
72.56
],
[
"Kansas",
72.58
],
[
"Kentucky",
70.1
],
[
"Louisiana",
68.76
],
[
"Maine",
70.39
],
[
"Maryland",
70.22
],
[
"Massachusetts",
71.83
],
[
"Michigan",
70.63
],
[
"Minnesota",
72.96
],
[
"Mississippi",
68.09
],
[
"Missouri",
70.69
],
[
"Montana",
70.56
],
[
"Nebraska",
72.6
],
[
"Nevada",
69.03
],
[
"New Hampshire",
71.23
],
[
"New Jersey",
70.93
],
[
"New Mexico",
70.32
],
[
"New York",
70.55
],
[
"North Carolina",
69.21
],
[
"North Dakota",
72.78
],
[
"Ohio",
70.82
],
[
"Oklahoma",
71.42
],
[
"Oregon",
72.13
],
[
"Pennsylvania",
70.43
],
[
"Rhode Island",
71.9
],
[
"South Carolina",
67.96
],
[
"South Dakota",
72.08
],
[
"Tennessee",
70.11
],
[
"Texas",
70.9
],
[
"Utah",
72.9
],
[
"Vermont",
71.64
],
[
"Virginia",
70.08
],
[
"Washington",
71.72
],
[
"West Virginia",
69.48
],
[
"Wisconsin",
72.48
],
[
"Wyoming",
70.29
] 
];
data.addColumn('string','State');
data.addColumn('number','Life.Exp');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartGeoChartID383b395d91aa() {
var data = gvisDataGeoChartID383b395d91aa();
var options = {};
options["region"] = "US";
options["displayMode"] = "regions";
options["resolution"] = "provinces";

    var chart = new google.visualization.GeoChart(
    document.getElementById('GeoChartID383b395d91aa')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "geochart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartGeoChartID383b395d91aa);
})();
function displayChartGeoChartID383b395d91aa() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartGeoChartID383b395d91aa"></script>
 
<!-- divChart -->
  
<div id="GeoChartID383b395d91aa" 
  style="width: auto; height: auto;">
</div>

Top 10 Table
========================================================
<!-- Table generated in R 3.3.1 by googleVis 0.6.1 package -->
<!-- Mon Nov 14 00:17:10 2016 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataTableID383b19edeb99 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"Hawaii",
73.6
],
[
"Minnesota",
72.96
],
[
"Utah",
72.9
],
[
"North Dakota",
72.78
],
[
"Nebraska",
72.6
],
[
"Kansas",
72.58
],
[
"Iowa",
72.56
],
[
"Connecticut",
72.48
],
[
"Wisconsin",
72.48
],
[
"Oregon",
72.13
] 
];
data.addColumn('string','State');
data.addColumn('number','Life.Exp');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartTableID383b19edeb99() {
var data = gvisDataTableID383b19edeb99();
var options = {};
options["allowHtml"] = true;

    var chart = new google.visualization.Table(
    document.getElementById('TableID383b19edeb99')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "table";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartTableID383b19edeb99);
})();
function displayChartTableID383b19edeb99() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartTableID383b19edeb99"></script>
 
<!-- divChart -->
  
<div id="TableID383b19edeb99" 
  style="width: auto; height: auto;">
</div>
