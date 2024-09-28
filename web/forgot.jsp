<%-- 
    Document   : forgot
    Created on : Sep 20, 2024, 5:18:15 PM
    Author     : trant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Medicine Shop</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="https://shreethemes.in" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="../assets/images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="../assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="../assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    </head>
    <body>
        <!--
        <div class="back-to-home rounded d-none d-sm-block">
            <a href="index.html" class="btn btn-icon btn-primary"><i data-feather="home" class="icons"></i></a>
        </div>-->

        <!-- Hero Start -->
        <section class="bg-home d-flex bg-light align-items-center" style="background: url('../assets/images/bg/bg-lines-one.png') center; padding-top: 70px;">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5 col-md-8">
                        <img src="../assets/images/logo-dark.png" height="24" class="mx-auto d-block" alt="">
                        <div class="card login-page bg-white shadow mt-4 rounded border-0">
                            <div class="card-body">
                                <h4 class="text-center">Recover Account</h4>

                                <form class="login-form mt-4" action="forgot" method="post">
                                    <div class="row">
                                        <c:if test="${requestScope.check == null || requestScope.check == 'false'}">
                                            <div class="col-lg-12">
                                                <p class="text-muted">Please enter your email address. You will receive a code to create a new password via email.</p>
                                                <div class="mb-3">
                                                    <label class="form-label">Email address <span class="text-danger">*</span></label>
                                                    <input type="email" class="form-control" placeholder="Enter Your Email Address" name="email" required="required" value="${requestScope.email}">
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${requestScope.check != null}">
                                            <c:if test="${requestScope.check == 'true' && !(requestScope.message == 'Sorry, reset code incorrect')}">
                                                <p style="padding-left: 15px;">${requestScope.message}</p>
                                            </c:if>
                                            <c:if test="${requestScope.check == 'false'}">
                                                <p style="padding-left: 15px;">${requestScope.message}</p>
                                            </c:if>
                                            <c:if test="${requestScope.check == 'true' && requestScope.message == 'Sorry, reset code incorrect'}">
                                                <p style="padding-left: 15px;">${requestScope.message}</p>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${requestScope.check == null || requestScope.check == 'false'}">
                                            <div class="col-lg-12">
                                                <div class="d-grid">
                                                    <button class="btn btn-primary" type="submit">Send</button>
                                                </div>
                                            </div>

                                            <div class="mx-auto">
                                                <p class="mb-0 mt-3"><small class="text-dark me-2">Remember your password ?</small> <a href="login" class="text-dark h6 mb-0">Log in</a></p>
                                            </div>
                                        </c:if>
                                    </div>
                                </form>
                                <c:if test="${requestScope.check != null && requestScope.check == 'true'}">
                                    <form action="confirmresetcode" method="post">
                                        <input name="email" value="${requestScope.email}" type="hidden">
                                        <div class="col-lg-12">
                                            <div class="mb-3">
                                                <label class="form-label">Reset Code <span class="text-danger">*</span></label>
                                                <input class="form-control" type="text" name="resetcode" placeholder="xxxxxx" required="required" value="${requestScope.code}">
                                            </div>
                                        </div>
                                        <c:if test="${requestScope.check != null && requestScope.check == 'true'}">
                                            <div class="col-lg-12">
                                                <div class="d-grid">
                                                    <button class="btn btn-primary" type="submit">Confirm Reset Code</button>
                                                </div>
                                            </div>
                                        </c:if>
                                    </form>
                                </c:if>
                            </div>
                        </div><!---->
                    </div> <!--end col-->
                </div><!--end row-->
            </div> <!--end container-->
        </section><!--end section-->
        <!-- Hero End -->

        <!-- javascript -->
        <script src="../assets/js/bootstrap.bundle.min.js"></script>
        <!-- Icons -->
        <script src="../assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="../assets/js/app.js"></script>

    </body>
</html>
