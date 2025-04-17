<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Style/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="../Style/css/style.css">
    <title>Inbox</title>
</head>
<body class="bg-light">

    <%@ include file="Header.jsp" %>
    
    <div class="container-sm bg-white shadow-sm rounded my-4 p-4">
        <h1><b>2024</b></h1>
        <div class="d-flex">
            <h5 class="text-gray mt-1"><b>JAN</b></h5>
            <hr class="w-100 my-auto ms-lg-3 ms-2">
        </div>
        <div class="rounded shadow-sm border p-3 container-sm mb-3">
            <div class="d-flex justify-content-between">
                <div class="d-flex align-items-center">
                    <img src="../Img/Icon/closedInbox.png" alt="" class="iconImg me-3">
                    <p><b>Successfully Purchased. Thank You!</b></p>
                </div>
                <span class="noti"></span>
            </div>
        </div>
        <div class="rounded shadow-sm border p-3 container-sm mb-3 bg-light opacity-75">
            <div class="d-flex justify-content-between">
                <div class="d-flex align-items-center">
                    <img src="../Img/Icon/openedInbox.png" alt="" class="iconImg me-3 opacity-50">
                    <p><b>Successfully Purchased. Thank You!</b></p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
