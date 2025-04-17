<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Style/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="../Style/css/style.css">
    <link rel="stylesheet" href="../Style/css/Admin/productDetails.css">
    <title>Product Details</title>
</head>
<body class="adminBody">
    
    <%@ include file="SideMenu.jsp" %>
    <%@ include file="Header.jsp" %>
    
    <div class="page">
        <div class="bg-white rounded container-sm pb-4 pt-3">
<!--             <div class="d-flex align-items-center justify-content-between">
                <button class="btn btn-sm btn-dark shadow-sm">Back</button>
                <button class="btn btn-sm btn-primary shadow-sm">Refresh</button>
            </div> -->
            <div class="row p-4">
                <div class="col-sm-5 d-flex flex-column justify-content-between">
                    <div class="d-flex align-items-center justify-content-center mb-3">
                        <img src="../../Img/Icon/shirt.png" alt="" class="reviewImg">
                    </div>

                    <!-- <button class="btn btn-primary btn-sm w-100">Add 3D File</button> -->
                    <div class="border rounded d-flex p-2 align-items-center w-100 shadow-sm">
                        <img src="../../Img/Icon/customer.png" alt="" class="iconImg">
                        <p class="w-100 text-center"><b>3D model 5.gltx</b></p>
                        <button class="btn btn-sm btn-outline-danger">Remove</button>
                    </div>
                </div>
                <div class="col-sm-7 d-flex flex-column justify-content-between mt-5 mt-sm-0">
                    <input type="text" placeholder="Product Name">
                    <textarea name="" id="" placeholder="Details" class="border mt-3"></textarea>
                    <div class="d-flex flex-sm-row flex-column align-items-sm-center border rounded py-3 px-3 mt-3">
                        <div class="d-flex w-100">
                            <input type="checkbox" class="ui-checkbox">
                            <label class="ms-1 text-gray"><p>Male</p></label>
                        </div>
                        <div class="d-flex w-100">
                            <input type="checkbox" class="ui-checkbox">
                            <label class="ms-1 text-gray"><p>Female</p></label>
                        </div>
                        <div class="d-flex w-100">
                            <input type="checkbox" class="ui-checkbox">
                            <label class="ms-1 text-gray"><p>Top</p></label>
                        </div>
                        <div class="d-flex w-100">
                            <input type="checkbox" class="ui-checkbox">
                            <label class="ms-1 text-gray"><p>Bottom</p></label>
                        </div>
                        <div class="d-flex w-100">
                            <input type="checkbox" class="ui-checkbox">
                            <label class="ms-1 text-gray"><p>Other</p></label>
                        </div>
                    </div>

                    <div class="w-100 mt-3">
                        <h6 class="text-gray">RM</h6>
                        <input type="text" name="" id="" class="w-100">
                    </div>
                    
                    <div class="rounded border bg-light shadow-sm mt-3">
                        <p class="p-2 text-gray"><b><i>Supplier Purchasing Price</i></b></p>
                        <hr>
                        <div class="d-flex px-2 py-3 align-items-center">
                            <h6 class="text-gray pe-3 my-auto">RM</h6>
                            <input type="text" name="" id="" class="w-100 bg-light me-2">
                        </div>
                    </div>

                </div>
            </div>   

            <div class="border rounded px-2 py-4 row mx-4 d-flex justify-content-between">
                <div class="col-sm-6 d-flex flex-column justify-content-between">
                    <div class="d-flex">
                        <button class="btn btn-dark shadow-sm btn-sm me-1 sizeBtn">XS</button>
                        <button class="btn btn-light shadow-sm border btn-sm me-1 sizeBtn">XS</button>
                        <button class="btn btn-light shadow-sm border btn-sm me-1 sizeBtn">XS</button>
                        <button class="btn btn-light shadow-sm border btn-sm me-1 sizeBtn">XS</button>
                        <button class="btn btn-light shadow-sm border btn-sm me-1 sizeBtn">XS</button>
                    </div>
                    <p class="text-gray my-2"><i>(Size <b>XS</b> currently has <b>200</b> units in stock)</i></p>
                    <p>Number of <b>S</b> size unit(s) to order : </p>
                    <input type="text" name="" id="" class=" border rounded w-100">
                    <button class="btn btn-outline-primary btn-sm w-100 mt-2">Place Order</button>
                </div>
                <div class="col-sm-5 d-flex justify-content-between flex-column mt-4 mt-sm-0">
                    <table class="w-100 border shadow-sm">
                        <tr class="text-center bg-light">
                            <th><p>Size</p></th>
                            <th><p>Quantity</p></th>
                            <th><p>Amount (RM)</p></th>
                        </tr>
                        <tr>
                            <td colspan="3"><hr></td>
                        </tr>
                        <tr class="text-center text-gray">
                            <td><p>S</p></td>
                            <td><p>10</p></td>
                            <td><p>100.00</p></td>
                        </tr>
                        <tr class="text-center text-gray">
                            <td><p>S</p></td>
                            <td><p>10</p></td>
                            <td><p>100.00</p></td>
                        </tr>
                        <tr class="text-center text-gray">
                            <td><p>S</p></td>
                            <td><p>10</p></td>
                            <td><p>100.00</p></td>
                        </tr>
                        <tr class="text-center text-gray">
                            <td><p>S</p></td>
                            <td><p>10</p></td>
                            <td><p>100.00</p></td>
                        </tr>
                        <tr class="text-center text-gray">
                            <td><p>S</p></td>
                            <td><p>10</p></td>
                            <td><p>100.00</p></td>
                        </tr>
                        <tr class="text-center text-gray">
                            <td><p>S</p></td>
                            <td><p>10</p></td>
                            <td><p>100.00</p></td>
                        </tr>
                        <tr>
                            <td colspan="3"><hr></td>
                        </tr>
                        <tr class="text-center">
                            <th><p>Total</p></th>
                            <th></th>
                            <th><p>RM 1000.00</p></th>
                        </tr>
                    </table>
                    <button class="btn btn-outline-success btn-sm w-100 mt-2">Purchase Now</button>
                </div>
            </div>

            <div class="mt-4 mx-4">
                <button class="btn btn-primary btn-sm w-100 mb-2">Update</button>
                <button class="btn btn-dark btn-sm w-100 mb-2">Cancel</button>
                <button class="btn btn-outline-danger btn-sm w-100 ">Delete</button>
            </div>

        </div>
    </div>

</body>
</html>