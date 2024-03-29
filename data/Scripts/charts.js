window.onload = init;

var currentSymptom;
var currentCounty;
var dataset = null;
var rows = [];
var resultRows = [];
var ndx = null;

var chart = null;
var areaChart = null;
var countyChart = null;
var symptomChart = null;
var diseaseChart = null;
var ageChart = null;
var genderChart = null;

var dateDimension = null;
var areaDimension = null;
var symptomDimension = null;
var diseaseDimension = null;
var ageDimension = null;
var genderDimension = null;

var dateGroup = null;
var areaGroup = null;
var countyGroup = null;
var symptomGroup = null;
var diseaseGroup = null;
var ageGroup = null;
var genderGroup = null;

function init() {
	d3.json("Assets/18_ALL.json", readDataSource);
    d3.json("Assets/19_ALL.json", readDataSource);
    d3.json("Assets/20_ALL.json", readDataSource);
	
	
	d3.json("Assets/18_ALL.json", readDataSource2);
	d3.json("Assets/19_ALL.json", readDataSource2);
	d3.json("Assets/20_ALL.json", readDataSource2);
	
}

function readDataSource(data) {
	dataset = data;
	
	for(i = 0; i < dataset["ResultSet"]["items"]["item"].length; i++) {
		var item = dataset["ResultSet"]["items"]["item"][i];
		
		if(item["@attributes"]["name"] != "Alle"){
			
			for(j = 0; j < item["areas"]["area"]["onLocation"].length; j++) {
				var unit = item["areas"]["area"]["onLocation"][j];
				
				if(unit["DataCollection"] == null) {
					continue;
				}
				
				var resultValue = [0,0,0,0,0,0,0];
				for(k = 0; k < unit["DataCollection"]["DataSet"].length; k++) {
					var data = unit["DataCollection"]["DataSet"][k];
					
					if(data["categories"]["category"].length == 2) {
						var ageGroup = null;
						var sex = null;

						if(data["categories"]["category"][0]["type"] == "AgeGroup"){
							ageGroup = data["categories"]["category"][0]["value"];
						}
						if(data["categories"]["category"][1]["type"] == "Sex"){
							sex = data["categories"]["category"][1]["value"];
						}

						if(data["dataResults"]["result"].length == undefined) {
							var result = JSON.parse("[" + data["dataResults"]["result"]["values"] + "]");
							var resultName = data["dataResults"]["result"]["name"].substring(data["dataResults"]["result"]["name"].indexOf("=") + 1);
							
							for(m = 0; m < result.length; m++) {						
								var date = moment(data["@attributes"]["startDate"], "YYYY-MM-DD").add(m * (resultValue.length == 7 ? 28 : 7), 'days'); 

								var row = { 
									symptom: item["@attributes"]["name"],
									area: item["areas"]["area"]["@attributes"]["name"],
									date: date,
									resultName: resultName,
									resultCount: result[m],
									ageGroup: ageGroup,
									sex: sex
								};

								resultRows.push(row);
							}	
						}
						else{
							for(l = 0; l < data["dataResults"]["result"].length; l++) {
								var result = JSON.parse("[" + data["dataResults"]["result"][l]["values"] + "]");
								var resultName = data["dataResults"]["result"][l]["name"].substring(data["dataResults"]["result"][l]["name"].indexOf("=") + 1);
								
								for(m = 0; m < result.length; m++) {						
									var date = moment(data["@attributes"]["startDate"], "YYYY-MM-DD").add(m * (resultValue.length == 7 ? 28 : 7), 'days'); 

									var row = { 
										symptom: item["@attributes"]["name"],
										area: item["areas"]["area"]["@attributes"]["name"],
										date: date,
										resultName: resultName,
										resultCount: result[m],
										ageGroup: ageGroup,
										sex: sex
									};
									console.log(row);
									resultRows.push(row);								
								}
							}
						}
					}
				}
			}
		}
	}
	
	ndx = crossfilter(resultRows);
	
	dateDimension = ndx.dimension(function(d) { return d.date });
	areaDimension = ndx.dimension(function(d) { return d.area });
	symptomDimension = ndx.dimension(function(d) {return d.symptom});
	diseaseDimension = ndx.dimension(function(d) {return d.resultName});
	ageDimension = ndx.dimension(function(d) { return d.ageGroup });
	genderDimension = ndx.dimension(function(d) { return d.sex });
		
	areaGroup = dateDimension.group().reduce(
		function(p, v) { 
			p.count++;
			
			switch(v.area) {
			case "Troms":
				p.troms += +v.resultCount;
				break;
			case "Nordland":
				p.nordland += +v.resultCount;
				break;
			case "Finnmark":
				p.finnmark += +v.resultCount;
				break;
			}
			
			return p;
		},function(p, v) { 
			p.count--;
			
			switch(v.area) {
			case "Troms":
				p.troms -= +v.resultCount;
				break;
			case "Nordland":
				p.nordland -= +v.resultCount;
				break;
			case "Finnmark":
				p.finnmark -= +v.resultCount;
				break;
			}
			
			return p;
		},function() { 
			return { count: 0, troms: 0, nordland: 0, finnmark: 0 }
	});
	
	symptomGroup = symptomDimension.group().reduceSum(function(d) { return d.resultCount; });
	diseaseGroup = diseaseDimension.group().reduceSum(function(d) { return d.resultCount; });
	countyGroup = areaDimension.group().reduceSum(function(d) { return d.resultCount; });
	ageGroup = ageDimension.group().reduceSum(function(d) { return d.resultCount; });
	genderGroup = genderDimension.group().reduceSum(function(d) { return d.resultCount; });
	
	chart = dc.compositeChart("#chart-container");
	countyChart = dc.pieChart("#county-chart-container");
	symptomChart = dc.pieChart("#symptom-chart-container");
	ageChart = dc.pieChart("#age-chart-container");
	genderChart = dc.pieChart("#gender-chart-container");
	diseaseChart = dc.barChart("#disease-chart-container");

		
	chart
		.width(700)
		.height(220)
		.margins({top: 20, right: 50, bottom: 25, left: 50})
		.dimension(dateDimension)
		.group(areaGroup)
		.legend(dc.legend().x(60).y(10))
		.renderLabel(false)
		.x(d3.time.scale())                
		.y(d3.scale.linear())
		.xUnits(d3.time.days)
		.yAxisPadding("5%")
		.renderHorizontalGridLines(true)
		.title(function (d) {
			return d.key.format("MMMM Do YYYY") + "\n" + 
				"Nordland: " + d.value.nordland + "\n" +
				"Troms: " + d.value.troms + "\n" +
				"Finnmark: " + d.value.finnmark + "\n";
		})
		.keyAccessor(function (d) {
			return d.key;
		})
		.valueAccessor(function(d) {
			return d.value.date;
		})
		.elasticX(true)
		.elasticY(true)
		.renderHorizontalGridLines(true)
		.brushOn(false)
		.compose([
			dc.lineChart(chart)
				.group(areaGroup, "Nordland")
				.renderDataPoints({radius: 4, fillOpacity: 0.8, strokeOpacity: 0.8})
				.defined(function(d){
					return (d.y !== null && d.y !== 0);
				})
				.valueAccessor(function(d) {
					return d.value.nordland;
				})
				.ordinalColors(["Green"]),
			dc.lineChart(chart)
				.group(areaGroup, "Troms")
				.renderDataPoints({radius: 4, fillOpacity: 0.8, strokeOpacity: 0.8})
				.defined(function(d){
					return (d.y !== null && d.y !== 0);
				})
				.valueAccessor(function(d) {
					return d.value.troms;
				})
				.ordinalColors(["Red"]),
			dc.lineChart(chart)
				.group(areaGroup, "Finnmark")
				.renderDataPoints({radius: 4, fillOpacity: 0.8, strokeOpacity: 0.8})
				.defined(function(d){
					return (d.y !== null && d.y !== 0);
				})
				.valueAccessor(function(d) {
					return d.value.finnmark;
				})
				.ordinalColors(["Orange"])			
		]);
	
	countyChart
		.width(260)
		.height(170)
		.dimension(areaDimension)
		.group(countyGroup)
		.innerRadius(10)
		.slicesCap(8)
		.legend(dc.legend().x(175).y(0))
		.ordering(function (d) {
			return -d.value;
		})
		.keyAccessor(function (d) {
			return d.key;
		})
		.cx(85)
		.emptyTitle("Unknown")
		.renderLabel(true)
		.label(function (d) {
			return d.key;
		})
		.title(function (d) {
			return d.key + ": " + d.value;
		});
	
	symptomChart
		.width(260)
		.height(170)
		.dimension(symptomDimension)
		.group(symptomGroup)
		.innerRadius(10)
		.slicesCap(8)
		.legend(dc.legend().x(175).y(0))
		.ordering(function (d) {
			return -d.value;
		})
		.keyAccessor(function (d) {
			return d.key;
		})
		.cx(85)
		.emptyTitle("Unknown")
		.renderLabel(true)
		.label(function (d) {
			return d.key;
		})
		.title(function (d) {
			return d.key + ": " + d.value;
		});
		
	ageChart
		.width(260)
		.height(170)
		.dimension(ageDimension)
		.group(ageGroup)
		.innerRadius(10)
		.slicesCap(8)
		.legend(dc.legend().x(175).y(0))
		.ordering(function (d) {
			return -d.value;
		})
		.keyAccessor(function (d) {
			return d.key;
		})
		.cx(85)
		.emptyTitle("Unknown")
		.renderLabel(true)
		.label(function (d) {
			return d.key;
		})
		.title(function (d) {
			return d.key + ": " + d.value;
		});
	
	genderChart
		.width(260)
		.height(170)
		.dimension(genderDimension)
		.group(genderGroup)
		.innerRadius(10)
		.slicesCap(8)
		.legend(dc.legend().x(175).y(0))
		.ordering(function (d) {
			return -d.value;
		})
		.keyAccessor(function (d) {
			return d.key;
		})
		.cx(85)
		.emptyTitle("Unknown")
		.renderLabel(true)
		.label(function (d) {
			return d.key;
		})
		.title(function (d) {
			return d.key + ": " + d.value;
		});
		
	diseaseChart
		 .width(500)
		 .dimension(diseaseDimension)
		 .group(diseaseGroup)
		 .label(function (d) {
                    return d.key;
                })
		 .x(d3.scale.ordinal().domain(["", "Atypiske luftveisagens","Forkjolelsesvirus","Influensa A","Influensa B", "RS-virus", "Virus", "Bakterie", "Parasitter"])) // Need the empty val to offset the first value
		 .elasticY(true)
		 .xUnits(dc.units.ordinal) // Tell Dc.js that we're using an ordinal x axis
		 .brushOn(false)
		 .centerBar(true)
		 .xAxisPadding(500)
		 .renderlet(function (myBarChart) {
			 // rotate x-axis labels
			 myBarChart.selectAll('g.x text')
					 .attr('transform', 'translate(0,-20) rotate(90)');
		 });

	
	var all = ndx.groupAll();

	dc.dataCount(".dc-data-count")
	.dimension(ndx)
	.group(all);

	dc.renderAll();
	dc.filterAll();
}


