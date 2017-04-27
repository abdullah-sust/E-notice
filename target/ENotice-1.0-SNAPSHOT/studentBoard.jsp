<%-- 
    Document   : loginSuccess
    Created on : Feb 11, 2017, 11:10:20 AM
    Author     : Moqsad
--%>

<%@page import="Database.StudentNotices"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="full" lang="en">
    <!-- Make sure the <html> tag is set to the .full CSS class. Change the background image in the full.css file. -->

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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

        <title>Student</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/the-big-picture.css" rel="stylesheet">

        <!-- Table CSS -->
        <link href="css/table.css" rel="stylesheet">

        <link rel="stylesheet" href="css/pageHeader.css">

        <link rel="stylesheet" type="text/css" href="css/marquee.css">

        <style>
            a:link {
                background-color: transparent;
                text-decoration: none;
            }
            a:visited {
                background-color: transparent;
                text-decoration: none;
            }
            a:hover {
                background-color: transparent;
                text-decoration: underline;
            }
            a:active {
                background-color: transparent;
                text-decoration: underline;
            }
            .btn-info{
                background-color: PowderBlue;
                color: black; 
                height: 40px; 
                float: right; 
            }
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

        <%
            HttpSession tempSession = request.getSession();
            java.lang.System.out.println(tempSession.getAttribute("accountType") + "---------------studentBoard\n");
            if (tempSession.getAttribute("accountType") == null || !tempSession.getAttribute("accountType").equals("1")) {
                response.sendRedirect("login.jsp");
            }
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

            <!-- marquee -->
            <div  id="marq" style="padding:0px" class="alert" role="alert">
                <marquee style="color:limegreen; background-color: white; height : 20px" onmouseover="this.stop()" onmouseout="this.start()">
                    <p style="font-family: Times New Roman; font-size: 13pt; background-color: white"> 
                        <%
                            for (int i = 0; i < StudentNotices.marqueeNoOfNotices; ++i) {
                        %>
                        <a style="color:black" href="viewNotice.jsp?marqueeNoticeNo=<%=i%>"><%=StudentNotices.marqueeTitleArray[i]%></a>&#160&#160&#160&#160
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
                                    String currentDropdown = (String)tempSession.getAttribute("dropdown");
                                    String currentNotice = "Notice" + "(" + currentDropdown + ")";
                                %>
                                <a href="studentBoard.jsp" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%=currentNotice%><span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="/ENotice/StudentNextPrevCombo?click=combo&dropdown=All" id="all" name="all">All</a></li>
                                        <%
                                            for (int i = 0; i < 12; ++i) {
                                                if (StudentNotices.preference[i] == 1) {
                                                    String category = StudentNotices.categoryStore[i];
                                                    String href = "/ENotice/StudentNextPrevCombo?click=combo&dropdown=" + category;
                                        %>
                                                    <li><a href=<%=href%> id=<%=category%> name=<%=category%>><%=category%></a></li>
                                        <%
                                                }
                                            }
                                        %>
                                </ul>
                            </li>
                        </ul>

                        <%
                            String searchAction = "SearchServlet?searchFromStudent=1&click=combo";
                        %>
                                
                        <form class="navbar-form navbar-left" role="search" action=<%=searchAction%> method="post">
                            <div class="form-group">
                                <input type="text" name="search" class="form-control" placeholder="Search">
                            </div>
                            <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                        </form>

                        <ul class="nav navbar-nav navbar-right">
                            <!--               <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li> -->
                            <li><a href="LogoutServlet"><span class="glyphicon glyphicon-log-in"></span> LogOut</a></li>
                        </ul>
                                
                    </div><!--/.nav-collapse -->
                </div><!--/.container-fluid -->
            </nav>

            <!-- Main component for a primary marketing message or call to action -->





            <div class="jumbotron" >

                <div class="container"><!--nicher button e align="left"/"right" na dileo kaj kore-->
                    <div class="container-fluid">
                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal"><b>Preference</b></button>
                        <br>
                        <br>
                        &#160
                    </div>
                    <form action="Preference" method="post">                    
                        <!-- Modal -->
                        <div class="modal fade" id="myModal" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Preference</h4>
                                    </div>
                                    <div class="modal-body">
                                        <!--          <p>Some text in the modal.</p> -->
                                        <table>
                                            <thead>
                                            <th width="30%" height = "0%"></th>

                                            <th width="30%" height = "0%"></th>
                                            </thead>

                                            <tbody>
                                                <%
                                                    String preferenceFlag1, preferenceFlag2;
                                                    for (int i = 0; i < 12; i += 2) {
                                                        if (StudentNotices.preference[i] == 1) {
                                                            preferenceFlag1 = "checked";
                                                        } else {
                                                            preferenceFlag1 = "unchecked";
                                                        }

                                                        if (StudentNotices.preference[i + 1] == 1) {
                                                            preferenceFlag2 = "checked";
                                                        } else {
                                                            preferenceFlag2 = "unchecked";
                                                        }
                                                %>
                                                <tr>
                                                    <td align="left">
                                                        <input type="checkbox" id="c1" name=<%=StudentNotices.categoryStore[i]%> <%=preferenceFlag1%>/>
                                                        <label for="c1"><span></span><%=StudentNotices.categoryStore[i]%></label>
                                                    </td>

                                                    <td align="right">
                                                        
                                                        <label for="c2"><span></span><%=StudentNotices.categoryStore[i + 1]%></label>
                                                        <input type="checkbox" id="c2" name=<%=StudentNotices.categoryStore[i + 1]%> <%=preferenceFlag2%>/>
                                                    </td>
                                                </tr>
                                                <%
                                                    }
                                                %>
                                            </tbody>

                                        </table>

                                    </div>
                                    <div class="modal-footer">
                                        <input type = "submit" value = "Save changes" class = "btn btn-primary">
                                        <!--                                        <button type="submit" class="btn btn-primary">Save changes</button>-->
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </form>

                              
                    <div class="container">                        
                    <%
                        int current = 0;
                        if (tempSession.getAttribute("pageNumber") != null) {
                            current = Integer.parseInt((String) tempSession.getAttribute("pageNumber"));
                        }

                        int start_ = current * 6, end_ = Math.min(current * 6 + 6, StudentNotices.noOfNotices);

                        for (int i = start_; i < end_; i += 2) {%>

                    <div class="row">
                        <div class="col-sm-5" style="background:white;" onmouseout="this.style.background = 'white';" onmouseover="this.style.background = '#F3EFEF';">
                            <b><a href="viewNotice.jsp?noticeNo=<%=i%>">Title : <%=StudentNotices.titleArray[i]%></a></b><br>
                            <b>Category : </b><%=StudentNotices.categoryArray[i]%><br>
                            <b>Published on: </b><%=StudentNotices.dateArray[i]%><br>
                        </div>

                        <div class="col-sm-2"></div>

                        <%if (i + 1 < end_) {%>
                        <div class="col-sm-5" style="background:white;" onmouseout="this.style.background = 'white';" onmouseover="this.style.background = '#F3EFEF';">
                            <b><a href="viewNotice.jsp?noticeNo=<%=(i + 1)%>">Title : <%=StudentNotices.titleArray[i + 1]%></a></b></br>
                            <b>Category : </b><%=StudentNotices.categoryArray[i + 1]%><br>
                            <b>Published on: </b><%=StudentNotices.dateArray[i + 1]%><br>
                        </div>
                        <%}%>
                    </div>
                    <br><br/>
                    <%}%>
                    <div>

                    <!--pagination me-->

                    <ul class="pager">
                        <%
                            if (current > 0) {
                        %>
                                <li class="previous btn"><a href="/ENotice/StudentNextPrevCombo?click=pre">&larr; Previous</a></li>
                        <%
                            }
                        %>

                        <%
                            if (end_ < StudentNotices.noOfNotices) {
                        %>
                                <li class="next btn"><a href="/ENotice/StudentNextPrevCombo?click=next">Next &rarr;</a></li>
                        <%
                            }
                        %>
                    </ul>

                </div>


                <!--           <a class="btn btn-lg btn-primary" href="../../components/#navbar" role="button">View navbar docs &raquo;</a> -->

            </div>


        </div> <!-- /container -->
        </div> <!--edited by me-->
        </div>

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
