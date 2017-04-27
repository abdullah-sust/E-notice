<%-- 
    Document   : upload
    Created on : Feb 11, 2017, 10:32:34 PM
    Author     : Moqsad
--%>

<%@page import="Database.StudentNotices"%>
<%@page import="Database.UploaderNotices"%>
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

        <title>Upload</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/the-big-picture.css" rel="stylesheet">

        <!-- Table CSS -->
        <link href="css/table.css" rel="stylesheet">

        <link href="css/pageHeader.css" rel="stylesheet">

        <link rel="stylesheet" type="text/css" href="css/fileUpload.css">

        <link href="css/loginButton.css" rel="stylesheet">

        <link rel="stylesheet" type="text/css" href="css/marquee.css">


        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <script type="text/javascript">
            function showValue(newValue)
            {
                document.getElementById("range").innerHTML =newValue;
            }
        </script>

    </head>

    <body style="margin-top: 20px">

        <%
            HttpSession tempSession = request.getSession();
            java.lang.System.out.println(tempSession.getAttribute("accountType") + "---------------upload\n");
            if(tempSession.getAttribute("accountType") == null || !tempSession.getAttribute("accountType").equals("2"))
                response.sendRedirect("login.jsp");
        %>

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
                //for uploader marquee is comment out, because it is not needed in this case
            %>
            <!-- marquee -->
