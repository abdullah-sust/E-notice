<%-- 
    Document   : loginSuccess
    Created on : Feb 11, 2017, 11:10:20 AM
    Author     : Moqsad
--%>

<%@page import="Database.Notices"%>
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

        <title>Home</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/the-big-picture.css" rel="stylesheet">

        <!-- Table CSS -->
        <link href="css/table.css" rel="stylesheet">

        <link rel="stylesheet" href="css/pageHeader.css">

        <link rel="stylesheet" type="text/css" href="css/marquee.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <style>
            .previous a{
                background-color: PowderBlue !important;
                color: black !important;
                font-weight: bold !important;
            }
            .next a {
                background-color: PowderBlue !important;
                color: black !important;
                font-weight: bold !important;
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

            <!-- marquee -->
            <div  id="marq" style="padding:0px" class="alert" role="alert">
                <marquee style="color:limegreen; background-color: white; height : 20px" onmouseover="this.stop()" onmouseout="this.start()">
                    <p style="font-family: Times New Roman; font-size: 13pt; background-color: white"> 
                        <%
                            for (int i = 0; i < Notices.marqueeNoOfNotices; ++i) {
                        %>
                        <a style="color:black" href="viewNotice.jsp?marqueeNoticeNo=<%=i%>"><%=Notices.marqueeTitleArray[i]%></a>&#160&#160&#160&#160
                        <%
                            }
                        %> 
                    </p>
                </marquee>
            </div>
            <!-- /marquee -->

            <!-- Static navbar -->
            <nav class="navbar navbar-default" style="margin-bottom:0px">
                <div class="container-fluid">
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="dropdown">
                                <%
                                    //Need to process calculate the current dropdown(notice category) value
                                    HttpSession tempSession = request.getSession();
                                    String currentDropdown = (String) tempSession.getAttribute("dropdown");
                                    String currentNotice = "Notice" + "(" + currentDropdown + ")";
                                %>
                                <a href="home.jsp" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%=currentNotice%><span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="/ENotice/HomeNextPrevCombo?click=combo&dropdown=All" id="all" name="all">All</a></li>
                                    <li><a href="/ENotice/HomeNextPrevCombo?click=combo&dropdown=Event" id="event" name="event">Event</a></li>
                                    <li><a href="/ENotice/HomeNextPrevCombo?click=combo&dropdown=Hall" id="hall" name="hall">Hall</a></li>
                                    <li><a href="/ENotice/HomeNextPrevCombo?click=combo&dropdown=IICT" id="iict" name="iict">IICT</a></li>
                                    <li><a href="/ENotice/HomeNextPrevCombo?click=combo&dropdown=Library" id="library" name="library">Library</a></li>
                                    <li><a href="/ENotice/HomeNextPrevCombo?click=combo&dropdown=Medical" id="medical" name="medical">Medical</a></li>
                                    <li><a href="/ENotice/HomeNextPrevCombo?click=combo&dropdown=Registry%20Office" id="registry office" name="registry office">Registry Office</a></li>
                                    <li><a href="/ENotice/HomeNextPrevCombo?click=combo&dropdown=Result" id="result" name="result">Result</a></li>
                                    <li><a href="/ENotice/HomeNextPrevCombo?click=combo&dropdown=Scholarship" id="scholarship" name="scholarship">Scholarship</a></li>
                                    <li><a href="/ENotice/HomeNextPrevCombo?click=combo&dropdown=Society" id="society" name="society">Society</a></li>
                                    <li><a href="/ENotice/HomeNextPrevCombo?click=combo&dropdown=Sports" id="sports" name="sports">Sports</a></li>
                                    <li><a href="/ENotice/HomeNextPrevCombo?click=combo&dropdown=Vacation" id="vacation" name="vacattion">Vacation</a></li>
                                    <li><a href="/ENotice/HomeNextPrevCombo?click=combo&dropdown=Others" id="others" name="others">Others</a></li>
                                </ul>
                            </li>
                        </ul>
                                
                    <%
                        String searchAction = "SearchServlet?searchFromHome=1&click=combo";
                    %>

                    <form class="navbar-form navbar-left" role="search" action=<%=searchAction%> method="post">
                        <div class="form-group" >
<!--                            <h text-align="right">All Notices</h>-->
                            <input type="text" name="search" class="form-control" placeholder="Search">
                            <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                        </div>
                    </form>

                        <ul class="nav navbar-nav navbar-right">
                            <!--               <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li> -->
                            <li><a href = "login.jsp"><span class="glyphicon glyphicon-log-in"></span> LogIn</a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div><!--/.container-fluid -->
            </nav>

            <!-- Main component for a primary marketing message or call to action -->
            <div class="jumbotron">

<!--                <div class="container" style="padding-bottom: 20px">
                    
                    <%
                        //String searchAction = "SearchServlet?searchFromHome=1&click=combo";
                    %>

                    <form class="navbar-form navbar-left" style="float:right !important" role="search" action=<%=searchAction%> method="post">
                        <div class="form-group" >
                            <h text-align="right">All Notices</h>
                            <input type="text" name="search" class="form-control" placeholder="Search">
                            <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                        </div>
                    </form>
                </div>-->
                        
<!--                <hr style="border-width: 2px; border-top: 1px solid black;">-->

                <div class="container">

                    <!--jsp codes here-->

                    <%
                        int current = 0;
                        if (tempSession.getAttribute("pageNumber") != null) {
                            current = Integer.parseInt((String) tempSession.getAttribute("pageNumber"));
                        }

                        int start_ = current * 6, end_ = Math.min(current * 6 + 6, Notices.noOfNotices);

                        for (int i = start_; i < end_; i += 2) {%>

                    <div class="row">
                        <div class="col-sm-5" style="background:white;" onmouseout="this.style.background = 'white';" onmouseover="this.style.background = '#F3EFEF';">
                            <b><a href="viewNotice.jsp?noticeNo=<%=i%>">Title : <%=Notices.titleArray[i]%></a></b><br>
                            <b>Category : </b><%=Notices.categoryArray[i]%><br>
                            <b>Published on: </b><%=Notices.dateArray[i]%><br>
                        </div>

                        <div class="col-sm-2"></div>

                        <%if (i + 1 < end_) {%>
                        <div class="col-sm-5" style="background:white;" onmouseout="this.style.background = 'white';" onmouseover="this.style.background = '#F3EFEF';">
                            <b><a href="viewNotice.jsp?noticeNo=<%=(i + 1)%>">Title : <%=Notices.titleArray[i + 1]%></a></b></br>
                            <b>Category : </b><%=Notices.categoryArray[i + 1]%><br>
                            <b>Published on: </b><%=Notices.dateArray[i + 1]%><br>
                        </div>
                        <%}%>
                    </div>
                    <br><br/>
                    <%}%>


                    <!--pagination me-->
                    <div class="container">                
                        <ul class="pager">
                            <%
                                if (current > 0) {
                            %>
                            <li class="previous"><a href="/ENotice/HomeNextPrevCombo?click=pre">Previous</a></li>
                                <%
                                    }
                                %>

                            <%
                                if (end_ < Notices.noOfNotices) {
                            %>
                            <li class="next"><a href="/ENotice/HomeNextPrevCombo?click=next">Next</a></li>
                                <%
                                    }
                                %>
                        </ul>
                    </div>
                    <!--Pagination me ends-->

                </div>



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
