<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Style/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="../Style/css/style.css">
    <link rel="stylesheet" href="../Style/css/Admin/sideMenu.css">
    <link rel="stylesheet" href="../Style/css/Admin/header.css">
    <title>Profile</title>
</head>
<body class="adminBody">
    
    <%@ include file="SideMenu.jsp" %>
    <%@ include file="Header.jsp" %>

    <div class="page bg-light d-flex align-items-center justify-content-center p-0">
        <div class="bg-white shadow-sm maxPageHeight p-4 my-sm-3 rounded">

          <div class="bg-light shadow-sm border rounded">
                <p class="p-1 text-gray"><b><i>Important Information</i></b></p>
                <hr>
                <div class="row d-flex align-items-center justify-content-around p-2 flex-wrap">
                    <div class="col-sm-3 d-flex align-items-center justify-content-sm-center justify-content-between">
                        <label for=""><p>Username</p></label>
                        <input type="text" name="" id="" class="border rounded ms-2">
                    </div>
                    <div class="col-sm-3 d-flex align-items-center justify-content-sm-center justify-content-between">
                        <label for=""><p>Password</p></label>
                        <input type="text" name="" id="" class="border rounded ms-2">
                    </div>
                </div>
          </div>

            <!--Personal Information-->
            <div class="mt-4 row">

                <div class="col">
                    <p class="text-gray text-center mb-2"><b>Profile Image</b></p>
                    <input type="file" name="profilePicInput" id="profilePicInput" accept="image/*" onchange="previewPhoto(event,'profileImg')" style="display: none;">
                    <img class="roundImg  w-80 d-flex mx-auto cursor-pointer shadow-sm border" id="profileImg"
                            src="https://th.bing.com/th/id/OIP.tLotgCDtzgTdwJcTiXWRCwHaEK?rs=1&pid=ImgDetMain" 
                            alt="Profile Pic" 
                            onclick="triggerFileInput('profilePicInput')">
                    <div class="border rounded bg-light p-2 my-3 shadow-sm">
                        <div class="d-flex justify-content-between align-items-center p-1">
                            <p class="text-gray"><i>Department : </i></p>
                            <div class="tag rounded-pill bg-danger"><p>Manager</p></div>
                        </div>
                        <div class="d-flex justify-content-between align-items-center mt-1 p-1">
                            <p class="text-gray"><i>Salary : </i></p>
                            <p><b>RM 1000.00</b></p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-8 px-3 d-block">

                    <p class="text-gray"><b>Name</b></p>
                    <input class="w-100" type="text"><br>
                    <small class="text-gray"><i>Your name may appear around the system where you contribute or are mentioned.</i></small>

                    <p class="text-gray mt-4"><b>Email</b></p>
                    <input class="w-100" type="text"><br>
                    <small class="text-gray"><i>Once email had changed, you are required to use the changed email to sign in the system.</i></small>

                    <p class="text-gray mt-4"><b>Address</b></p>
                    <textarea class="w-100 border" name="" id=""></textarea><br>
                    <small class="text-gray"><i>Your current residential address to ensure that all deliveries and correspondence reach you accurately.</i></small>

                    <p class="text-gray mt-4"><b>Gender</b></p>
                    <div class="d-flex rounded border justify-content-around p-2">
                        <div class="d-flex align-items-center justify-content-center">
                            <input type="radio">
                            <label class="ms-1 text-gray"><p>Male</p></label>
                        </div>
                        <div class="d-flex align-items-center justify-content-center">
                            <input type="radio">
                            <label class="ms-1 text-gray"><p>Female</p></label>
                        </div>
                        <div class="d-flex align-items-center justify-content-center">
                            <input type="radio">
                            <label class="ms-1 text-gray"><p>Other</p></label>
                        </div>
                    </div>
                    <small class="text-gray"><i>Gender select is for appropriate pronoun use.</i></small>

                    <p class="text-gray mt-4"><b>IC</b></p>
                    <input class="w-100" type="text"><br>
                    <small class="text-gray"><i>Your IC number is used solely for identification and record-keeping.</i></small>

                    <p class="text-gray mt-4"><b>Birth Date</b></p>
                    <input class="w-100" type="date"><br>
                    <small class="text-gray"><i>You will receive a surprise when your birthdate arrives.</i></small>

                    <p class="text-gray mt-4"><b>Contact</b></p>
                    <input class="w-100" type="text"><br>
                    <small class="text-gray"><i>A contact number is required so your supervisor or admin can reach you.</i></small>

                    <br>
                    <input class="btn btn-primary btn-sm mt-5 w-100" type="submit" value="Update">
                    <input class="btn btn-dark btn-sm mt-2 w-100" type="submit" value="Cancel">
                </div>

            </div>
        </div>
    </div>
    
</body>
</html>