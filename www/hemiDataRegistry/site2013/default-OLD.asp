<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<%  @ LANGUAGE="JScript" %>
<% 
	var name = new String();
	var dish = new String();
	var type = new String();
	var comment = new String();
	var msg = "Nothing";
	if( Request.QueryString.Count > 0 ) {
		name = Request.QueryString("name");
		dish = Request.QueryString("dish");
		type = Request.QueryString("type");
		comment = Request.QueryString("comment");
	}

 	var oConn   = Server.CreateObject("ADODB.Connection");  	
	var oCmd    = Server.CreateObject("ADODB.Command"); 	
	var strConn = "Provider=SQLOLEDB;User ID=test;Password=riuzg54;"; 	
	strConn	   += "Initial Catalog=thakar;Data Source=sdssdb002.pha.jhu.edu;";           	
	oConn.Open(strConn); 	
	oCmd.ActiveConnection = oConn; 
	var cmd = "select count(*) as num, type from potluck group by type order by num desc";
	oCmd.CommandText = cmd;
 	var oRs = oCmd.Execute();

%>

</head>
<body text="#000000" bgcolor="#FFFFFF" link="#0000FF" vlink="#4000A0" alink="#FF0000">

<center>
<h1><FONT COLOR="#7700EE">Food Sign-Up for PHA Holiday Party 2012</FONT></h1>
</center>

<form method="GET" action="food.asp">
<hr>
<table>
  <tr>
    <td><img src="santa3.gif" width='80' align='middle'></td>
    <td><h3>The Ho! Ho! Holiday Party 2012 is just around the corner (Friday Dec 14)!
       We are a pretty jolly bunch, but be warned that you will be shunned by one and all if you don't bring some food to share.
       So please fill out the form below and press Submit when done. And to spice up the list, be creative about your comments! </h3> </td>
    <td><img src="santawink.gif" align='middle'></td>
  </tr>
</table>
<P>
<TABLE width='500'>
<TR>
    <TD>Name: <TD><input type="text" name="name" size=22 maxlength=60></TD>
    <TD>Email/Ext: <TD><input type="text" name="email" size=22 maxlength=60></TD>
    <TD>Dish: <TD><input type="text" name="dish" size=21 maxlength=50></TD>
</TR>
    <TD colspan=6>Please select the type of dish you will be bringing:<br>
</TR>
<TR> 
		<TD colspan=6><input type="radio" name="type" value="app">Appetizer
			<input type="radio" name="type" value="salad">Salad 
			<input type="radio" name="type" value="veg">Vegan/Veg Entree
			<input type="radio" name="type" value="meat">Meat Entree
			<input type="radio" name="type" value="dessert">Dessert 
			<input type="radio" name="type" value="other">Other 
		</TD>
</TR>
<TR>
   <TD>Comment:</TD>
</TR>
<TR>
	<TD colspan=6><textarea name="comment" maxlength=256 rows=3 cols=80></textarea></TD>
</TD>
<TR>
	<TD colspan=3><input type="submit" value=" Submit "></TD>
	<TD colspan=3 width="10%" align=right>
		<input TYPE="reset" VALUE="Reset " id="reset" name="reset" color="#00FFFF" 		onmouseover="return escape('Press this button to clear the page.');">
	</TD>
</TR>
</TABLE>
<p>
<h4>On the day of the party, please bring your dish to the 2nd floor kitchen, along
with any heating, cooling or serving instructions (but it is best if the dish is 
fully cooked and in a disposable container).</h4>

<h2>List of dishes so far:</h2>
<%
if( oRs.eof )
   Response.Write("<h3><font color='#ff0000'>No entries so far.</font></h3>");
else {
	Response.Write( "<b>There are " );
	while( !oRs.eof ) {
		Response.Write( oRs.fields(0)+" "+oRs.fields(1) );
		if( oRs.fields(1) == "app" ) Response.Write( "etizer" );
		Response.Write( " dishes" );
		oRs.MoveNext();
		if( !oRs.eof )
			Response.Write( ", " );
	}
	Response.Write( ".</b><p>" );
	cmd = "select * from potluck";
	oCmd.CommandText = cmd;
 	oRs = oCmd.Execute();
	Response.Write("<table border='0' cellpadding='5' BGCOLOR=cornsilk>\n");
	Response.Write("<tr align=center><td><i>#</i></td>");
	for( Index=0; Index <(oRs.fields.count); Index++ ) {
		Response.Write("<td><i>");
		Response.Write(oRs.fields(Index).name);
		if( oRs.fields(Index).name == "email" )
			Response.Write( "/ext" );
		Response.Write("</i></td>");
	}
	Response.Write("</tr>\n");
	var count = 1;
	while( !oRs.eof ) {
		Response.Write("<tr align=center BGCOLOR=#eeeeff>");
		Response.Write("<td>"+count+"</td>");
		for( Index=0; Index <(oRs.fields.count); Index++ ) {
			var res = oRs.fields(Index);
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
		oRs.MoveNext(); 	
	}
	Response.Write("</table>");
}
%>
</form>

<hr>
<p class='small'>Problems with this page?  Please <a href="mailto:thakar@jhu.edu">click here for help</a>.
</body>
</html>
