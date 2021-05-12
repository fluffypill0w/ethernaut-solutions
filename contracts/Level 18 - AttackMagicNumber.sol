pragma solidity ^0.8.0;

interface IMagicNumber {
    function setSolver(address _solver) external;
}

contract AttackMagicNumber {
    address magicAddress = 0x0550EF1f26492f489d3638d82aF874a8Ff4088cA;
    IMagicNumber magicContract = IMagicNumber(magicAddress);
    
    function pwn() public {
        bytes memory bytecode = hex"600a600c600039600a6000f3602a60005260206000f3";
        address _solver;
        
        assembly {
            _solver := create2(0, add(bytecode, 0x20), mload(bytecode), 0)
        }
        
        magicContract.setSolver(_solver);
    }
}
