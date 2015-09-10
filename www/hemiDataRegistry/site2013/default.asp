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
	var cmd = "select count(*) as num, type from phafood group by type order by num desc";
	oCmd.CommandText = cmd;
 	var oRs = oCmd.Execute();

%>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Ho Ho PHA Holiday Party 2013</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS for the 'Full Width Pics' Template -->
    <link href="css/full-width-pics.css" rel="stylesheet">
   
     <!-- Custom CSS Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Spicy+Rice' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
    
          <!--[if lt IE 10]><h3>You are using an outdated version of Internet Explorer. For security reasons you should upgrade your browser. Please go to Windows Updates and install the latest version. Or <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">click here</a> to install IE11.</h3><![endif]-->

    
</head>

<body>

<nav class="navbar navbar-fixed-top navbar-inverse" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="default.asp">Annual PHA Holiday Party</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav">
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container -->
    </nav>
<div class="full-width-image-1"></div><!-- /full-width-image-1 -->

      <div class="container">
        <div class="row">
          <div class="col-lg-12 section">
            <h1 class="section-heading" style="color:#085F00">Ho! Ho! Ho!</h1>
            <h3 class="section-paragraph">The Annual PHA Holiday Party 2013 is just around the corner, Friday Dec 13th!</h3>
            <h3 class="lead section-lead">We are a pretty jolly bunch and would love to see you all there with your favorite dish. So please fill out the form below and press Submit when done. And to spice up the list, be creative about your comments!</h3>
              <div class="row">
              <div class="col-md-2 col-md-offset-3"><center><span class="glyphicon glyphicon-tree-conifer" style="font-size:56px; color: #085F00;"></span></center></div> 
                  <div class="col-md-2"><center><span class="glyphicon glyphicon-bell" style="font-size:56px; color: #d9534f;"></span></center></div>
                      <div class="col-md-2"><center><span class="glyphicon glyphicon-tree-conifer" style="font-size:56px; color: #085F00;"></span></center></div>
              </div>
          </div>
      </div>
    </div>
    
    <div class="full-width-image-2">
      <!-- box content goes here if you want to put text or a button in here -->
    </div><!-- /full-width-image-2 -->
    
      <div class="container">
        <div class="row">
          <div class="col-lg-12 section">
            <h1 class="section-heading">Sign up Today!</h1>
            <p class="lead section-lead">
		<form class="form-horizontal" role="form" method="GET" action="food.asp">
  <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label">Name</label>
    <div class="col-sm-10">
      <input type="name" name="name" class="form-control" id="inputName" placeholder="Santa Claus">
    </div>
  </div>
    <div class="form-group">
    <label for="inputEmail" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
      <input type="email" name="email" class="form-control" id="inputEmail" placeholder="hohoho@santa.com">
    </div>
  </div>
   <div class="form-group">
    <label for="inputDish" class="col-sm-2 control-label">Dish</label>
    <div class="col-sm-10">
      <input type="dish" name="dish" class="form-control" id="inputDish" placeholder="Rudolph's Red Nose">
    </div>
  </div>
  <div class="form-group">
     <div class="col-sm-2 control-label">
  <p><strong>Please select the type of dish you will be bringing:</strong></p>
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
      <button type="submit" class="btn btn-danger">Submit</button>
    </div>
	<div class="pull-right">
      <button type="reset" class="btn btn-danger">Reset</button>
    </div>
  </div>
      </div>
</form>
<div class="clearfix"></div>
</p>
<h3 class="section-paragraph">On the day of the party, please bring your dish to the 2nd floor kitchen, along with any heating, cooling or serving instructions (but it is best if the dish is fully cooked and in a disposable container).</h3>
<h3 class="section-paragraph">List of Dishes So far:</h3>
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
	cmd = "select * from phafood";
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

</div>
      </div>
    </div>

<hr>
<!-- FOOTER -->
    <div class="container">
      <footer>
        <div class="row">
          <div class="col-lg-12">
            Questions? Let <a href="mailto:thakar@jhu.edu">us know!</a>
          </div>
        </div>
      </footer>
    </div>

    </div><!-- /container -->

 

  </body>

</html>
