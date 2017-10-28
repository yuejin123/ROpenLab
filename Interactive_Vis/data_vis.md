<style>
font-family:Garamond, Georgia, serif;
.small-code pre code {
  font-size: 1em;
}

.midcenter {
    position: fixed;
    top: 50%;
    left: 50%;
}

.section .reveal .state-background {
    background: white;}
.section .reveal h1,
.section .reveal p {
    color: black;
    position: relative;
    font-size: 3 em;
    top: 4%;}
.reveal h3{
   position: relative;
   font-family:Garamond, Georgia, serif;
   top: 0%;
   left: 0%;}
.reveal .slideContent h3{
   left: 0%;}
</style>



Interactive Visualization
========================================================
font-family:Garamond, Georgia, serif;

<br>
<br>
<br>
<font size=50em>Yue Jin</font>
<br>
<br>
<fontsize=30em>04/12/2017</font>
<style>
/* slide titles */
.reveal h3 { 
  font-size: 70px;
  font-family:Garamond, Georgia, serif;

}
</style>




Goals of Interactive Visualization
========================================================
<style>
/* ordered and unordered list styles */
.reveal ul{
  font-size: 50px;
}, 

.reveal ol {
    font-size: 50px;
    color: black;
}
</style>
+ Enable customized data exploration experience
+ Review findings in and across multiple dimensions
+ Visualize data trending
+ Tell a story through data through data trending and data linking


Examples of Interactive Vis in R
========================================================

Examples of Interactive Vis in R
========================================================


Grammar of Graphics
========================================================
A grammar of graphics provides a structure to combine graphical elements into figures that display data in a meaningful way. 
Building blocks of a graph include:
- data
- coordinate system: cartesian, polar
- geometric object: marks you used to represent data (points, line, bins)
- aesthetic mapping: visual property of the objects in the plot, anything you can see (location, shape, size)
- statistical transformations: mean, median
<div class="midcenter" style="margin-left:-300px; margin-top:-300px;">
<img src="flowchart_600x600.png"></img>
</div>

rCharts - Bar Plot
========================================================
 
<style>
  .rChart {
    display: block;
    height: 400px;
  }
</style>
 
<link rel='stylesheet' href=//cdnjs.cloudflare.com/ajax/libs/nvd3/1.1.15-beta/nv.d3.min.css>
<script type='text/javascript' src=//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js></script>
<script type='text/javascript' src=//d3js.org/d3.v3.min.js></script>
<script type='text/javascript' src=//cdnjs.cloudflare.com/ajax/libs/nvd3/1.1.15-beta/nv.d3.min.js></script>
<script type='text/javascript' src=//nvd3.org/assets/lib/fisheye.js></script> 
 <style>
  .rChart {
    display: block;
    margin-left: auto; 
    margin-right: auto;
    width: 800px;
    height: 400px;
  }  
  </style>
<div id = 'mychart1' class = 'rChart nvd3'></div>
<script type='text/javascript'>
 $(document).ready(function(){
      drawmychart1()
    });
    function drawmychart1(){  
      var opts = {
 "dom": "mychart1",
"width":    800,
"height":    400,
"x": "Hair",
"y": "Freq",
"group": "Eye",
"type": "multiBarChart",
"id": "mychart1" 
},
        data = [
 {
 "Hair": "Black",
"Eye": "Brown",
"Sex": "Male",
"Freq":             32 
},
{
 "Hair": "Brown",
"Eye": "Brown",
"Sex": "Male",
"Freq":             53 
},
{
 "Hair": "Red",
"Eye": "Brown",
"Sex": "Male",
"Freq":             10 
},
{
 "Hair": "Blond",
"Eye": "Brown",
"Sex": "Male",
"Freq":              3 
},
{
 "Hair": "Black",
"Eye": "Blue",
"Sex": "Male",
"Freq":             11 
},
{
 "Hair": "Brown",
"Eye": "Blue",
"Sex": "Male",
"Freq":             50 
},
{
 "Hair": "Red",
"Eye": "Blue",
"Sex": "Male",
"Freq":             10 
},
{
 "Hair": "Blond",
"Eye": "Blue",
"Sex": "Male",
"Freq":             30 
},
{
 "Hair": "Black",
"Eye": "Hazel",
"Sex": "Male",
"Freq":             10 
},
{
 "Hair": "Brown",
"Eye": "Hazel",
"Sex": "Male",
"Freq":             25 
},
{
 "Hair": "Red",
"Eye": "Hazel",
"Sex": "Male",
"Freq":              7 
},
{
 "Hair": "Blond",
"Eye": "Hazel",
"Sex": "Male",
"Freq":              5 
},
{
 "Hair": "Black",
"Eye": "Green",
"Sex": "Male",
"Freq":              3 
},
{
 "Hair": "Brown",
"Eye": "Green",
"Sex": "Male",
"Freq":             15 
},
{
 "Hair": "Red",
"Eye": "Green",
"Sex": "Male",
"Freq":              7 
},
{
 "Hair": "Blond",
"Eye": "Green",
"Sex": "Male",
"Freq":              8 
} 
]
  
      if(!(opts.type==="pieChart" || opts.type==="sparklinePlus" || opts.type==="bulletChart")) {
        var data = d3.nest()
          .key(function(d){
            //return opts.group === undefined ? 'main' : d[opts.group]
            //instead of main would think a better default is opts.x
            return opts.group === undefined ? opts.y : d[opts.group];
          })
          .entries(data);
      }
      
      if (opts.disabled != undefined){
        data.map(function(d, i){
          d.disabled = opts.disabled[i]
        })
      }
      
      nv.addGraph(function() {
        var chart = nv.models[opts.type]()
          .width(opts.width)
          .height(opts.height)
          
        if (opts.type != "bulletChart"){
          chart
            .x(function(d) { return d[opts.x] })
            .y(function(d) { return d[opts.y] })
        }
          
         
        
          
        

        
        
        
      
       d3.select("#" + opts.id)
        .append('svg')
        .datum(data)
        .transition().duration(500)
        .call(chart);

       nv.utils.windowResize(chart.update);
       return chart;
      });
    };
