	<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<%  @ LANGUAGE="JScript" %>
<% 
	

    var name = new String();
	var dish = new String();
	var type = new String();
	var comment = new String();
	var meta = new String();

	
	var msg = "Nothing";
	if( Request.QueryString.Count > 0 ) {
		name = Request.QueryString("name");
		dish = Request.QueryString("dish");
		type = Request.QueryString("type");
		comment = Request.QueryString("comment");
	}
	//alert("hi");
 	var oConn   = Server.CreateObject("ADODB.Connection");  	
	var oCmd    = Server.CreateObject("ADODB.Command"); 	
	var strConn = "Provider=SQLOLEDB;User ID=hemiuser;Password=hemi1977;"; 	
	strConn	   += "Initial Catalog=Mede;Data Source=thumper";           	
	oConn.Open(strConn); 	
	oCmd.ActiveConnection = oConn; 
	var cmd = "select name, description, LastUpdate, Size, FileFormat, FileType, RelatedData, ContactName, ContactEmail ";
	cmd    += "from dataset order by datasetID";
	
	oCmd.CommandText = cmd;
 	var oRs = oCmd.Execute();
	
	cmd = "select taskName from Task order by taskID desc";
	oCmd.CommandText = cmd;
	var oTaskRs = oCmd.Execute();
	
	
	
	while (!oTaskRs.EOF) {
		//Response.Write(oTaskRs.Fields.Count);
		for (var i=0;i<oTaskRs.Fields.Count; i++) {
			Response.Write(oTaskRs.Fields(i));
			Response.Write("<br>");
		}
		oTaskRs.MoveNext;
	
	}
	
	



%>

 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Data Registry</title>

    <!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

    <link href="css/bootstrap.css" rel="stylesheet">
	
	<!-- Include Bootstrap Datepicker -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />

<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>


    <!-- Custom CSS for the 'Full Width Pics' Template -->
    <link href="css/full-width-pics.css" rel="stylesheet">
   
     <!-- Custom CSS Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Gloria+Hallelujah' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
    

          <!--[if lt IE 10]><h3>You are using an outdated version of Internet Explorer. For security reasons you should upgrade your browser. Please go to Windows Updates and install the latest version. Or <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">click here</a> to install IE11.</h3><![endif]-->

    

    
</head>

<body>
      <div class="container">
        <div class="row">
          <div class="col-lg-12 section">
            <h1 class="section-heading" style="color:#5E377F">HEMI DATA REGISTRY</h1>
            <h3 class="section-paragraph">Please enter the information for your data here.

				<h2 class="section-paragraph">Data Registry:</h2>
				<p class="section-paragraph">Fill out the form <a href="#signup"><strong>below</strong></a> with your dataset information and press Submit when done.</p>
				<p class="text-center">
				<span class="fa fa-files-o" style="font-size:56px; color: #E6E27F;"></span> 
				<!--<span class="glyphicon glyphicon-baby-formula" style="font-size:56px; color: #81C36C;"></span> -->
				<i class="fa fa-code-fork" style="font-size:56px; color: #E6E27F;"></i>
				</p>
              </div>
          </div>
      </div>
    </div>

  <!--  <div class="full-width-image-2"> -->
      <!-- box content goes here if you want to put text or a button in here -->
  <!--  </div><!-- /full-width-image-2 -->

    
      <div class="container">
        <div class="row">
          <div class="col-lg-12 section">
            <h1 class="section-heading" id="signup">Register your dataset!</h1>
            <p class="lead section-lead">
		<form class="form-horizontal" role="form" method="GET" action="data.asp">
		<div class "form-group">
		<div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">Select a task:
  <span class="caret"></span></button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
  <%
  cmd = "select taskName from Task order by taskID desc";
	oCmd.CommandText = cmd;
	var oTaskRs = oCmd.Execute();
	
	
	
	while (!oTaskRs.EOF) {
		//Response.Write(oTaskRs.Fields.Count);
		for (var i=0;i<oTaskRs.Fields.Count; i++) {
			Response.Write("<li role=presentation><a role=menuitem href=#>"+oTaskRs.Fields(i)+"</a></li>");
			//Response.Write("<br>");
		}
		oTaskRs.MoveNext;
	
	}
	%>
	
  </ul>
