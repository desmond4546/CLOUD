<?php
    session_start();
    
    require_once '../../Backend/env.php';
    require "../../Backend/CartBackend.php";
    require "../../Backend/ProductBackend.php";
    require "../../Backend/OrderBackend.php";
    require "../../Backend/TransactionBackend.php";
    require "../../Backend/AccountBackend.php";
    require_once '../../Backend/Validation.php';

    
    if(!isset($_SESSION['LoggedUser'])){
        header("Location: Home.php");
    }
    else if(!isset($_POST['key'])){
        header("Location: Cart.php");
    }
    
    $address = "";
    $cardNo = "";
    $cardHolder = "";
    $expDate = "";
    $cvv = "";
    
    $accountID = $_SESSION['LoggedUser']['ID'];
    $cart = getCart($accountID);
    $cart = array_filter($cart);
    
    if(empty($cart)){
        header("Location: Cart.php");
    }
    
    if (isset($_POST['pay'])) {
    $amount = $_SESSION['total'];
    $accountID = $_SESSION['LoggedUser']['ID'];

    $address = trim($_POST['address'] ?? "");
    $cardNo = trim($_POST['cardNo'] ?? "");
    $cardHolder = trim($_POST['cardholder'] ?? ""); // Your input name="name" not cardHolder
    $expDate = trim($_POST['expDate'] ?? "");
    $cvv = trim($_POST['cvv'] ?? "");

    // Call the validation function
    $paymentErrors = validatePaymentForm($address, $cardNo, $cardHolder, $expDate, $cvv);

    if (empty($paymentErrors)) {
        $validCard = true; // Assume it's valid for now

        if ($validCard) {
            $transactionID = createTransaction($cardNo, $amount);
            if ($transactionID != null) {
                $createdOrder = createOrder($address, $accountID, $transactionID, $cart);
            }
            $_SESSION['TotalSpend'] += $_SESSION['total'];
            updateMemberToVIP($accountID, $_SESSION['TotalSpend']);
            unset($_SESSION['total']);
        }

        if (isset($createdOrder) && $createdOrder == true) {
            foreach ($cart as $cartRow) {
                removeProductQty($cartRow->ProductID, $cartRow->Quantity);
            }
            clearCart($accountID);
            header("Location: OrderHistory.php");
            exit();
        } else {
            $paymentError = true;
        }
    }
}
    
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../Img/Logo/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="../Style/css/bootstrap/bootstrap.css">
        <link rel="stylesheet" href="../Style/css/style.css">
        <title>Payment</title>
    </head>
    <body class="bg-light">
   
        <?php include "Header.php" ?>
        <?php
//            if(isset($paymentError)){
//                printf(
//                    '<div class="notification bg-danger shadow-sm text-white w-100 rounded px-4 py-2 my-1 justify-content-between" id="notiContainer">
//                        <p><b>%s</b></p>
//                        <p onclick="hideContainer(\'%s\')" style="cursor:pointer;"><b>X</b></p>
//                    </div>',
//                    'Invalid Payment! Please try again later.',
//                    'notiContainer'
//                );
//            }
//        ?>
  <?php
if (!empty($paymentErrors)) {
    // Combine all errors into one string
    $combinedErrors = "<ul class='mb-0'>";
    foreach ($paymentErrors as $error) {
        $combinedErrors .= "<li>" . htmlspecialchars($error) . "</li>";
    }
    $combinedErrors .= "</ul>";

    printf(
        '<div class="notification bg-danger shadow-sm text-white w-100 rounded px-4 py-2 my-1 justify-content-between" id="notiContainer">
            <div><b>There were some problems:</b>%s</div>
            <p onclick="hideContainer(\'%s\')" style="cursor:pointer;"><b>X</b></p>
        </div>',
        $combinedErrors,
        'notiContainer'
    );
}
?>


        <form class="shadow-sm rounded p-3 bg-white mt-4 container-lg d-flex flex-column" action="Payment.php" method="POST">
            <div class="mx-auto row order-2 w-100">
                <div class="col-lg-8">
                    <div class="border rounded shadow-sm mt-4 mt-sm-0 container-sm p-3 <?php echo (empty($cart))?"d-none":""?>">
                        <h5 class="bg-light p-2 rounded shadow-sm mb-3"><img src="../Img/Icon/delivery.png" class="iconImg me-3">Delivery Address</h5>
                        <textarea name="address" placeholder="Address" class="w-100 border mb-5" required><?php echo htmlspecialchars($address); ?></textarea>

                        
                        <h5 class="bg-light p-2 rounded shadow-sm mb-3"><img src="../Img/Icon/card.png" class="iconImg me-3">Card Details</h5>
                        <div class="rounded shadow-sm bg-dark p-4 pb-5 text-white">
                            <div class="d-flex justify-content-end p-3 pe-2">
                                <img src="../Img/Icon/master.png" class="iconImg" style="transform: scale(2.5);">
                            </div>
                            <div class="mt-4">
                                <small>CARD NUMBER</small><br>
                                <input class="bg-dark text-white" type="text" name="cardNo" placeholder="XXXX XXXX XXXX XXXX" maxlength="16" value="<?php echo htmlspecialchars($cardNo); ?>">
                            </div>
                            <div class="row mt-3 text-white">
                                <div class="col col-sm-6">
                                    <small>CARD HOLDER</small><br>
                                    <input class="bg-dark text-white" type="text" name="cardholder" placeholder="NAME" maxlength="20" value="<?php echo htmlspecialchars($cardHolder); ?>">
                                </div>
                                <div class="col col-sm-5">
                                    <small>EXPIRED DATE</small><br>
                                    <input type="date" class="bg-dark text-white" name="expDate" value="<?php echo htmlspecialchars($expDate); ?>">
                                </div>
                                <div class="col col-sm-1">
                                    <small>CVV</small><br>
                                    <input type="password" class="bg-dark text-white" name="cvv" maxlength="3" placeholder="***" style="width: 3.5vh" value="<?php echo htmlspecialchars($cvv); ?>">
                                </div>
                            </div>
                        </div>
                    </div>
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

                                foreach($cart as $cartRow){

                                    $product = getProductByID($cartRow->ProductID);
                                    $index++;
                                    printf(
                                       '<tr class="text-gray">
                                            <td><p>%d</p></td>
                                            <td><p>%s</p></td>
                                            <td class="text-center"><p>%d</p></td>
                                            <td class="text-center"><p>%.2f</p></td>
                                        </tr>',$index,$product['Name'],$cartRow->Quantity, $product['Price'] * $cartRow->Quantity);
                                    $subtotal += $product['Price'] * $cartRow->Quantity;
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
                                            $_SESSION['total'] = $total;
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
                                    <div>
                                        <input type="hidden" name="key" value="key"><!--Use this to confirm payment page link from here-->
                                        <input type="submit" class="btn btn-primary w-100" name="pay" value="Pay">
                                        <a href="Cart.php" class="btn btn-dark w-100 mt-2">Back</a>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
       </form>
    </body>
    <script src="../Style/js/js.js"></script>
</html>