/*
*	Second approach, large diagram over time with values for every week
*/

function readDataSource2(data) {
	dataset = data;
	
	for(i = 0; i < dataset["ResultSet"]["items"]["item"].length; i++) {	

		var item = dataset["ResultSet"]["items"]["item"][i];

		for(j = 0; j < item["areas"]["area"]["onLocation"].length; j++) {
			var unit = item["areas"]["area"]["onLocation"][j];
			
			var data = unit["AggregatedCollection"]["DataSet"];				

			for(l = 0; l < data["dataResults"]["result"].length; l++) {

				var result = JSON.parse("[" + data["dataResults"]["result"][l]["values"] + "]");
				var resultName = data["dataResults"]["result"][l]["name"].substring(data["dataResults"]["result"][l]["name"].indexOf("=") + 1);
				
				for(m = 0; m < result.length; m++) {						
					var resultValue = result[m];
					var date = moment(data["@attributes"]["startDate"], "YYYY-MM-DD").add(m * (result.length == 7 ? 28 : 7), 'days'); 
					
					var row = { 
						name: item["areas"]["area"]["@attributes"]["name"],
						date: date,
						resultName: resultName,
						resultCount: resultValue
					};
					rows.push(row);
				}
			}	
		}
	}
	setSymptom();	
}	

