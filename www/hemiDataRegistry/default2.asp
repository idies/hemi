	<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<%  @ LANGUAGE="JScript" %>

    
</head>

<body>
      <div class="container">
        <div class="row">
          <div class="col-lg-12 section">
            <h1 class="section-heading" style="color:#5E377F">HEMI DATA REGISTRY</h1>
            <h3 class="section-paragraph">Please enter the information for your data here.

				<h2 class="section-paragraph">Data Registry:</h2>
				<p class="section-paragraph">Fill out the form <a href="#signup"><strong>below</strong></a> with your food contribution and press Submit when done.</p>
				<p class="text-center">
				<span class="fa fa-files-o" style="font-size:56px; color: #E6E27F;"></span> 
				<span class="glyphicon glyphicon-baby-formula" style="font-size:56px; color: #81C36C;"></span> 
				<i class="fa fa-code-fork" style="font-size:56px; color: #E6E27F;"></i>
				</p>
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
</html>
