<%-- 
    Document   : viewNotice
    Created on : Feb 12, 2017, 11:26:22 PM
    Author     : Moqsad
--%>

<%@page import="Database.StudentNotices"%>
<%@page import="Database.UploaderNotices"%>
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

        <title>Notice View</title>

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
                document.getElementById("range").innerHTML = newValue;
            }
        </script>

    </head>

    <body style="margin-top: 20px">

        <%
            System.out.println("Welcome to view notice!!!2");
        %>
        
        
        <div class="container ">
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">

                        <table id="mytable" class="table table-bordred table-striped">

                            <%
                                HttpSession session_ = request.getSession();

                                String title, category, description, date, attachFile, accountType = (String) session.getAttribute("accountType");
                                int noticeNo, marqueeNoticeNo;

                                if (accountType == null || accountType.equals("0")) {
                                    if (request.getParameter("noticeNo") != null) {
                                        noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
                                        title = Notices.titleArray[noticeNo];
                                        category = Notices.categoryArray[noticeNo];
                                        description = Notices.descriptionArray[noticeNo];
                                        date = Notices.dateArray[noticeNo];
                                        attachFile = "files/" + Notices.fileNameArray[noticeNo].replaceAll(" ", "%20");
                                    } else {
                                        marqueeNoticeNo = Integer.parseInt(request.getParameter("marqueeNoticeNo"));
                                        title = Notices.marqueeTitleArray[marqueeNoticeNo];
                                        category = Notices.marqueeCategoryArray[marqueeNoticeNo];
                                        description = Notices.marqueeDescriptionArray[marqueeNoticeNo];
                                        date = Notices.marqueeDateArray[marqueeNoticeNo];
                                        attachFile = "files/" + Notices.marqueeFileNameArray[marqueeNoticeNo].replaceAll(" ", "%20");
                                    }
                                } else if (accountType.equals("1")) {
                                    System.out.println("-------------------------Student----------------------");
                                    if (request.getParameter("noticeNo") != null) {
                                        noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
                                        title = StudentNotices.titleArray[noticeNo];
                                        category = StudentNotices.categoryArray[noticeNo];
                                        description = StudentNotices.descriptionArray[noticeNo];
                                        date = StudentNotices.dateArray[noticeNo];
                                        attachFile = "files/" + StudentNotices.fileNameArray[noticeNo].replaceAll(" ", "%20");
                                    }
                                    else
                                    {
                                        marqueeNoticeNo = Integer.parseInt(request.getParameter("marqueeNoticeNo"));
                                        title = StudentNotices.marqueeTitleArray[marqueeNoticeNo];
                                        category = StudentNotices.marqueeCategoryArray[marqueeNoticeNo];
                                        description = StudentNotices.marqueeDescriptionArray[marqueeNoticeNo];
                                        date = StudentNotices.marqueeDateArray[marqueeNoticeNo];
                                        attachFile = "files/" + StudentNotices.marqueeFileNameArray[marqueeNoticeNo].replaceAll(" ", "%20");
                                    }
                                } else {
                                    System.out.println("-------------------------Uploader----------------------");
                                    noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
                                    title = UploaderNotices.titleArray[noticeNo];
                                    category = UploaderNotices.categoryArray[noticeNo];
                                    description = UploaderNotices.descriptionArray[noticeNo];
                                    date = UploaderNotices.dateArray[noticeNo];
                                    attachFile = "files/" + UploaderNotices.fileNameArray[noticeNo].replaceAll(" ", "%20");
                                }
                            %>

                            <tbody>
                                
                            <div class = "jumbotron">
                            <h4 style="text-align: left; color:CornflowerBlue ;"><b><span style="color:CornflowerBlue"><%=title%><span></b></h4>
                            <h5 style="text-align: left; color:CornflowerBlue ;"><span style="color:black"><%=date%><span></h5><br>
                            <h4 style="text-align: left; color:CornflowerBlue ;"><span style="color:black"><%=description%><span></h4><br><br>
                                 
                            <iframe src=<%=attachFile%> width="100%" height="600" name ="sgfsdssdfs" value ="oooo" scrolling="auto" frameborder="0">
                                You should be using firefox.
                            </iframe>
                                    
                            </div>
                            <!-- <tr>
                                 <td width="100%"><h3 style="text-align: left; color: #631ecc;">**Annual sports coming soon...</h3></td>
                             </tr> -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
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
        

    </body>

</html>

