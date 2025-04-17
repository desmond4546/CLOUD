<?php

function getCart(){
    
    $cart = [];
    
    if (isset($_COOKIE['cart'])) {
        $cart = json_decode($_COOKIE['cart'], true);
    }
    
    return $cart;
}

function addItemToCart($productID, $quantity){
    
    $cart = [];
    
    if (isset($_COOKIE['cart'])) {
        $cart = json_decode($_COOKIE['cart'], true);
    }
    
    if (isset($cart[$productID])) {
        $cart[$productID] += $quantity; // Increase quantity
    } else {
        $cart[$productID] = $quantity;  // Add new product
    }
    
    setcookie("cart", json_encode($cart), time() + 86400, "/");
    
    return $cart;
}

function removeItemFromCart($productID){
    
    if (isset($_COOKIE['cart'])) {
        $cart = json_decode($_COOKIE['cart'], true);

        // Remove product ID 
        unset($cart[$productID]);

        // Save the updated cart
        setcookie("cart", json_encode($cart), time() + 86400, "/");
    }
}

function removeItemQtyFromCart($productID, $quantity){
    
    $cart = [];
    
    if (isset($_COOKIE['cart'])) {
        $cart = json_decode($_COOKIE['cart'], true);
    }
    
    if (isset($cart[$productID])) {
        $cart[$productID] -= $quantity; // Remove quantity
    }
    
    if($cart[$productID] <= 0){
        removeItemFromCart($productID);
    }
    
    setcookie("cart", json_encode($cart), time() + 86400, "/");
    
}

function updateItemInCart($productID, $quantity){
    
    $cart = [];
    
    if (isset($_COOKIE['cart'])) {
        $cart = json_decode($_COOKIE['cart'], true);
    }
    
    if (isset($cart[$productID])) {
        $cart[$productID] = $quantity; // Update quantity
    }
    
    if($cart[$productID] <= 0){
        removeItemFromCart($productID);
    }
    
    setcookie("cart", json_encode($cart), time() + 86400, "/");
    
}
