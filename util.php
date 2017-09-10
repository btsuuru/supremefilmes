<?php

 function sanitize($string, $conn){
    $string = mysqli_real_escape_string($conn, $string);
    $string = htmlentities($string);
    return $string;
 }

 function sanitize_unsafe($value) {
     $search = array("\\",  "\x00", "\n",  "\r",  "'",  '"', "\x1a");
     $replace = array("\\\\","\\0","\\n", "\\r", "\'", '\"', "\\Z");
     return str_replace($search, $replace, $value);
 }

function getHtml($tag, $value, $attr=""){
     return "<$tag $attr>$value</$tag>";
 }

function h1($value){
     return getHtml("h1",$value);
 }

function hidden($name, $value){
   return "<input type='hidden' name='$name' value='$value'/>";
}

function fromPost($var){
    if (isset($_POST[$var]))
      return sanitize_unsafe($_POST[$var]);
}

function fromGet($var){
   if (isset($_GET[$var]))
      return sanitize_unsafe($_GET[$var]);
}

?>
