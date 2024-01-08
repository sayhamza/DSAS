<%-- 
    Document   : Verification
    Created on : Feb 3, 2023, 5:20:38 PM
    Author     : Team
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DSAS.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>DSAS: A Secure Data Sharing and Authorized
            Searchable Framework for e-Healthcare System</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="Tooplate">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">

        <!-- MAIN CSS -->
        <link rel="stylesheet" href="css/tooplate-style.css">
        <link rel="stylesheet" href="css/table.css">

    </head>

    <%
                if (request.getParameter("Incorrect") != null) {%>
    <script>alert('Incorrect Key');</script>  
    <%}
    %>
    <%
                if (request.getParameter("Updated") != null) {%>
    <script>alert('Medications Updated');</script>  
    <%}
    %>

    <body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">

        <!-- PRE LOADER -->
        <section class="preloader">
            <div class="spinner">

                <span class="spinner-rotate"></span>

            </div>
        </section>
        <!-- MENU -->
        <section class="navbar navbar-default navbar-static-top" role="navigation">
            <div class="container">

                <div class="navbar-header">
                    <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon icon-bar"></span>
                        <span class="icon icon-bar"></span>
                        <span class="icon icon-bar"></span>
                    </button>

                    <!-- lOGO TEXT HERE -->
                    <a href="#" class="navbar-brand"><i class="fa fa-h-square"></i>&nbsp;DSAS</a>
                </div>

                <!-- MENU LINKS -->
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="DoctorHome.jsp" class="smoothScroll">Home</a></li>
                        <li><a href="ViewPatientDetails.jsp" class="smoothScroll">Patients Details</a></li>
                        <li><a href="Search.jsp" class="smoothScroll">Search Patients</a></li>
                        <li><a href="RequestedPat.jsp" class="smoothScroll">Requested Patients</a></li>
                        <li><a href="SetUnavailabe.jsp" class="smoothScroll">Share Patients</a></li>
                        <li><a href="SharedPatients.jsp" class="smoothScroll">Shared Patients</a></li>
                         <li class="appointment-btn"><a href="logout.jsp">Logout</a></li>
                    </ul>
                </div>

            </div>
        </section>
        <%
            long millis = System.currentTimeMillis();

            // creating a new object of the class Date  
            java.util.Date date = new java.util.Date(millis);
            System.out.println(date);
        %>
        <%
            String pid = request.getParameter("pid");
             String rid = request.getParameter("rid");
            String did = session.getAttribute("did").toString();

            System.out.println("did " + did);
            System.out.println("did " + did);

            Connection con = SQLconnection.getconnection();
            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery("Select * from mdatarequest where did ='" + did + "' and reqstatus='Approved'");
            if (rs.next() == false) {
                response.sendRedirect("RequestedPat.jsp?NotApproved");
                rs.close();
            }


        %>
        <!-- NEWS DETAIL -->
        <section id="appointment" data-stellar-background-ratio="3">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-offset-4">
                        <!-- CONTACT FORM HERE -->
                        <center><form id="appointment-form" role="form" method="post" action="ReqPatdata.jsp">

                                <!-- SECTION TITLE -->
                                <div class="section-title wow fadeInUp" data-wow-delay="0.4s">
                                    <h2>Key Verification</h2>
                                </div>

                                <div class="wow fadeInUp" data-wow-delay="0.8s">
                                    <div class="col-md-12 col-sm-12">
                                        <label for="email">Patient ID</label>
                                        <input type="email" class="form-control" id="email" readonly="" style="color: red" value="<%=pid%>" name="pid" placeholder="Your Email">
                                        <label for="name">Secret Key</label>
                                        <input type="password" class="form-control" id="name" name="ss" placeholder="Secret Key">
                                        <input type="hidden" name="rid" value="<%=rid%>">
                                    </div>
                                    <div class="col-md-5 col-sm-5">
                                        <button type="submit" class="form-control" id="cf-submit" name="submit">Verify</button>
                                    </div>
                                </div>
                            </form></center>

                    </div>

                </div>
                <br><br><br><br><br><br><br><br>
            </div>
        </section>



        <!-- FOOTER -->
        <footer data-stellar-background-ratio="5">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12 border-top">
                        <div class="col-md-4 col-sm-6">
                            <div class="copyright-text"> 
                                <p>Copyright &copy; 2023 e-Healthcare System 
                            </div>
                        </div>
                        <div class="col-md-2 col-sm-2 text-align-center">
                            <div class="angle-up-btn"> 
                                <a href="#top" class="smoothScroll wow fadeInUp" data-wow-delay="1.2s"><i class="fa fa-angle-up"></i></a>
                            </div>
                        </div>   
                    </div>

                </div>
            </div>
        </footer>
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


        <!-- SCRIPTS -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.sticky.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/magnific-popup-options.js"></script>
        <script src="js/wow.min.js"></script>
        <script src="js/smoothscroll.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/custom.js"></script>

    </body>
</html>


