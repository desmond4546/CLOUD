<?php
    session_start();
    
    require_once '../../Backend/env.php';
    require "../../Backend/CartBackend.php";
    require "../../Backend/ProductBackend.php";
    
    if(!isset($_SESSION['LoggedUser'])){
        header("Location: Home.php");
    }
    else if(!isset($_POST['key'])){
        header("Location: Cart.php");
    }
    
    $cart = getCart();
    $cart = array_filter($cart);
    
    if(empty($cart)){
        header("Location: Cart.php");
    }
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../Style/css/bootstrap/bootstrap.css">
        <link rel="stylesheet" href="../Style/css/style.css">
        <title>Payment</title>
    </head>
    <body class="bg-light">
   
        <?php include "Header.php" ?>
        
        <div class="shadow-sm rounded p-3 bg-white mt-4 container-lg d-flex flex-column">
            <div class="mx-auto row order-2 w-100">
                <div class="col-lg-8">
                    <form class="border rounded shadow-sm p-2 mt-4 mt-sm-0 container-sm <?php echo (empty($cart))?"d-none":""?>">
                    </form>
                </div>
                <?php if(empty($cart)){
                    printf(
                        '<div class="notification bg-danger shadow-sm text-white w-100 rounded px-4 py-2 my-1 justify-content-between" id="notiContainer">
                            <p><b>%s</b></p>
                            <p onclick="hideContainer(\'%s\')" style="cursor:pointer;"><b>X</b></p>
                        </div>',
                        'There is empty in your cart!',
                        'notiContainer'
                    );
                }?>
                <div class="col-lg-4">
                    <div class="border rounded shadow-sm p-2 mt-4 mt-sm-0 container-sm <?php echo (empty($cart))?"d-none":""?>">
                        <table class=" w-100">
                            <tr>
                                <th><p>No.</p></th>
                                <th><p>Product Name</p></th>
                                <th class="text-center"><p>Quantity</p></th>
                                <th class="text-center"><p>Amount (RM)</p></th>
                            </tr>
                            <tr>
                                <td colspan="4"><hr class="my-2"></td>
                            </tr>
                            <?php
                                $index = 0;
                                $subtotal = 0.0;

                                foreach($cart as $productID => $quantity){

                                    $product = getProductByID($productID);
                                    $index++;
                                    printf(
                                       '<tr class="text-gray">
                                            <td><p>%d</p></td>
                                            <td><p>%s</p></td>
                                            <td class="text-center"><p>%d</p></td>
                                            <td class="text-center"><p>%.2f</p></td>
                                        </tr>',$index,$product['Name'],$quantity, $product['Price'] * $quantity);
                                    $subtotal += $product['Price'] * $quantity;
                                 }
                            ?>
                            <tr>
                                <td colspan="4"><hr class="my-2"></td>
                            </tr>
                            <tr>
                                <th colspan="3"><p>Sub-Total</p></th>
                                <td class="text-center text-gray"><p><?php printf("%.2f",$subtotal)?></p></td>
                            </tr>
                            <tr>
                                <th colspan="3"><p>SST Tax (10%)</p></th>
                                <td class="text-center text-gray">
                                    <p>
                                        <?php 
                                            $tax = $subtotal *0.1;
                                            printf("%.2f",$tax)
                                        ?>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <th colspan="3"><p>Shipping Fees (5%)</p></th>
                                <td class="text-center text-gray">
                                    <p>
                                        <?php 
                                            $shippingFees = ($subtotal >= 1000)?0:$subtotal *0.05;
                                            printf("%.2f",$shippingFees)
                                        ?>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <th colspan="3"><p>VIP Discount</p></th>
                                <td class="text-center text-gray">
                                    <p>
                                        <?php
                                            $discount = 0;
                                            printf("- %.2f",$discount);
                                        ?>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4"><hr class="my-2"></td>
                            </tr>
                            <tr>
                                <th colspan="3"><p>Total</p></th>
                                <td class="text-center text-gray">
                                    <p>
                                        <?php 
                                            $total = $subtotal + $tax + $shippingFees - $discount;
                                            printf("RM %.2f",$total)
                                        ?>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4"><hr class="my-2"></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <form action="Payment.php" method="POST">
                                        <input type="hidden" name="key" value="key"><!--Use this to confirm payment page link from here-->
                                        <input type="submit" class="btn btn-primary w-100" value="Pay">
                                        <a href="Cart.php" class="btn btn-dark w-100 mt-2">Back</a>
                                    </form>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
       </div>
    </body>
</html>
