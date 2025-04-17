<?php

function getProductByID($id){
    
    $con = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
    $sql = "SELECT * FROM Product WHERE ID = $id";
    $result = $con->query($sql);
    
    $product = null;
    if ($result->num_rows === 1) {
        $product = $result->fetch_assoc();
    }
    
    $result->free();
    $con->close();
    return $product;
}

function getAllProducts(){
    
    $con = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
    $sql = "SELECT * FROM Product";
    $result = $con->query($sql);

    $products = [];
    while ($row = $result->fetch_object()) 
    { $products[] = $row; }

    $result->free();
    $con->close();
    return $products;
}

function getProductByName($productName){
    
    $con = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
    $productName = "%" . $productName . "%";
    $sql = "SELECT * FROM Product WHERE Name LIKE ?";
    $stmt = $con->prepare($sql);
    $stmt->bind_param("s", $productName); 
    $stmt->execute();
    $result = $stmt->get_result();

    $products = [];
    while ($row = $result->fetch_object()) 
    { $products[] = $row; }

    $result->free();
    $con->close();
    return $products;
}

function getCategory() {

    $con = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
    $sql = "SELECT * FROM Category";
    $result = $con->query($sql);

    while ($row = $result->fetch_object()) 
    { $category[] = $row; }

    $result->free();
    $con->close();
    return $category;
}

function getProductsByCateID($category_ID){
    
    $con = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
    $categoryID = (int)$category_ID;
    $sql = "SELECT ProductID FROM ProductCategory WHERE CategoryID = ?";
    $stmt = $con->prepare($sql);
    $stmt->bind_param("i", $categoryID); 
    $stmt->execute();
    $result = $stmt->get_result();

    $productIDs = [];
    while ($row = $result->fetch_object()) { $productIDs[] = $row->ProductID;}

    $products = [];
    if($productIDs != null){
        $IDs = implode(',',$productIDs);
        $sql = "SELECT * FROM Product WHERE ID IN ($IDs)";
        $result = $con->query($sql);

        while ($row = $result->fetch_object()) 
        { $products[] = $row; }
    }
    
    $result->free();
    $con->close();
    return $products;
}

function getProductCategories($productID){

    $con = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
    $sql = "SELECT CategoryID FROM ProductCategory WHERE ProductID = $productID";
    $result = $con->query($sql);

    $categoriesID = [];
    while ($row = $result->fetch_object()) 
    { $categoriesID[] = $row->CategoryID; }

    $categories = [];
    if($categoriesID != null){
        $IDs = implode(',',$categoriesID);
        $sql = "SELECT * FROM Category WHERE ID IN ($IDs)";
        $result = $con->query($sql);

        while ($row = $result->fetch_object()) 
        { $categories[] = $row; }
    }

    $result->free();
    $con->close();
    return $categories;
}

