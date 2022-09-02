pragma solidity 0.7.5;

contract Ownable {
    address owner;

    
    modifier onlyOwner {
        require(msg.sender == owner);
        _; //run the function
    }
    
    
    constructor(){
        owner = msg.sender;
    }
}

contract Bank is Ownable{

    //storage = permanent storage of data (state variables)

    //memory - temporary storage used in function execution 

    //calldata - save arguments/inputs to our functions

    //strings, arrays, mappings, structs


    mapping(address => uint) balance;


    event depositDone(uint indexed amount, address indexed depositedTo);

    function deposit() public payable returns (uint){
        balance[msg.sender] += msg.value;
        emit depositDone(msg.value, msg.sender);
        return balance[msg.sender];
    }

    function withdraw(uint amount) public onlyOwner returns (uint){
        require(balance[msg.sender] >= amount);
        balance[msg.sender] -= amount;
        msg.sender.transfer(amount);
        return balance[msg.sender];
        
    }

    function getBalance() public view returns (uint){
        return balance[msg.sender];
    }

    function transfer(address recipient, uint amount) public {
        require(balance[msg.sender] >= amount, "Balance not sufficient");
        require(msg.sender != recipient, "Don't transfer money to yourself");

        uint previusSenderBalance = balance[msg.sender];

        _transfer(msg.sender, recipient, amount);

        assert(balance[msg.sender] == previusSenderBalance - amount);
    }

    function _transfer(address from, address to, uint amount) private {
        balance[from] -= amount;
        balance[to] += amount;
    }

}
