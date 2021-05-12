pragma solidity ^0.8.0;

interface IMagicNumber {
    function setSolver(address _solver) external;
}

contract AttackMagicNumber {
    address magicAddress = YOUR_INSTANCE_ADDRESS;
    IMagicNumber magicContract = IMagicNumber(magicAddress);
    
    function pwn() public {
        bytes memory bytecode = hex"600a600c600039600a6000f3602a60005260206000f3";
        bytes32 salt = 0;
        address _solver;
        
        assembly {
            _solver := create2(0, add(bytecode, 0x20), mload(bytecode), salt)
        }
        
        magicContract.setSolver(_solver);
    }
}
