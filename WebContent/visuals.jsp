<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="../../favicon.ico">
<title>Registration</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootswatch/3.2.0/paper/bootstrap.min.css">
<script type="text/javascript" src="jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://www.google.com/jsapi"></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="jquery.csv-0.71.js"></script>
<!-- Bootstrap -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>


<script>
	google.load("visualization", "1", {
		packages : [ 'corechart' ]
	});
	google.setOnLoadCallback(drawChart);
	function drawChart() {
		// grab the CSV
		$.get("data.csv", function(csvString) {
			// transform the CSV string into a 2-dimensional array
			var arrayData = $.csv.toArrays(csvString, {
				onParseValue : $.csv.hooks.castToScalar
			});
			var data = new google.visualization.arrayToDataTable(arrayData);
			var view1 = new google.visualization.DataView(data);
			view1.setColumns([ 1, 3 ]);
			var options1 = {
				title : "Temperature",
				height : 230,
				width : 500,
				is3D : true,
				lineWidth : 4,
				bars : 'horizontal',
				"refreshInterval" : 5,
				'backgroundColor' : {
					'fill' : 'none'
				},

			};

			var view2 = new google.visualization.DataView(data);
			view2.setColumns([ 1, 4, 5 ]);
			var options2 = {
				title : "BloodPressure",
				height : 230,
				width : 500,
				is3D : true,
				lineWidth : 4,
				bars : 'horizontal',
				"refreshInterval" : 5,
				'backgroundColor' : {
					'fill' : 'none'
				},

			};

			var view3 = new google.visualization.DataView(data);
			view3.setColumns([ 1, 6 ]);
			var options3 = {
				title : "Weight",
				height : 230,
				width : 500,
				is3D : true,
				lineWidth : 4,
				"refreshInterval" : 5,
				bars : 'horizontal',
				'backgroundColor' : {
					'fill' : 'none'
				},

			};

			var chart1 = new google.visualization.LineChart(document
					.getElementById('one'));
			chart1.draw(view1, options1);

			var chart2 = new google.visualization.LineChart(document
					.getElementById('two'));
			chart2.draw(view2, options2);

			var chart3 = new google.visualization.LineChart(document
					.getElementById('three'));
			chart3.draw(view3, options3);

		});
	}
</script>

</head>
<body>


	<div id="video"></div>

	<div id="bar">
		<!--span id="emer" style="float:left;color:white;margin:8px 20px 0px 20px;font-family:sans-serif;opacity:1!important" onmouseover="emeron()" ><b> About ?</b></span-->

		<span
			style="float: left; color: white; margin: 8px 20px 0px 625px; font-family: sans-serif; opacity: 1 !important">
			Insta <span class="glyphicon glyphicon-plus"
			style="color: red; border: 1px ridge blue"></span> Vitals
		</span> <a href="one.jsp" class="formdesc"
			style="text-decoration: none; color: white; float: right; margin: 10px 10px 0px 0px;">Logout!</a>
	</div>

	<div id="one"></div>
	<div id="two"></div>
	<div id="three"></div>




</body>

<style>
body {
	background-image: url('heal4.jpg');
	background-size: 100%;
	height: 100%;
}

#bar {
	color: white;
	width: 100%;
	border: 2px ridge gray;
	background-color: black;
	opacity: 0.9;
	height: 50px;
	position: absolute;
	background-image: url('pattern.png');
}

h4 {
	color: white;
	margin-left: 10px;
}

label {
	color: white;
}

#video {
	width: 100%;
	height: 100%;
	z-index: -1000;
	position: absolute;
}

video {
	position: relative !important;
	width: 100% !important;
	height: auto !important;
}

p {
	margin-top: 10px;
}

#button {
	margin-left: 40px;
}

#btn {
	margin-left: 250px;
	margin-top: 50px;
}

#emer:hover {
	color: red !important;
	cursor: pointer;
}

#one, #two, #three {
	border: 2px solid black;
	width: 500px;
	height: 300px;
	position: absolute;
	background-color: white !important;
}

#one, #two {
	float: left;
}

#three {
	float: right;
	margin-top: 10%;
	margin-left: 60%;
}

#one, #two {
	margin-top: 10%;
}

#one {
	margin-left: 6%;
}

#two {
	margin-top: 40%;
	margin-left: 30%;
}
</style>


</html>
