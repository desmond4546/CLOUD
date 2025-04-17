<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Style/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="../Style/css/style.css">
    <link rel="stylesheet" href="../Style/css/Admin/product.css">
    <title>Product</title>
</head>
<body class="adminBody">
        
    <%@ include file="SideMenu.jsp" %>
    <%@ include file="Header.jsp" %>

    <div class="page bg-light d-flex align-items-center justify-content-center">
        <div class="bg-white rounded shadow-sm container-xl maxPageHeight">
            <div class="d-flex justify-content-between align-items-center row">
                <div class="d-flex p-sm-0 py-2 ps-1 py-sm-3 order-2 order-sm-1 col-sm-11 flex-wrap justify-content-between justify-content-sm-start">
                    <a class="btn-primary btn btn-sm me-1 ms-2" href="#">Male</a>
                    <a class="btn-secondary btn btn-sm me-1">Female</a>
                    <a class="btn-primary btn btn-sm me-1">Top</a>
                    <a class="btn-secondary btn btn-sm me-1">Bottom</a>
                    <a class="btn-secondary btn btn-sm me-1">Other</a>
                </div>
                <div class=" order-1 order-sm-2 col-sm-1 py-sm-3 my-1">
                    <button class="btn btn-sm btn-outline-primary shadow-sm w-100">Add</button>
                </div>
            </div>
            

            <!--Search Bar-->
            <form class="searchBar container-sm bg-white shadow-sm mb-1 mx-auto rounded-pill border" action="" method="get">
                <input type="text" placeholder="Name">
                <input type="submit" value="Search">
            </form>
            
            <p class="text-gray text-center my-2"><small><i>(100 Records Found)</i></small></p>

            <div id="productMainContainer">
                
                <div class="row p-2 shadow-sm rounded border mx-1 mb-2">

                    <div class="col-sm-3 d-flex">
                        <div class="d-flex align-items-center ">
                            <img src="../../Img/Icon/shirt.png" alt="" class="iconImg">
                        </div>
                        
                        <div class="d-flex flex-column justify-content-center ms-3 text-start text-gray">
                            <h6 class="m-0">Product Name</h6>
                            <p><small>5 JUN 2024</small></p>
                        </div>
                    </div>

                    <div class="col-md-4 d-flex align-items-center flex-wrap">
                        <p class="badge rounded-pill text-bg-primary me-1 my-1">Clothes</p>
                        <p class="badge rounded-pill text-bg-primary me-1 my-1">Clothes</p>
                        <p class="badge rounded-pill text-bg-primary me-1 my-1">Clothes</p>
                    </div>

                    <div class="col-md-2 d-flex align-items-center">
                        <h6 class="m-0 ms-1">RM 100.00</h6>
                        <p class="ms-1 d-md-none d-lg-block"><small><i>(per unit)</i></small></p>
                    </div>

                    <div class="col-md-2 d-flex align-items-center">
                        <p class="ms-1">Stock :</p>
                        <h6 class="m-0 ms-1">20</h6>
                        <p class="ms-1 d-md-none d-lg-block"><small><i>(unit)</i></small></p>
                    </div>

                    <div class="col-md-1 d-flex align-items-center justify-content-end">
                        <button class="btn btn-sm btn-primary w-100 my-1 my-sm-0">More</button>
                    </div>

                </div>

                <div class="row p-2 shadow-sm rounded border mx-1 mb-2">

                    <div class="col-sm-3 d-flex">
                        <div class="d-flex align-items-center ">
                            <img src="../../Img/Icon/shirt.png" alt="" class="iconImg">
                        </div>
                        
                        <div class="d-flex flex-column justify-content-center ms-3 text-start text-gray">
                            <h6 class="m-0">Product Name</h6>
                            <p><small>5 JUN 2024</small></p>
                        </div>
                    </div>

                    <div class="col-md-4 d-flex align-items-center flex-wrap">
                        <p class="badge rounded-pill text-bg-primary me-1 my-1">Clothes</p>
                        <p class="badge rounded-pill text-bg-primary me-1 my-1">Clothes</p>
                        <p class="badge rounded-pill text-bg-primary me-1 my-1">Clothes</p>
                    </div>

                    <div class="col-md-2 d-flex align-items-center">
                        <h6 class="m-0 ms-1">RM 100.00</h6>
                        <p class="ms-1 d-md-none d-lg-block"><small><i>(per unit)</i></small></p>
                    </div>

                    <div class="col-md-2 d-flex align-items-center">
                        <p class="ms-1">Stock :</p>
                        <h6 class="m-0 ms-1">20</h6>
                        <p class="ms-1 d-md-none d-lg-block"><small><i>(unit)</i></small></p>
                    </div>

                    <div class="col-md-1 d-flex align-items-center justify-content-end">
                        <button class="btn btn-sm btn-primary w-100 my-1 my-sm-0">More</button>
                    </div>

                </div>
                
            </div>
                
            </div>
        </div>
    </div>
</body>
</html>