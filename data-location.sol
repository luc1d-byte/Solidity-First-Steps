pragma solidity 0.7.5;

contract DataLocation{
    //storage - persistant data storage
    //memory = temporary data storage

    //state variables
    uint data = 123; //stored in storage
    string lastText = "Hello Filip";

    function isAFunction(string memory text) public{
        otherString = "oi oi oi bb"; //stored in memory
        lastText = text; //storage to memory

        
    }

}
