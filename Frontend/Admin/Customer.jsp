<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Style/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="../Style/css/style.css">
    <link rel="stylesheet" href="../Style/css/Admin/customer.css">
    <title>Customer</title>
</head>
<body class="adminBody">
    
    <%@ include file="SideMenu.jsp" %>
    <%@ include file="Header.jsp" %>
    
    <div class="page bg-light d-flex align-items-center justify-content-center">
        <div class="bg-white rounded shadow-sm container-xl maxPageHeight p-3">
            <!--Search Bar-->
            <form class="searchBar container-sm bg-white shadow-sm mb-1 mx-auto rounded-pill border" action="" method="get">
                <input type="text" placeholder="Name">
                <input type="submit" value="Search">
            </form>
            
            <p class="text-gray text-center my-2"><small><i>(100 Records Found)</i></small></p>

            <div id="customerMainContainer">
                <div class="row d-flex justify-content-between p-2 shadow-sm rounded border mx-1 mb-2">

                    <div class="col-sm-3 d-flex">
                        <div class="d-flex align-items-center ">
                            <img src="https://sm.askmen.com/t/askmen_in/article/f/facebook-p/facebook-profile-picture-affects-chances-of-gettin_fr3n.1200.jpg" alt="" class="smallProfileImg">
                        </div>
                        
                        <div class="d-flex flex-column justify-content-center ms-3 text-start text-gray">
                            <h6 class="m-0">Name</h6>
                            <p><small><i>email@gamil.com</i></small></p>
                        </div>
                    </div>

                    <div class="col-sm-1 d-sm-flex align-items-center justify-content-center d-none">
                        <p class="badge rounded-pill text-bg-primary me-1 my-1">Member</p>
                    </div>

                    <div class="col-sm-3 d-sm-flex align-items-center justify-content-center d-none">
                        <p class="text-gray"><i>Total Spend : <b>RM 10000.00</b></i></p>
                    </div>

                    <div class="col-sm-2 d-flex align-items-center justify-content-end mt-2 mt-sm-0">
                        <a class="btn btn-sm btn-outline-primary w-100 my-1 my-sm-0">More</a>
                    </div>

                </div>
            </div>
            
        </div>
    </div>
</body>
</html>
