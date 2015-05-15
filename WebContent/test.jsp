<%@page import="com.mysql.jdbc.*"%>
<%@ page import="com.mysql.jdbc.StringUtils" %>
<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<div id="bar" > <!-- span id="emer" style="float:left;color:white;margin:8px 20px 0px 20px;font-family:sans-serif;opacity:1!important" onmouseover="emeron()" ><b> About ?</b></span-->

   <span style="float:left;color:white;margin:8px 20px 0px 625px;font-family:sans-serif;opacity:1!important" > Insta

<span class="glyphicon glyphicon-plus" style="color:red;border:1px ridge blue" ></span>
  Vitals

   </span>

    
<a href="one.jsp" class="formdesc" style="text-decoration:none;color:white;float:right;margin:10px 10px 0px 0px;">Logout</a>

   </div> 

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
 <title>Instavitals</title>
</head>

<body>
 
 <div id="main">
 <form action="check.jsp">
 
 <label>Enter Patient ID:</label>
 <input type="text" class="form-control" name="PatientID">
 <button class="btn btn-success" >SUBMIT</button> 
 
 </form>
 
 </div>
</body>

<style>

body{

background-image:url('heal2.jpg');
background-size:100%;
height:100%;
width: 100%;
position: fixed;

}

#main{

margin:200px 0px 60px 600px;
 
}

.form-control{
	
	width:300px;

}

label{
color: white;
}

.btn{

margin:50px 0px 0px 90px;
}

#bar{
                color: white;
                width: 100%;
                border: 2px ridge gray;
                background-color:black;
                opacity:0.9; 
                height: 50px;
                position: relative;
                background-image: url('pattern.png');
            }

</style>





</html>