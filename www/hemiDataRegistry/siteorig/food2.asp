<%  @ LANGUAGE="JScript" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
   <meta name="GENERATOR" content="Mozilla/4.72 [en] (X11; I; OSF1 V4.0 alpha) [Netscape]">
   <title>Food Sign-Up for PHA Holiday Party 2008 </title>
</head>
<body text="#000000" bgcolor="#FFFFFF" link="#0000FF" vlink="#4000A0" alink="#FF0000">

<center>
<h1><FONT COLOR="#7700EE">
Food Sign-Up for PHA Holiday Party 2008</FONT></h1></center>
<% 
	var name = new String();
	var email = new String();
	var dish = new String();
	var type = new String();
	var comment = new String();
	var msg = "Nothing";
	var cmd;
	if( Request.QueryString.Count > 0 ) {
		name = Request.QueryString("name");
		email = Request.QueryString("email");
		dish = Request.QueryString("dish");
		type = Request.QueryString("type");
		comment = Request.QueryString("comment");
	}

 	var oConn   = Server.CreateObject("ADODB.Connection");  	
	var oCmd    = Server.CreateObject("ADODB.Command"); 	
	var strConn = "Provider=SQLOLEDB;User ID=test;Password=riuzg54;"; 	
	strConn	   += "Initial Catalog=thakar;Data Source=sdssad6;";           	
	oConn.Open(strConn); 	
	oCmd.ActiveConnection = oConn; 
	
	if( name == "" ) {
		Response.Write( "<h3><font color='#ff0000'>Submission failed: Please enter your name.</font></h3>");
	} else if( email == "" ) {
		Response.Write( "<h3><font color='#ff0000'>Submission failed: Please enter your email address or PHA phone extension.</font></h3>");
	} else if( dish == "" ) {
		Response.Write( "<h3><font color='#ff0000'>Submission failed: Please enter the name of the dish you are bringing.</font></h3>");
	} else {
		if( type != "app" && type != "veg" && type != "dessert" && type != "meat" && type != "salad") {
			Response.Write("<h3><font color='#ff0000'>Submission failed: You forgot to specify the kind of dish ... please select a dish type.</font></h3>");
		} else {
			name = String(name).replace(new RegExp("'","g"),"''");		// replace single quotes
			email = String(email).replace(new RegExp("'","g"),"''");	// replace single quotes
			dish = String(dish).replace(new RegExp("'","g"),"''");		// replace single quotes
			comment = String(comment).replace(new RegExp("'","g"),"''");	// replace single quotes
			cmd = "insert phafood values('"+name+"','"+dish+"','"+type+"','"+comment+"','"+email+"');";
			oCmd.CommandText = cmd;
		 	var oRs = oCmd.Execute();
			Response.Write("<h3>Thank you!  Your submission has been recorded.<br>");
		}
	}
	Response.Write("<h4>On the day of the party, please bring your dish to the 2nd floor kitchen, along");
	Response.Write(" with any heating, cooling or serving instructions (but it is best if the dish is fully");
	Response.Write(" cooked and in a disposable container).</h4>" );

%>	
<h2>List of dishes so far:</h2>
<%
	cmd = "select * from phafood";
	oCmd.CommandText = cmd;
 	var iRs = oCmd.Execute();
	if( !iRs.eof ) {
		Response.Write("<table border='0' cellpadding='5' BGCOLOR=cornsilk>\n");
	Response.Write("<tr align=center><td><i>#</i></td>");
	for( Index=0; Index <(iRs.fields.count); Index++ ) {
		Response.Write("<td><i>");
		Response.Write(iRs.fields(Index).name);
		if( iRs.fields(Index).name == "email" )
			Response.Write( "/ext" );
		Response.Write("</i></td>");
	}
	Response.Write("</tr>\n");
	var count = 1;
	while( !iRs.eof ) {
		Response.Write("<tr align=center BGCOLOR=#eeeeff>");
		Response.Write("<td>"+count+"</td>");
		for( Index=0; Index <(iRs.fields.count); Index++ ) {
			var res = iRs.fields(Index);
			if( Index == 2 ) {
				if( res == "app" )
					res = "Appetizer";
				else if( res == "veg" )
					res = "Veg/Vegan Entree";
				else if( res == "dessert" )
					res = "Dessert";
				else if( res == "meat" )
					res = "Meat Entree";
				else if( res == "salad" )
					res = "Salad";
				else
					res = "Other";
			}
			Response.Write("<td>" +res+"</td>");
		}
		Response.Write("</tr>\n");
		count++;
		iRs.MoveNext(); 	
		}
		Response.Write( "</table>" );
	} else
		Response.Write("<h3><font color='#ff0000'>No entries so far.</font></h3>");
%>
</form>
</body>
</html>
