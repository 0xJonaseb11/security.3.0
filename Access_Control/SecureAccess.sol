// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
* @dev use @openzeppelin ownable contract to achieve acces control

 */
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

contract SecureAccess is Ownable {
    
    function changeOwner(address _newOwner) public onlyOwnable {
        // utilize _transferOwnership function to control ownershipt correctly
        transferOwnership(_newOwner);
    }
}