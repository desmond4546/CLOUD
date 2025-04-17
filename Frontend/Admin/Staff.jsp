<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Style/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="../Style/css/style.css">
    <link rel="stylesheet" href="../Style/css/Admin/staff.css">
    <title>Staff</title>
</head>
<body class="adminBody">
        
    <%@ include file="SideMenu.jsp" %>
    <%@ include file="Header.jsp" %>
  
    <div class="page bg-light d-flex align-items-center justify-content-center">
        <div class="bg-white rounded shadow-sm container-xl maxPageHeight">

            <button class="btn btn-sm btn-outline-primary w-100 my-3 mx-1">Add</button>

            <!--Search Bar-->
            <form class="searchBar container-sm bg-white shadow-sm mb-1 mx-auto rounded-pill border" action="" method="get">
                <input type="text" placeholder="Name">
                <input type="submit" value="Search">
            </form>
            <p class="text-gray text-center my-2"><small><i>(100 Records Found)</i></small></p>
            
            <div class="d-flex flex-wrap">
                
               <!--Staff--> 
               <div class="rounded shadow-sm p-2 border d-flex mx-auto my-2 justify-content-between staffContainer">
                    <div class="d-flex">
                        <img src="../Img/Icon/staff.png" alt="" class="smallProfileImg shadow-sm me-2">
                        <div>
                            <p><b>Name</b></p>
                            <p>Username</p>
                        </div>
                    </div>
                    <button class="btn btn-sm btn-light shadow-sm border">More</button>
               </div>
                
            </div>
        </div>
    </div>
    
</body>
</html>