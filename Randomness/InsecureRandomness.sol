// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
* @dev the use of insecure randomness like
* @param `block.timestamp` is not recommened 
* Instead use chanlink VRF to manage randomness
*/

contract InsecureRandomness {

    // get random number
    function getRandomNumber() public view returns(uint256) {
        return uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty)));
    }
}