</script>

rCharts - timeseries YoY
========================================================
 
<style>
  .rChart {
    display: block;
    height: 400px;
  }  
</style>
 
<script type='text/javascript' src=//code.jquery.com/jquery-1.9.1.min.js></script>
<script type='text/javascript' src=//code.highcharts.com/highcharts.js></script>
<script type='text/javascript' src=//code.highcharts.com/highcharts-more.js></script>
<script type='text/javascript' src=//code.highcharts.com/modules/exporting.js></script> 
 <style>
  .rChart {
    display: block;
    margin-left: auto; 
    margin-right: auto;
    width: 800px;
    height: 400px;
  }  
  </style>
<div id = 'mychart2' class = 'rChart highcharts'></div>
<script type='text/javascript'>
    (function($){
        $(function () {
            var chart = new Highcharts.Chart({
 "dom": "mychart2",
"width":            800,
"height":            400,
"credits": {
 "href": null,
"text": null 
},
"exporting": {
 "enabled": false 
},
"title": {
 "text": null 
},
"yAxis": {
 "title": {
 "text": null 
} 
},
"chart": {
 "type": "spline",
"renderTo": "mychart2" 
},
"series": [
 {
 "data": [
              1,
             3,
             2,
             4,
             5,
             4,
             6,
             2,
             3,
             5,
             4,
             7 
],
"dashStyle": "longdash",
"name": "2011" 
},
{
 "data": [
 null,
             4,
             1,
             3,
             4,
             2,
             9,
             1,
             2,
             3,
             4,
             3 
],
"dashStyle": "shortdot",
"name": "2012" 
},
{
 "data": [
              4,
             6,
             7,
             8,
             6,
             2,
             9,
             4,
             3,
             6,
             7,
null 
],
"dashStyle": "longdot",
"name": "2013" 
} 
],
"xAxis": [
 {
 "categories": [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ] 
} 
],
"legend": {
 "symbolWidth":             80 
},
"id": "mychart2" 
});
        });
    })(jQuery);
</script>

pie chart
========================================================
 
<style>
  .rChart {
    display: block;
    height: 400px;
  }  
</style>
 
<script type='text/javascript' src=//code.jquery.com/jquery-1.9.1.min.js></script>
<script type='text/javascript' src=//code.highcharts.com/highcharts.js></script>
<script type='text/javascript' src=//code.highcharts.com/highcharts-more.js></script>
<script type='text/javascript' src=//code.highcharts.com/modules/exporting.js></script> 
 <style>
  .rChart {
    display: block;
    margin-left: auto; 
    margin-right: auto;
    width: 800px;
    height: 400px;
  }  
  </style>
<div id = 'mychart4' class = 'rChart highcharts'></div>
<script type='text/javascript'>
    (function($){
        $(function () {
            var chart = new Highcharts.Chart({
 "dom": "mychart4",
"width":            800,
"height":            400,
"credits": {
 "href": null,
"text": null 
},
"exporting": {
 "enabled": false 
},
"title": {
 "text": "Fruits" 
},
"yAxis": {
 "title": {
 "text": null 
} 
},
"series": [
 {
 "data": [
 [
 "Apples",
            15 
],
[
 "Bananas",
            20 
],
[
 "Oranges",
            30 
] 
],
"type": "pie",
"name": "Amount" 
} 
],
"id": "mychart4",
"chart": {
 "renderTo": "mychart4" 
} 
});
        });
    })(jQuery);
</script>

googleVis - Motion Chart
========================================================
https://cran.r-project.org/web/packages/googleVis/vignettes/googleVis_examples.html
<!-- IntensityMap generated in R 3.3.2 by googleVis 0.6.2 package -->
<!-- Tue Apr 11 12:44:56 2017 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataIntensityMapIDe716ac338a () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"US",
10,
23
],
[
"GB",
13,
12
],
[
"BR",
14,
32
] 
];
data.addColumn('string','country');
data.addColumn('number','val1');
data.addColumn('number','val2');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartIntensityMapIDe716ac338a() {
var data = gvisDataIntensityMapIDe716ac338a();
var options = {};
options["width"] = 600;

    var chart = new google.visualization.IntensityMap(
    document.getElementById('IntensityMapIDe716ac338a')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "intensitymap";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartIntensityMapIDe716ac338a);
})();
function displayChartIntensityMapIDe716ac338a() {
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
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartIntensityMapIDe716ac338a"></script>
 
<!-- divChart -->
  
<div id="IntensityMapIDe716ac338a" 
  style="width: 600; height: automatic;">
</div>

Code References
========================================================

.Rpres Code in my github repository
https://github.com/Porxy/RPresentation

rCharts
http://ramnathv.github.io/rCharts/

rHighcharts
http://glimmer.rstudio.com/reinholdsson/rHighcharts/

googleVis
https://code.google.com/p/google-motion-charts-with-r/

Flash Settings for Motion Chart
http://www.macromedia.com/support/documentation/en/flashplayer/help/settings_manager04.html
