<%@page import="java.sql.Connection"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.*"%>
<%@ page import="com.mysql.jdbc.StringUtils"%>
<%@ page import="java.net.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<script src="https://www.google.com/jsapi"></script>
<script src="jquery.min.js"></script>
<script src="jquery.csv-0.71.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<title>Patient's Information</title>


</head>

<body>
	<div id="bar">
		<!--span id="emer" style="float:left;color:white;margin:8px 20px 0px 20px;font-family:sans-serif;opacity:1!important" onmouseover="emeron()" ><b> About ?</b></span-->

		<span
			style="float: left; color: white; margin: 8px 20px 0px 625px; font-family: sans-serif; opacity: 1 !important">
			Insta <span class="glyphicon glyphicon-plus"
			style="color: red; border: 1px ridge blue"></span> Vitals

		</span> <a href="one.jsp" class="formdesc"
			style="text-decoration: none; color: white; float: right; margin: 10px 10px 0px 0px;">Logout</a>

	</div>
	<div id="video">
		<video autoplay loop>
			<source src="4.mp4" type="video/mp4" />
		</video>
	</div>
	<h2 style="color: white; margin-left: 50px;">Information retrieved
		!</h2>
	<div id="main">

		<%
			try {

				String query = "Select * from VitalRecord where patientId=" + "'"
						+ request.getParameter("PatientID")
						+ "' order by visitDate desc LIMIT 1";
				String queryv = "Select count(*) from VitalRecord where patientId="
						+ "'" + request.getParameter("PatientID") + "'";
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/kafka_data", "root",
						"nova");
				PreparedStatement ps = con.prepareStatement(query);
				ResultSet rs = ps.executeQuery();
				PreparedStatement psv = con.prepareStatement(queryv);
				ResultSet rsv = psv.executeQuery();

				if (!rsv.wasNull()) {
					while (rsv.next()) {
						try {
		%><button class="btn btn-primary" type="button"
			style="width: 100%; border-radius: 0px !important">
			Total Number of Visits Made <span class="badge">
				<%
					out.println((rsv.getObject(1)));
				%>
			</span>
		</button>

		<%
			} catch (Exception e) {
							out.println(e);
						}
					}
				}
		%>

		<table class="table table-hover">
			<form action="visuals.jsp">


				<%
					if (!rs.wasNull()) {

							while (rs.next())

							{
								String[] table = {
										"<tr><th><i>PatientID</i></th>",
										"<tr><th><i>Recently Visited On</i></th>",
										"<tr><th><i>Name</i></th>",
										"<tr><th><i>Body Temperature recorded</i></th>",
										"<tr><th><i>BP/Systolic</i></th>",
										"<tr><th><i>BP/Diastolic</i></th>",
										"<tr><th><i>Weight</i></th>" };

								for (int i = 1; i <= 7; i++) {
									out.println(table[i - 1]);
									if (i < 4) {
										out.println("<th name=param" + i + ">"
												+ rs.getObject(i) + "</th>");
									} else {
										//out.println("<th>"+rs.getObject(i)+"</th><th><button class='btn btn-primary' onclick='pbtn"+i+"();reload()'>Visualize</button></th></tr>");
										out.println("<th>" + rs.getObject(i) + "</th>");
									}
								}
							}
						}

						else
							out.println("No Data exists for the entered user id.");
					}

					catch (Exception e) {
						out.println(e);
					}
				%>
			
		</table>
		<button class="btn btn-success "
			style="margin-left: 100px; width: 100px;">Analyze</button>

		<a href="test.jsp" class="btn btn-danger" id="btn1">Go Back !</a>
		</form>

	</div>

	<%
		try {

			String query1 = "Select * from VitalRecord where patientId="
					+ "'" + request.getParameter("PatientID")
					+ "' order by visitDate desc";

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/kafka_data", "root","nova");

			PreparedStatement ps1 = con.prepareStatement(query1);
			ResultSet rs1 = ps1.executeQuery();

			File file = new File("/opt/apache-tomcat-7.0.61/webapps/Instavitals/data.csv");

			if (file.exists()) {
				file.delete();

			}

			file.createNewFile();

			FileWriter writer1 = new FileWriter(file);

			BufferedWriter writer = new BufferedWriter(writer1);

			if (!rs1.wasNull()) {
				String data = "";

				writer.append("patientId");
				writer.append(',');
				writer.append("visitDate");
				writer.append(',');
				writer.append("patientName");
				writer.append(',');
				writer.append("temperature");
				writer.append(',');
				writer.append("BP/Systolic");
				writer.append(',');
				writer.append("BP/Diastolic");
				writer.append(",");
				writer.append("Weight");
				writer.append("\r\n");

				while (rs1.next())

				{

					for (int i = 1; i <= 7; i++) {
						if (i != 7)
							writer.append(rs1.getObject(i) + ",");

						else
							writer.append((String) rs1.getObject(i));
					}

					writer.append("\r\n");

				}

				writer.flush();
				writer.close();

			}

		}

		catch (Exception e) {
			out.println(e);
		}
	%>


</body>

<style>
body {
	height: 100%;
	width: 100%;
	background-opacity: 0.7;
}

#video {
	z-index: -100;
	position: fixed;
	height: 150%;
}

video {
	height: 100%;
}

#main {
	float: left;
	border: 2px groove white;
	height: 60%;
	width: 600px;
	margin-top: 50px;
	margin-left: 28%;
	background: rgba(0, 0, 0, 0.5);
	background-image: url('pattern.png');
}

table {
	width: 100%;
	height: 91%;
	text-align: left;
	border-radius: 1000px;
	color: white;
}

table, th, tr {
	border: 2px groove white;
}

tr:hover {
	color: black;
}

iframe {
	float: right;
	margin-right: 100px;
	height: 50%;
	width: 40%;
	margin-top: 100px;
	overflow: hidden;
	padding-left: 40px;
	display: none;
}

.btn {
	display: inline;
	float: right;
}

#btn1 {
	float: left !important;
}

#bar {
	color: white;
	width: 100%;
	border: 2px ridge gray;
	background-color: black;
	opacity: 0.9;
	height: 50px;
	position: relative;
	background-image: url('pattern.png');
}
</style>




</html>