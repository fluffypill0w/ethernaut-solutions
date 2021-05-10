pragma solidity ^0.6.0;

interface IPrivacy {
    function unlock(bytes16 _key) external;
}

contract attackPrivacy {
    address privacyAddress = YOUR_INSTANCE_ADDRESS;
    IPrivacy privacyContract = IPrivacy(privacyAddress);
    bytes16 key = YOUR_KEY;

    function pwn() public {
        address(privacyContract).call.gas(4000000)(abi.encodeWithSignature("unlock(bytes16)", key));
    }
}