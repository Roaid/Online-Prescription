<%--
  Created by IntelliJ IDEA.
  User: Fang
  Date: 2016/8/29
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="../../common/common_header.jsp" %>
    <title>Pharmacy Board</title>
    <!-- Custom styles for this template -->
    <link href="static/css/domain/pharmacy/dashboard.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs/jq-2.2.3/dt-1.10.12/datatables.min.css"/>

    <script type="text/javascript" src="https://cdn.datatables.net/v/bs/jq-2.2.3/dt-1.10.12/datatables.min.js"></script>

    <script>
        $(function(){
            //alert("Ready!");
            ajaxDatatable();
        });

        function ajaxDatatable(){
            var url = "getAllDrugsJsonData";
            $('#table1').dataTable( {

                "bJQueryUI": true,
                "bProcessing": true,
                "bServerSide": true,
                "bDestroy": true,
                "bAutoWidth": true,
                //"sScrollX": "940px",
                //"sScrollY": "250px",
                "bScrollCollapse": true,
                "bSort": false,

                "aoColumns": [
                    { "width": "5%", "sType": "numeric"   },
                    { "width": "20%" },
                    { "width": "20%" },
                    { "width": "20%" },
                    { "width": "25%" },
                    { "width": "10%" }
                ],
                "aaSorting": [[ 0, "asc" ]],
                "sAjaxSource": url,
                "fnServerData": function ( sSource, aoData, fnCallback ) {
                    // Add some extra data to the sender
                    aoData.push( );
                    $.ajax( {
                        "dataType": 'json',
                        "type": "POST",
                        "url": sSource,
                        "data": aoData,
                        "success": fnCallback
                    } );
                }
            });
        }

    </script>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Pharmacy Board</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">

            <ul class="nav navbar-nav navbar-right">
                <li><a href="./pharmacyIndex">Dashboard</a></li>
                <li><a href="#">Help</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
            </form>
        </div>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li><a href="./pharmacyIndex">Overview <span class="sr-only">(current)</span></a></li>
                <li><a href="./checkOrders">Orders</a></li>
                <li><a href="./checkHistory">History</a></li>

            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="./checkStocks">Stocks</a></li>
                <li class="active"><a href="./checkList">Medicine List</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">Medicine List</h1>


            <div class="container">
                <table id="table1" class="display" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th align="center" width="200px">ID</th>
                        <th align="center" width="200px">Medicine Number</th>
                        <th align="center" width="200px">Medicine Serial</th>
                        <th align="center" width="200px">Producer</th>
                        <th align="center" width="200px">Package</th>
                        <th align="center" width="200px">Price</th>
                    </tr>
                    </thead>
                    <tbody align="center">
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    // For demo to fit into DataTables site builder...
    $('#table1')
            .removeClass( 'display' )
            .addClass('table table-striped table-bordered');
</script>
</body>
</html>