function setSymptom(){
	var result = [];
	var select = document.getElementById("symptomSelect");
	currentSymptom = select.options[select.selectedIndex].text;
	document.getElementById("symptomHead").innerHTML = select.options[select.selectedIndex].text;
	
	
	for(i = 0; i < rows.length; i++){
		if(rows[i]["resultName"] == currentSymptom){
			result.push(rows[i]);
		}
	}
	
	displayData(result, "#area-chart-container");	
}

function displayData(rows, chartContainer){
	ndx = crossfilter(rows);

	dateDimension = ndx.dimension(function(d) { return d.date });
	
	dateGroup = dateDimension.group().reduce(
		function(p, v) { 
			p.count++;
			
			switch(v.name) {
			case "Troms":
				p.troms += +v.resultCount;
				break;
			case "Nordland":
				p.nordland += +v.resultCount;
				break;
			case "Finnmark":
				p.finnmark += +v.resultCount;
				break;
			}
			
			return p;
		},function(p, v) { 
			p.count--;
			
			switch(v.name) {
			case "Troms":
				p.troms -= +v.resultCount;
				break;
			case "Nordland":
				p.nordland -= +v.resultCount;
				break;
			case "Finnmark":
				p.finnmark -= +v.resultCount;
				break;
			}
			
			return p;
		},function() { 
			return { count: 0, troms: 0, nordland: 0, finnmark: 0 }
		});
	
	areaChart = dc.compositeChart(chartContainer);
	
	areaChart
		.width(1200)
		.height(220)
		.margins({top: 20, right: 50, bottom: 25, left: 50})
		.dimension(dateDimension)
		.group(dateGroup)
		.legend(dc.legend().x(60).y(10))
		.renderLabel(false)
		.x(d3.time.scale())                
		.y(d3.scale.linear())
		.xUnits(d3.time.days)
		.yAxisPadding("5%")
		.renderHorizontalGridLines(true)
		.title(function (d) {
			return d.key.format("MMMM Do YYYY") + "\n" + 
				"Nordland: " + d.value.nordland + "\n" +
				"Troms: " + d.value.troms + "\n" +
				"Finnmark: " + d.value.finnmark + "\n";
		})
		.keyAccessor(function (d) {
			return d.key;
		})
		.valueAccessor(function(d) {
			return d.value.date;
		})
		.elasticX(true)
		.elasticY(true)
		.brushOn(false)
		.compose([
			dc.lineChart(areaChart)
				.group(dateGroup, "Nordland")
				.renderDataPoints({radius: 4, fillOpacity: 0.8, strokeOpacity: 0.8})
				.defined(function(d){
					return (d.y !== null && d.y !== 0);
				})
				.valueAccessor(function(d) {
					return d.value.nordland;
				})
				.ordinalColors(["Green"]),
			dc.lineChart(areaChart)
				.group(dateGroup, "Troms")
				.renderDataPoints({radius: 4, fillOpacity: 0.8, strokeOpacity: 0.8})
				.defined(function(d){
					return (d.y !== null && d.y !== 0);
				})
				.valueAccessor(function(d) {
					return d.value.troms;
				})
				.ordinalColors(["Red"]),
			dc.lineChart(areaChart)
				.group(dateGroup, "Finnmark")
				.renderDataPoints({radius: 4, fillOpacity: 0.8, strokeOpacity: 0.8})
				.defined(function(d){
					return (d.y !== null && d.y !== 0);
				})
				.valueAccessor(function(d) {
					return d.value.finnmark;
				})
				.ordinalColors(["Orange"])
		]);

	dc.renderAll();
	dc.filterAll();
}