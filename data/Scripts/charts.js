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
		//if(dataset["ResultSet"]["items"]["item"] [i]["-name"] == "Atypiske luftveisagens") {	

		var item = dataset["ResultSet"]["items"]["item"][i];
		var resultName = item["-name"];
		for(j = 0; j < item["areas"]["area"]["onLocation"].length; j++) {
			var unit = item["areas"]["area"]["onLocation"][j];
			
			if(unit["DataCollection"] == null) {
				continue;
			}
			
			var resultValue = [0,0,0,0,0,0,0];
			for(k = 0; k < unit["DataCollection"]["DataSet"].length; k++) {
				var data = unit["DataCollection"]["DataSet"][k];
				
				//Because of some missing results and NULL-values, I excluded all the results devided by agegroup
				if(data["categories"]["category"].length != 2 && data["categories"]["category"]["type"] != "AgeGroup") {

					if(data["dataResults"]["result"].length == undefined) {
						var result = JSON.parse("[" + data["dataResults"]["result"]["values"] + "]");
																					
						for(m = 0; m < result.length; m++) {						
							resultValue[m] += result[m];
							//var resultName = data["dataResults"]["result"][l]["name"].substring(data["dataResults"]["result"][l]["name"].indexOf("=") + 1)
							/* 
								Add 1  or 4 weeks to date depending on how the data was aggregated as per the documentation (Aggrevated over 7 days gives 28 entries; over 28 days gives 7 entries). 
								I think this gives us the correct dates?
							*/							
						}	
					}
					else{
						for(l = 0; l < data["dataResults"]["result"].length; l++) {
							var result = JSON.parse("[" + data["dataResults"]["result"][l]["values"] + "]");
																						
							for(m = 0; m < result.length; m++) {						
								resultValue[m] += result[m];
								//var resultName = data["dataResults"]["result"][l]["name"].substring(data["dataResults"]["result"][l]["name"].indexOf("=") + 1)
								/* 
									Add 1  or 4 weeks to date depending on how the data was aggregated as per the documentation (Aggrevated over 7 days gives 28 entries; over 28 days gives 7 entries). 
									I think this gives us the correct dates?
								*/								
							}
						}
					}
					
					for(m = 0; m < resultValue.length; m++) {
						var date = moment(data["-startDate"], "YYYY-MM-DD").add((resultValue.length - m - 1) * (resultValue.length == 7 ? 28 : 7), 'days'); 
								
						var row = { 
							name: item["-name"],
							area: item["areas"]["area"]["-name"],
							date: date,
							resultName: resultName,
							resultCount: resultValue[m]
						};

						rows.push(row);
					}	
				}
			}
		//	}
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
			case "Influensa A":
				p.infA += +v.resultCount;
				break;
			case "RS-virus":
				p.rs += +v.resultCount;
				break;
			case "Forkjolelsesvirus":
				p.forkjolelsesvirus += +v.resultCount;
				break;
			case "Atypiske luftveisagens":
				p.luftveisagens += +v.resultCount;
				break;
			case "Andre bakterier":
				p.andre += +v.resultCount;
				break;
			case "Influensa B":
				p.infB += +v.resultCount;
				break;
			}
			
			return p;
		},function(p, v) { 
			p.count--;
			
			switch(v.resultName) {
			case "Influensa A":
				p.infA -= +v.resultCount;
				break;
			case "RS-virus":
				p.rs -= +v.resultCount;
				break;
			case "Forkjolelsesvirus":
				p.forkjolelsesvirus -= +v.resultCount;
				break;
			case "Atypiske luftveisagens":
				p.luftveisagens -= +v.resultCount;
				break;
			case "Andre bakterier":
				p.andre -= +v.resultCount;
				break;
			case "Influensa B":
				p.infB -= +v.resultCount;
				break;
			}
			
			return p;
		},function() { 
			return { count: 0, infA: 0, rs: 0, forkjolelsesvirus: 0, luftveisagens: 0, andre: 0, infB: 0 }
		});
	//replace reduceCount with reduceSum to not just count the appearances of a result but to sum up the values
	resultGroup = resultDimension.group().reduceSum(function(d) { return d.resultCount; });
	nameGroup = nameDimension.group().reduceSum(function(d) { return d.resultCount; });
	
	
	chart = dc.compositeChart("#chart-container");
	resultChart = dc.pieChart("#result-chart-container");
	nameChart = dc.rowChart("#name-chart-container");
	
	
	
	chart
		.width(500)
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
				"Influensa A: " + d.value.infA + "\n" +
				"RS-virus: " + d.value.rs + "\n" +
				"Forkjolelsesvirus: " + d.value.forkjolelsesvirus + "\n";
				"Atypiske luftveisagens: " + d.value.luftveisagens + "\n";
				"Andre bakterier: " + d.value.andre + "\n";
				"Influensa B: " + d.value.infB + "\n";
		})
		.keyAccessor(function (d) {
			return d.key;
		})
		.valueAccessor(function(d) {
			return d.value.chlamydophila;
		})
		.elasticX(true)
		.elasticY(true)
		.renderHorizontalGridLines(true)
		.brushOn(false)
		.compose([
			dc.lineChart(chart)
				.group(dateGroup, "Influensa A")
				.renderDataPoints({radius: 4, fillOpacity: 0.8, strokeOpacity: 0.8})
				.defined(function(d){
					return (d.y !== null && d.y !== 0);
				})
				.valueAccessor(function(d) {
					return d.value.infA;
				})
				.ordinalColors(["Green"]),
			dc.lineChart(chart)
				.group(dateGroup, "RS-virus")
				//.useRightYAxis(true)
				.renderDataPoints({radius: 4, fillOpacity: 0.8, strokeOpacity: 0.8})
				.defined(function(d){
					return (d.y !== null && d.y !== 0);
				})
				.valueAccessor(function(d) {
					return d.value.rs;
				})
				.ordinalColors(["Red"]),
			dc.lineChart(chart)
				.group(dateGroup, "Forkjolelsesvirus")
				.renderDataPoints({radius: 4, fillOpacity: 0.8, strokeOpacity: 0.8})
				.defined(function(d){
					return (d.y !== null && d.y !== 0);
				})
				.valueAccessor(function(d) {
					return d.value.forkjolelsesvirus;
				})
				.ordinalColors(["Orange"]),
			dc.lineChart(chart)
				.group(dateGroup, "Atypiske luftveisagens")
				.useRightYAxis(true)
				.renderDataPoints({radius: 4, fillOpacity: 0.8, strokeOpacity: 0.8})
				.defined(function(d){
					return (d.y !== null && d.y !== 0);
				})
				.valueAccessor(function(d) {
					return d.value.luftveisagens;
				})
				.ordinalColors(["Lightblue"]),
			dc.lineChart(chart)
				.group(dateGroup, "Andre bakterier")
				.useRightYAxis(true)
				.renderDataPoints({radius: 4, fillOpacity: 0.8, strokeOpacity: 0.8})
				.defined(function(d){
					return (d.y !== null && d.y !== 0);
				})
				.valueAccessor(function(d) {
					return d.value.andre;
				})
				.ordinalColors(["Grey"]),
			dc.lineChart(chart)
				.group(dateGroup, "Influensa B")
				.useRightYAxis(true)
				.renderDataPoints({radius: 4, fillOpacity: 0.8, strokeOpacity: 0.8})
				.defined(function(d){
					return (d.y !== null && d.y !== 0);
				})
				.valueAccessor(function(d) {
					return d.value.infB;
				})
				.ordinalColors(["Lightgreen"]),
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