</div>
</div>
   
  <div class="form-group">
    <label for="inputDatasetName" class="col-sm-2 control-label">Dataset Name</label>
    <div class="col-sm-10">
      <input type="datasetName" name="datasetName" class="form-control" id="inputDataset" placeholder="PADB4C_Tile8_Teube13_SEM-IMGS_Fractography">
    </div>
  </div>
  
    <div class="form-group">
    <label for="inputDatasetDesc" class="col-sm-2 control-label">Dataset Description</label>
    <div class="col-sm-10">
      <input type="datasetDesc" name="datasetDesc" class="form-control" id="inputDatasetDesc" placeholder="SEM micrographs showing fracture surfaces of the basline boron carbide material">
    </div>
  </div>
  <!--  TODO make a date picker  
      <div class="form-group">
        <label class="col-xs-3 control-label">Date Last Updated</label>
        <div class="col-xs-5 date">
            <div class="input-group input-append date" id="datePicker">
                <input type="text" class="form-control" name="date" />
                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
            </div>
        </div>
    </div>
-->
	   <div class="form-group">
    <label for="inputLastUpdated" class="col-sm-2 control-label">Date Last Updated (YYYY-MM-DD)</label>
    <div class="col-sm-10">
      <input type="lastUpdated" name="lastUpdated" class="form-control" id="inputLastUpdated" placeholder="2015-06-16">
    </div>
  </div>
  
    <div class="form-group">
    <label for="inputSize" class="col-sm-2 control-label">Dataset Size</label>
    <div class="col-sm-10">
      <input type="size" name="size" class="form-control" id="inputSize" placeholder="< 10 GB">
    </div>
  </div>
  
   <div class="form-group">
    <label for="inputFileFormat" class="col-sm-2 control-label">File Format(s)</label>
    <div class="col-sm-10">
      <input type="FileFormat" name="fileFormat" class="form-control" id="inputFileFormat" placeholder=".tiff, .xml, .zip">
    </div>
  </div>
  
    <div class="form-group">
    <label for="inputFileType" class="col-sm-2 control-label">File Type(s)</label>
    <div class="col-sm-10">
      <input type="FileType" name="FileType" class="form-control" id="inputFileType" placeholder="Image & Dataset">
    </div>
  </div>
  
     <div class="form-group">
    <label for="inputRelatedData" class="col-sm-2 control-label">Related Data</label>
    <div class="col-sm-10">
      <input type="RelatedData" name="RelatedData" class="form-control" id="inputRelatedData" placeholder="Experimental database (dynamic compression tests">
    </div>
  </div>
  
  
    <div class="form-group">
    <label for="inputEmail" class="col-sm-2 control-label">Contact Email</label>
    <div class="col-sm-10">
      <input type="email" name="email" class="form-control" id="inputEmail" placeholder="hemi@jhu.edu">
    </div>
  </div>
   <div class="form-group">
    <label for="inputContactName" class="col-sm-2 control-label">Contact Name</label>
    <div class="col-sm-10">
      <input type="contactName" name="contactName" class="form-control" id="inputContactName" placeholder="Herman Jablonsky">
    </div>
  </div>
  <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
    <div class="pull-left">
      <button type="submit" class="btn btn-info">Submit</button>
    </div>
	<div class="pull-right">
      <button type="reset" class="btn btn-danger">Reset</button>
    </div>
  </div>
      </div>
</form>
  
  
  <!--<div class="full-width-image-2"> -->
      <!-- box content goes here if you want to put text or a button in here -->
   <!-- </div><!-- /full-width-image-2 -->
  <!-- 
      <div class="container">
        <div class="row">
          <div class="col-lg-12 section">
            <h1 class="section-heading" id="signup">Sign up Today!</h1>
            <p class="lead section-lead">
		<form class="form-horizontal" role="form" method="GET" action="food.asp">
  <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label">Name</label>
    <div class="col-sm-10">
      <input type="name" name="name" class="form-control" id="inputName" placeholder="The Stork">
    </div>
  </div>
    <div class="form-group">
    <label for="inputEmail" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
      <input type="email" name="email" class="form-control" id="inputEmail" placeholder="precious@cargo.com">
    </div>
  </div>
   <div class="form-group">
    <label for="inputDish" class="col-sm-2 control-label">Dish</label>
    <div class="col-sm-10">
      <input type="dish" name="dish" class="form-control" id="inputDish" placeholder="Sweet Peas">
    </div>
  </div>
  <div class="form-group">
     <div class="col-sm-2 control-label">
  <p><strong>What type of dish you will be bringing?</strong></p>
         </div>
       <div class="col-sm-10">
