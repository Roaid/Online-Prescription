<html lang="en">
<head>
    <title>This is a demo page for learning.</title>
    <%@include file="../../common/common_header.jsp" %>
    <!-- customize css -->
    <link href="static/css/domain/demo/demo.css" rel="stylesheet" />
    <!-- customize javascript -->
    <script src="static/js/domain/demo/popup.js"></script>
</head>
<body>
    <%@include file="../../common/navigation.jsp" %>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Open modal for @mdo</button>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@fat">Open modal for @fat</button>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">Open modal for @getbootstrap</button>

                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="exampleModalLabel">New message</h4>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="form-group">
                                        <label for="recipient-name" class="control-label">Recipient:</label>
                                        <input type="text" class="form-control" id="recipient-name">
                                    </div>
                                    <div class="form-group">
                                        <label for="message-text" class="control-label">Message:</label>
                                        <textarea class="form-control" id="message-text"></textarea>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Send message</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-lg-3">
                    <a class="btn btn-lg btn-info btn-block" href="loginPage">
                        Login
                    </a>
            </div>
            <div class="col-lg-3">
                    <a class="btn btn-lg btn-info btn-block" href="datatableDemoPage">
                        DataTable Demo
                    </a>
            </div>
        </div>
    </div>
</body>
</html>