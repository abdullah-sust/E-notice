<%-- 
    Document   : login
    Created on : Feb 11, 2017, 9:19:55 AM
    Author     : Moqsad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="full" lang="en">
    <!-- Make sure the <html> tag is set to the .full CSS class. Change the background image in the full.css file. -->

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

        <title>LogIn</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/the-big-picture.css" rel="stylesheet">

        <!-- Table CSS -->
        <link href="css/table.css" rel="stylesheet">

        <link href="css/pageHeader.css" rel="stylesheet">

        <link href="css/loginButton.css" rel="stylesheet">

        <link rel="stylesheet" type="text/css" href="css/marquee.css">

        <style>
            p.navbar-brand{
                height:5px;
            }
            div.jumbotron{
/*                width:40%;
                padding:20px;
                margin:auto;*/
            }
        </style>

    </head>

    <body style="margin-top: 20px">

        <div class="container">

            <!-- PageHeader -->
            <div class="bd-pageheader">
                <div class="container">

                    <h4 style="color: white">NOTICE BOARD OF CSE</h4>
                    <p class="lead">
                        Shahjalal University of Science and Technology
                    </p>


                    <script async type="text/javascript" src="https://cdn.carbonads.com/carbon.js?zoneid=1673&serve=C6AILKT&placement=getbootstrapcom" id="_carbonads_js"></script>

                </div>
            </div>
            <!-- /PageHeader -->


            <%
                //In case of login page the marquee is not needed, so this is commented
            %>
            <!-- marquee -->
            <!--            <div id="marq" class="alert" role="alert">
                            <button type="button" onclick="this.parentNode.parentNode.removeChild(this.parentNode);" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button><marquee><p style="font-family: Impact; font-size: 18pt">** Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor! **</p></marquee>
                        </div>-->
            <!-- /marquee -->


            <!-- Static navbar -->


            <!-- Main component for a primary marketing message or call to action -->
            <div class = "jumbotron" style="">
                
            <div class="jumbotron" style="width:40%;padding:20px;margin:auto;background: LightGray ">

                <form id="loginform" class="form-horizontal" role="form" action="LoginServlet" method="post">

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="login-username" type="text" class="form-control" name="username" value="" placeholder="username or email" required>                                        
                    </div>

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="login-password" type="password" class="form-control" name="password" placeholder="password" required>
                    </div>
                    <div style="margin-bottom: 25px" class="input-group">
                        <%
                            HttpSession tempSession = request.getSession();
                            if (tempSession.getAttribute("retry") != null && tempSession.getAttribute("retry").equals("1")) {
                        %>
                        <h5 style="color: red;">username or password is wrong, try again!!!</h5>
                        <%
                                tempSession.setAttribute("retry", "0");
                            }
                        %>
                    </div>

<!--                    <div class="input-group">
                        <div class="checkbox">
                            <label>
                                <input id="login-remember" type="checkbox" name="remember" value="1"> Remember me
                            </label>
                        </div>
                    </div>-->


                    <div style="margin-top:10px" class="form-group">
                        <!-- Button -->

                        <div class="col-sm-12 controls">

                            <!-- <a type="submit" id="btn-login" class="btn btn-primary">Login  </a> -->
                            <!-- <a id="btn-fblogin" href="#" class="btn btn-primary">Login with Facebook</a> -->

                        </div>
                    </div>  
                </form>     

                <button id="button2" class="btn btn-lg" type="submit" form="loginform" value="Login">Login</button>
                <!-- <a class="btn btn-lg btn-primary" type="submit" role="button" form="loginform">View navbar docs &raquo;</a> -->

            </div>
                    </div>
            <br>
            &#160

        </div> <!-- /container -->


        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
        <script src="../../dist/js/bootstrap.min.js"></script>
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-bottom" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <p class="navbar-brand"  align="center">All rights reserved@SUST_CSE</p>
                    <!--                 <a class="navbar-brand" href="#">Start Bootstrap</a> -->
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>

        <!-- Page Content -->
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <!-- <h1>The Big Picture</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni, iusto, unde, sunt incidunt id sapiente rerum soluta voluptate harum veniam fuga odit ea pariatur vel eaque sint sequi tenetur eligendi.</p> -->
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

    </body>

</html>
