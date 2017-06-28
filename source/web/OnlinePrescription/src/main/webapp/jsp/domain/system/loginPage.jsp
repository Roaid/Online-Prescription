<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Signin page</title>
    <%@include file="../../common/common_header.jsp" %>
    <!-- Custom styles for this template -->
    <link href="static/css/domain/system/login.css" rel="stylesheet">
</head>

<body>
<%@include file="../../common/navigation.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <form class="form-signin" action="/login">
                <h2 class="form-signin-heading">Please sign in</h2>
                <label for="inputEmail" class="sr-only">Email address</label>
                <input type="email" id="inputEmail" name="inputEmail" class="form-control" placeholder="Email address"
                       required autofocus>
                <label for="inputPassword" class="sr-only">Password</label>
                <input type="password" id="inputPassword" name="inputPassword" class="form-control"
                       placeholder="Password" required>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            </form>
        </div>
    </div>
</div> <!-- /container -->

</body>
</html>
