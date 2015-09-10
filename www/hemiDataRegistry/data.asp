<%  @ LANGUAGE="JScript" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Data Registry - New Dataset</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS for the 'Full Width Pics' Template -->
    <link href="css/full-width-pics.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Lakki+Reddy' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Gloria+Hallelujah' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
</head>
<body text="#000000" bgcolor="#FFFFFF" link="#0000FF" vlink="#4000A0" alink="#FF0000">
    <nav class="navbar navbar-fixed-top navbar-inverse" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="default.asp">Return to Dataset Info</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav">
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container -->
    </nav>
<div class="container">
<center>
 <!-- javascript -->
  <script src="js/jquery.js"></script>
  <script src="js/bootstrap.js"></script>
   <script type="text/javascript" src="js/jquery.tablesorter.min.js"></script>
<script type="text/javascript" charset="utf-8">
$(document).ready(function() {
		$("#sortedtable").tablesorter({ sortlist: [0,0] });
});
</script>    
<h1 class="section-heading" style="color: #5E377F">
Dataset List</h1></center>
<% 
	var taskID;
	var datasetName = new String();
	var datasetDesc = new String();
	var lastUpdated = new String();   //todo: actual date format
	var size 		= new String();
	var fileFormat 	= new String();
	var fileType	= new String();
	var relatedData = new String();
	var email = new String();
	var contactName = new String();

	var msg = "Nothing";
	var cmd;
	if( Request.QueryString.Count > 0 ) {
		taskID = Request.QueryString("taskID");
		datasetName = Request.QueryString("datasetName");
		datasetDesc = Request.QueryString("datasetDesc");
		lastUpdated = Request.QueryString("lastUpdated");
		size 		= Request.QueryString("size");
		fileFormat	= Request.QueryString("fileFormat");
		fileType 	= Request.QueryString("fileType");
		relatedData = Request.QueryString("relatedData");
		email = Request.QueryString("email");
		contactName = Request.QueryString("contactName");
		

	}

 	var oConn   = Server.CreateObject("ADODB.Connection");  	
	var oCmd    = Server.CreateObject("ADODB.Command"); 	
	var strConn = "Provider=SQLOLEDB;User ID=hemiuser;Password=********;"; 	
	strConn	   += "Initial Catalog=Mede;Data Source=thumper";            	
	oConn.Open(strConn); 	
	oCmd.ActiveConnection = oConn; 
	
	
	if( datasetName == "" ) {
		Response.Write( "<h3><font color='#DB7987'>Submission failed: Please enter your dataset name</font></h3>");
	} else if( email == "" ) {
		Response.Write( "<h3><font color='#DB7987'>Submission failed: Please enter your email address.</font></h3>");
	} else if( contactName == "" ) {
		Response.Write( "<h3><font color='#DB7987'>Submission failed: Please enter the contact name for this dataset.</font></h3>");
	
	//} else {
	//	if( type != "app" && type != "veg" && type != "dessert" && type != "meat" && type != "salad" && type != "other") {
	//		Response.Write("<h3><font color='#DB7987'>Submission failed: You forgot to specify the kind of dish ... please select a dish type.</font></h3>");
		
		} else {
		//todo: make this a function
			datasetName = String(datasetName).replace(new RegExp("'","g"),"''");		// replace single quotes
			email = String(email).replace(new RegExp("'","g"),"''");	// replace single quotes
			contactName = String(contactName).replace(new RegExp("'","g"),"''");		// replace single quotes
			datasetDesc = String(datasetDesc).replace(new RegExp("'","g"),"''");
			size = String(size).replace(new RegExp("'","g"),"''");
			fileFormat = String(fileFormat).replace(new RegExp("'","g"),"''");
			fileType = String(fileType).replace(new RegExp("'","g"),"''");
			relatedData = String(relatedData).replace(new RegExp("'","g"),"''");
			
			
			//comment = String(comment).replace(new RegExp("'","g"),"''");	// replace single quotes
			//cmd = "if not exists (select [name] from BabyShowerFood where name=N'"+name+"' and dish=N'"+dish+"') insert BabyShowerFood values('"+name+"','"+dish+"','"+type+"','"+comment+"','"+email+"');";
			//cmd = "if not exists (select name from dataset where name=N'"+datasetName+"') insert dataset values (selec
			//cmd = "declare @maxid int;declare @name varchar(100), @ContactName varchar(100), @contactEmail varchar(100);"
			//cmd += "set @name=N'"+datasetName+"';set @contactEmail=N'"+email+"';set @contactName=N'"+contactName+"';select @maxID=max(datasetID) from dataset;";
			//cmd += "if not exists (select name from dataset where name=@name) insert dataset(DatasetID, Name, ContactName, ContactEmail) select @maxid+1, @name, @ContactName, @contactEmail;";

			/*
			create procedure spInsertDataset (
				@taskID int,
				@name varchar(100),
				@description varchar(1000),
				@slastUpdate varchar(30),
				@size varchar(50),
				@fileFormat varchar(100),
				@fileType varchar(100),
				@relatedData varchar(1000),
				@contactName varchar(100),
				@contactEmail varchar(100)
				)
			*/
			//TODO: make taskID work, using taskID=1 for now
			cmd = "exec spInsertDataset 1, '"+datasetName+"', '"+datasetDesc+"', '"+lastUpdated+"', '"+size+"', '"+fileFormat+"', '"+fileType;
			cmd += "' ,'"+ relatedData+"', '"+contactName+"', '"+email+"';";
			
			//Response.Write("<h3>"+cmd+"</h3>");
			
			oCmd.CommandText = cmd;
		 	var oRs = oCmd.Execute();
			Response.Write("<h3>Thank you!  Your submission has been recorded.<br>");
		
	}
	//Response.Write("<h4>On the day of the party, you may heat or refrigerate your dish in the 3rd floor lounge.<br>");
	//Response.Write("It is best your the dish is fully cooked and in a disposable container.</h4>" );

%>	
<h3 class="section-paragraph">List of Datasets So Far:</h3>
<p style="text-align:center; margin-top:-25px";>(Click column header to sort)</p>
    
<%
	cmd = "select datasetID, name, description, LastUpdate, Size, FileFormat, FileType, RelatedData, ContactName, ContactEmail ";
	cmd    += "from dataset order by datasetID";
	oCmd.CommandText = cmd;
 	var iRs = oCmd.Execute();
	if( !iRs.eof ) {
		Response.Write("<table id='sortedtable' class='table table-striped table-responsive'>\n");
	//Response.Write("<thead><tr align=center><th><i>#</i></th>");
	Response.Write("<thead><tr align=center>");
	for( Index=0; Index <(iRs.fields.count); Index++ ) {
		Response.Write("<th><i>");
		Response.Write(iRs.fields(Index).name);
		if( iRs.fields(Index).name == "email" )
			Response.Write( "/ext" );
		Response.Write("</i></th>");
	}
	Response.Write("</tr></thead>\n");
	var count = 1;
	while( !iRs.eof ) {
		Response.Write("<tr align=left>");
		Response.Write("<td>"+count+"</td>");
		for( Index=0; Index <(iRs.fields.count); Index++ ) {
			var res = iRs.fields(Index);
			
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

    </div>
    <!-- FOOTER -->
    <div class="container">
      <footer>
        <div class="row">
          <div class="col-lg-12">
            Questions? Let <a href="mailto:mzuberi2@jhu.edu">us know!</a>
          </div>
        </div>
      </footer>
    </div>

    </div><!-- /container -->
</body>
</html>
