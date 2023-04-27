// this will eventually contain something working

<?php
    // always close line with ;


    $Var = ""; // variable declarations with key $
    $Number = 0;
    $Table = array(true, false, 1); // horrific
    $FunctionNumber = 0;
    

    if is_string($Var) { // ALL if statements are ran with {} instead of Lua's * then *
        echo " String ";
    }

    while($Number <= 10) { // this makes sense while looping, no wait? no crash?
        echo $Number;
        $Number += 1; // I'm not sure if this works bc of the += op, hopefully it does else just replace with $Number = $Number + 1
    }

    foreach ($Table as $Value) { // for loop through table weird but makes sense
        echo $Value;
    }

    function getgc() { // function create 
        global $FunctionNumber;
        echo $FunctionNumber;
    }

    function getreg($Argument1, $Argument2) { // this the most retarded shit, having to name the arg passed as a variable... 
        echo $Argument1 + $Argument2;
    }

    getgc(); // calling works the same was as lua
    getreg(1500, 4100);
?>
