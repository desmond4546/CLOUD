<?php

function validateUsername($username){
    
    if(isNull($username)){
        return "Please enter your <b>Username</b>.";
    }else if (strlen($username) > 20 || strlen($username) < 3){
        return "<b>Invalid Username</b>, must be in length between <b>3</b> and <b>20</b>";
    }else if(checkDuplicateUsername($username)== true){
        return "<b>Duplicated Username</b>, please try another username!";
    }
}

function checkDuplicateUsername($username){
    
    $exist = false;
    $con = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
    $username = $con->real_escape_string($username);
    $sql = "SELECT * FROM account WHERE username = '$username'";
    if ($result = $con->query($sql)) {
        if ($result  -> num_rows > 0) {
            //record found
            $exist = true;
            }
        }
    $result->free();
    $con->close();
    return $exist;
}

function validatePassword($password){
    
    if(isNull($password)){
        return "Please enter your <b>Password</b>.";
    } else if(strlen($password) <8 || strlen($password) > 20){
        return "<b>Invalid Password</b>, must be in length between <b>8</b> and <b>20</b>";
    }
}

function validateConPassword($password, $conPassword){
    
    if($password != $conPassword){
        return "<b>Password NOT Match</b>, password and confirm password did not match!";
    }
}

function isNull($String){
    return (strlen($String) == 0 || $String == "" || $String == null);
}

function validateName($name){
    
    if(isNull($name)){
        return;
    }else if(strlen($name) >= 50){
        return "Name must below length of <b>50</b>";
    }else if(!preg_match("/^[a-zA-Z\s]+$/", $name)) {
        return "Name must contain only <b>letters</b> and <b>spaces</b> (no numbers or special characters).";
    }
}

function validateEmail($email){
    
    //If null then no error
    if(!isNull($email)){
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            return "<b>Invalid Email</b>, please enter the email in a correct format";
        }
    }
}

function validateIC($ic){
    
    if(isNull($ic)){return;}
    
    // Remove any hyphens
    $ic = str_replace('-', '', $ic);

    // Check length and numeric
    if (strlen($ic) !== 12 || !ctype_digit($ic)) {
        return "<b>Invalid IC Format</b>, please enter a 12 digits number.";
    }

    // Validate date portion (first 6 digits)
    $dob = substr($ic, 0, 6);
    $year = intval(substr($dob, 0, 2));
    $month = intval(substr($dob, 2, 2));
    $day = intval(substr($dob, 4, 2));

    // Handle year (assume 1900-1999 for 50–99, and 2000–2099 for 00–49)
    $year += ($year >= 50) ? 1900 : 2000;

    // Check if date is valid
    if (!checkdate($month, $day, $year)) {
        return "<b>Invalid IC Format</b>, please enter a real IC number.";
    }
}