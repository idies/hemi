<%  @ LANGUAGE="JScript" %>
<% 	
 	var oConn   = Server.CreateObject("ADODB.Connection");  	
	var oCmd    = Server.CreateObject("ADODB.Command"); 	
	var strConn = "Provider=SQLOLEDB;User ID=test;Password=riuzg54;"; 	
	strConn	   += "Initial Catalog=thakar";Data Source=sdssad6;";           	
	oConn.Open(strConn); 	
	oCmd.ActiveConnection = oConn; 
	var name = new String();
	var dish = new String();
	var type = new String();
	if( Request.QueryString.Count > 0 ) {
		name = Request.QueryString("name");
		dish = Request.QueryString("dish");
		type = Request.QueryString("type");
	}
	Response.Write("<h1>Food Signup for the PHA Holiday Party 2012</h1>");
	if( type != "vegan" && type != "veg" && type != "dessert" ) {
		Response.Write("<h3>You forgot to specify the kind of dish ... please use your browser's");
		Response.Write("back key to go back and select the dish type.  Thank you.</h3>");
	} else {
		Response.Write("<h3>Thank you!  Your submission has been recorded:");
		Response.Write("<dd>Name = "+name+", dish = "+dish+", type = "+type+"</h3>" );
	}
%>
