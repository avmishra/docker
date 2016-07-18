<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
class Parentc {
    protected static $inst;
     
    public static function getInstance($name){
        static::$inst = $name;
    }
    
    public static function getName() {
        echo static::$inst;
    }
}

class Childc extends Parentc {
    protected static $inst;

}


Parentc::getInstance('par');
Childc::getInstance('chil');
echo Parentc::getName();
echo Childc::getName();

?>