<!--            <div id="marq" class="alert" role="alert">
                <button type="button" onclick="this.parentNode.parentNode.removeChild(this.parentNode);" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button><marquee><p style="font-family: Impact; font-size: 18pt">** Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor! **</p></marquee>
            </div>-->
            <!-- /marquee -->


            <!-- Static navbar -->
            <nav class="navbar navbar-default" style="margin-bottom:0px">
                <div class="container-fluid">
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="dropdown">
                                <a href="staffBoard.jsp" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Notices <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="/ENotice/UploaderNextPrevCombo?click=combo&dropdown=All" id="all" name="all">All</a></li>
                                    <li><a href="/ENotice/UploaderNextPrevCombo?click=combo&dropdown=Event" id="event" name="event">Event</a></li>
                                    <li><a href="/ENotice/UploaderNextPrevCombo?click=combo&dropdown=Hall" id="hall" name="hall">Hall</a></li>
                                    <li><a href="/ENotice/UploaderNextPrevCombo?click=combo&dropdown=IICT" id="iict" name="iict">IICT</a></li>
                                    <li><a href="/ENotice/UploaderNextPrevCombo?click=combo&dropdown=Library" id="library" name="library">Library</a></li>
                                    <li><a href="/ENotice/UploaderNextPrevCombo?click=combo&dropdown=Medical" id="medical" name="medical">Medical</a></li>
                                    <li><a href="/ENotice/UploaderNextPrevCombo?click=combo&dropdown=Registry%20Office" id="registry office" name="registry office">Registry Office</a></li>
                                    <li><a href="/ENotice/UploaderNextPrevCombo?click=combo&dropdown=Result" id="result" name="result">Result</a></li>
                                    <li><a href="/ENotice/UploaderNextPrevCombo?click=combo&dropdown=Scholarship" id="scholarship" name="scholarship">Scholarship</a></li>
                                    <li><a href="/ENotice/UploaderNextPrevCombo?click=combo&dropdown=Society" id="society" name="society">Society</a></li>
                                    <li><a href="/ENotice/UploaderNextPrevCombo?click=combo&dropdown=Sports" id="sports" name="sports">Sports</a></li>
                                    <li><a href="/ENotice/UploaderNextPrevCombo?click=combo&dropdown=Vacation" id="vacation" name="vacattion">Vacation</a></li>
                                    <li><a href="/ENotice/UploaderNextPrevCombo?click=combo&dropdown=Others" id="others" name="others">Others</a></li>
                                </ul>
                            </li>
                            <li class = "active"><a href="upload.jsp">Upload</a></li>
                        </ul>


                        <ul class="nav navbar-nav navbar-right">
                            <!--               <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li> -->
                            <li><a href="LogoutServlet"><span class="glyphicon glyphicon-log-out"></span> LogOut</a></li>
                        </ul>

                    </div><!--/.nav-collapse -->
                </div><!--/.container-fluid -->
            </nav>

            <!-- Main component for a primary marketing message or call to action -->
            <div class="jumbotron" >
                
            <%
                String servlet_ = "UploadServlet";
                if(request.getParameter("positionOfNotice") != null)
                {
                    servlet_ = "EditServlet?positionOfNotice="+request.getParameter("positionOfNotice");//delete er khetre id padaicilam, karon shudu
                    //tokhon id enough cilo delete korar jonno, but ekhono id padaile cholto, kintu positionOfNotice er maddome jehetu sob info ber kora
                    //somvob tai ei case e positionOfNotice dia trial dilam
                }
            %>
            <form id="loginform2" class="form-horizontal" role="form" action=<%=servlet_%> enctype="multipart/form-data" method="post" align="right">

                    <%
                        String title = "";
                        String description = "";
                        String importancy = "";
                        String fileName = "";
                        String category = "";
                        if (request.getParameter("positionOfNotice") != null) {
                            int positionOfNotice = Integer.parseInt(request.getParameter("positionOfNotice"));
                            title = UploaderNotices.titleArray[positionOfNotice];
                            description = UploaderNotices.descriptionArray[positionOfNotice];
                            importancy = UploaderNotices.importancyArray[positionOfNotice];
                            fileName = UploaderNotices.fileNameArray[positionOfNotice];
                            category = UploaderNotices.categoryArray[positionOfNotice];
                            System.out.println("In upload()");
                            System.out.println("Title : " + title + "\nDes : " + description + "\nImportancy : " + importancy + "\nCategory : " + category);
                        }
                    %>

                    <div style="margin-bottom: 25px; padding-left: 30%;" class="input-group">
                        <input id="title" type="text" class="form-control" name="title" placeholder="Title" value="<%=title%>" required >                                        
                    </div>

                    <div style="margin-bottom: 25px; padding-left: 30%;" class="input-group">
                        <textarea rows="4" cols="50" id="description" type="text" class="form-control" name="description" value=""  placeholder="Description" required ><%=description%></textarea>
                    </div>

                    <div style="margin-bottom: 25px; padding-left: 30%;" class="input-group">
                        <span><b>Importancy</b></span>
                        <input id="importancy" name="importancy" class="form-control" type="range" min="1" max="5" value=<%=importancy%> step="1" onchange="showValue(this.value)" required />
                        <span id="range"><b><%=" : " + importancy%></b></span>
                    </div>

                    <div style="margin-bottom: 25px; padding-left: 30%;" class="input-group">
                        <select id="category" name = "category" class="form-control" required>
                            <%
                                for(int i = 0; i < 12; ++i)
                                {
                                    if(category.equals(StudentNotices.categoryStore[i]))
                                    {
                            %>
                                        <option selected><%=StudentNotices.categoryStore[i]%></option>
                            <%
                                    }
                                    else
                                    {
                            %>
                                        <option><%=StudentNotices.categoryStore[i]%></option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>  

                    <div  style="margin-bottom: 25px; padding-left: 30%;" class="input-group">
                        <input class="form-control" type="file" value=<%=fileName%> accept= "image/png, image/jpeg, image/gif, application/pdf" name="attach_file"  multiple /> <!-- rename it -->

                    </div>                                  

                    <div style="margin-top:10px" class="form-group">
                        <!-- Button -->

                        <div class="col-sm-12 controls">

                        </div>
                    </div>

                </form>     
                <div  style="padding-left: 30%;">
                    <button id="button2" class="btn btn-lg" type="submit" form="loginform2" value="Login">Upload</button>  
                </div>

                <!-- <a class="btn btn-lg btn-primary" type="submit" role="button" form="loginform">View navbar docs &raquo;</a> -->

            </div>

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
                    <p class="navbar-brand" align="center">All rights reserved@SUST_CSE</p>
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

