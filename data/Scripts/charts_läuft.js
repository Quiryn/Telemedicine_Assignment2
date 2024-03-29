window.onload = init;

var dataset = null;
var rows = null;
var ndx = null;

var chart = null;
var resultChart = null;
var nameChart = null;

var dateDimension = null;
var resultDimension = null;
var nameChart = null;

var dateGroup = null;
var resultGroup = null;
var nameGroup = null;

function init() {
	d3.json("Assets/19_ALL_Luftvei.json", readDataSource);
}

function readDataSource(data) {
	dataset = data;
	
	rows = [];
	
	for(i = 0; i < dataset["ResultSet"]["items"]["item"].length; i++) {
		//for a first test: just focus on the category "Atypiske luftveisagens"
		if(dataset["ResultSet"]["items"]["item"] [i]["-name"] == "Atypiske luftveisagens") {	

		var item = dataset["ResultSet"]["items"]["item"][i];
		for(j = 0; j < item["areas"]["area"]["onLocation"].length; j++) {
			var unit = item["areas"]["area"]["onLocation"][j];
			
			if(unit["DataCollection"] == null) {
				continue;
			}
			
			for(k = 0; k < unit["DataCollection"]["DataSet"].length; k++) {
				var data = unit["DataCollection"]["DataSet"][k];
				
				//Because of some missing results and NULL-values, I excluded all the results devided by agegroup
				if(data["categories"]["category"].length != 2 && data["categories"]["category"]["type"] != "AgeGroup") {

					for(l = 0; l < data["dataResults"]["result"].length; l++) {
						var result = JSON.parse("[" + data["dataResults"]["result"][l]["values"] + "]");
						
						for(m = 0; m < result.length; m++) {
						
							var resultValue = result[m];
							var resultName = data["dataResults"]["result"][l]["name"].substring(data["dataResults"]["result"][l]["name"].indexOf("=") + 1)
							/* 
								Add 1  or 4 weeks to date depending on how the data was aggregated as per the documentation (Aggrevated over 7 days gives 28 entries; over 28 days gives 7 entries). 
								I think this gives us the correct dates?
							*/
							var date = moment(data["-startDate"], "YYYY-MM-DD").add((result.length - m - 1) * (result.length == 7 ? 28 : 7), 'days'); 
							
							var row = { 
								name: item["-name"],
								area: item["areas"]["area"]["-name"],
								date: date,
								resultName: resultName,
								resultCount: resultValue
							};
							
							rows.push(row)
						}
					}
				}
			}
		}
		}
	}
	
	ndx = crossfilter(rows);
	
	dateDimension = ndx.dimension(function(d) { return d.date });
	resultDimension = ndx.dimension(function(d) { return d.resultName });
	nameDimension = ndx.dimension(function(d) { return d.name });
	
	dateGroup = dateDimension.group().reduce(
		function(p, v) { 
			p.count++;
			
			//adjust the cases to the new subcategories of "Atypiske luftveisagens"
			switch(v.resultName) {
			case "Chlamydophila pneumoniae":
				p.positiveSum += +v.resultCount;
			break;
			case "Mycoplasma pneumoniae":
				p.negativeSum += +v.resultCount;
			break;
			case "Kikhoste":
				p.inconclusiveSum += +v.resultCount;
				break;
			}
			
			return p;
		},function(p, v) { 
			p.count--;
			
			switch(v.resultName) {
			case "Chlamydophila pneumoniae":
				p.positiveSum -= +v.resultCount;
			break;
			case "Mycoplasma pneumoniae":
				p.negativeSum -= +v.resultCount;
			break;
			case "Kikhoste":
				p.inconclusiveSum -= +v.resultCount;
				break;
			}
			
			return p;
		},function() { 
			return { count: 0, positiveSum: 0, negativeSum: 0, inconclusiveSum: 0 }
		});
	//replace reduceCount with reduceSum to not just count the appearances of a result but to sum up the values
	resultGroup = resultDimension.group().reduceSum(function(d) { return d.resultCount; });
	nameGroup = nameDimension.group().reduceCount();
	
	
	chart = dc.compositeChart("#chart-container");
	resultChart = dc.pieChart("#result-chart-container");
	nameChart = dc.rowChart("#name-chart-container");
	
	
	
	chart
		.width(500)
		.height(170)
		.margins({top: 10, right: 50, bottom: 25, left: 50})
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
				"Chlamydophila pneumoniae: " + d.value.positiveSum + "\n" +
				"Mycoplasma pneumoniae: " + d.value.negativeSum + "\n" +
				"Kikhoste: " + d.value.inconclusiveSum + "\n";
		})
		.keyAccessor(function (d) {
			return d.key;
		})
		.valueAccessor(function(d) {
			return d.value.positiveSum;
		})
		.elasticX(true)
		.elasticY(true)
		.renderHorizontalGridLines(true)
		.brushOn(false)
		.compose([
			dc.lineChart(chart)
				.group(dateGroup, "Chlamydophila pneumoniae")
				.renderDataPoints({radius: 4, fillOpacity: 0.8, strokeOpacity: 0.8})
				.defined(function(d){
					return (d.y !== null && d.y !== 0);
				})
				.valueAccessor(function(d) {
					return d.value.positiveSum;
				})
				.ordinalColors(["Green"]),
			dc.lineChart(chart)
				.group(dateGroup, "Mycoplasma pneumoniae")
				.useRightYAxis(true)
				.renderDataPoints({radius: 4, fillOpacity: 0.8, strokeOpacity: 0.8})
				.defined(function(d){
					return (d.y !== null && d.y !== 0);
				})
				.valueAccessor(function(d) {
					return d.value.negativeSum;
				})
				.ordinalColors(["Red"]),
			dc.lineChart(chart)
				.group(dateGroup, "Kikhoste")
				.renderDataPoints({radius: 4, fillOpacity: 0.8, strokeOpacity: 0.8})
				.defined(function(d){
					return (d.y !== null && d.y !== 0);
				})
				.valueAccessor(function(d) {
					return d.value.inconclusiveSum;
				})
				.ordinalColors(["Orange"])
		]);
	
	resultChart
		.width(260)
		.height(170)
		.dimension(resultDimension)
		.group(resultGroup)
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
	
	nameChart
		.width(300)
		.height(200)
		.dimension(nameDimension)
		.group(nameGroup)
		.elasticX(true)
		.ordering(function (d) {
			return -d.value;
		})
		.label(function (d) {
			return d.key;
		})
		.title(function (d) {
			return d.key + ": " + d.value;
		});
	
	var all = ndx.groupAll();

	dc.dataCount(".dc-data-count")
	.dimension(ndx)
	.group(all);

	dc.renderAll();
	dc.filterAll();
}