<div class="radio-inline">
  <label>
    <input type="radio" name="type" value="app"> Appetizer
  </label>
</div>
<div class="radio-inline">
  <label>
    <input type="radio" name="type" value="salad"> Salad
  </label>
</div>
<div class="radio-inline">
  <label>
    <input type="radio" name="type" value="veg"> Vegan/Veg Entree
  </label>
</div>
<div class="radio-inline">
  <label>
    <input type="radio" name="type" value="meat"> Meat Entree
  </label>
</div>
<div class="radio-inline">
  <label>
    <input type="radio" name="type" value="dessert">Dessert 
  </label>
</div>
<div class="radio-inline">
  <label>
    <input type="radio" name="type" value="other"> Other 
  </label>
</div>
          </div>
      </div>
            <div class="form-group">
       <div class="col-sm-offset-2 col-sm-10">
      <textarea name="comment" class="form-control" rows="3" placeholder="Leave a comment!"></textarea>
           </div>
    </div>
  <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
    <div class="pull-left">
      <button type="submit" class="btn btn-info">Submit</button>
    </div>
	<div class="pull-right">
      <button type="reset" class="btn btn-danger">Reset</button>
    </div>
  </div>
      </div>
</form>
--!>
<div class="clearfix"></div>
</p>
<h3 class="section-paragraph">Instructions</h3>
<h3 class="section-paragraph">List of Data So far:</h3>
<p style="text-align:center; margin-top:-25px";>(Click column header to sort)</p>
   <!-- javascript -->
  <script src="js/jquery.js"></script>
  <script src="js/bootstrap.js"></script>
   <script type="text/javascript" src="js/jquery.tablesorter.min.js"></script>
<script type="text/javascript" charset="utf-8">
$(document).ready(function() {
		$("#sortedtable").tablesorter({ sortlist: [0,0] });
});
</script>        
<%

if( oRs.eof )
   Response.Write("<h3>No entries so far.</h3>");
 else { 

	//Response.Write( ".</b><p>" );
	Response.Write("<p>");
	cmd = "select name, description, LastUpdate, Size, FileFormat, FileType, RelatedData, ContactName, ContactEmail ";
	cmd    += "from dataset order by datasetID";
	oCmd.CommandText = cmd;
	oRs = oCmd.Execute();
	Response.Write("<table id='sortedtable' class='table table-striped table-responsive'>\n");
	Response.Write("<thead><tr align=center><th><i>#</i></th>");
	for( Index=0; Index <(oRs.fields.count); Index++ ) {
		Response.Write("<th><i>");
		Response.Write(oRs.fields(Index).name);
		if( oRs.fields(Index).name == "email" )
			Response.Write( "/ext" );
		Response.Write("</i></th>");
	}
	Response.Write("</tr></thead>\n");

	

	var count = 1;
	
	while( !oRs.eof ) {
		Response.Write("<tr align=left>");
		Response.Write("<td>"+count+"</td>");
		for( Index=0; Index <(oRs.fields.count); Index++ ) {
			var res = oRs.fields(Index);
			
			Response.Write("<td>" +res+"</td>");
		}
		Response.Write("</tr>\n");
		count++;
		oRs.MoveNext(); 	
	}
	
	Response.Write("</table>");
}

%>

</div>
      </div>
    </div>

<hr>
<!-- FOOTER -->
    <div class="container">
      <footer>
        <div class="row">
          <div class="col-lg-12">
            Questions? Let <a href="mailto:bsouter@jhu.edu">us know!</a>
          </div>
        </div>
      </footer>
    </div>

    </div><!-- /container -->

 

  </body>



</html>
