// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
* @dev Use some secure randomness sources like Chainlink VRF 
* @param to solve the problem of randomness insecurity 
*/

import { VRFConsumerBase } from "@chanlink/contracts/src/v0.8/VRFConsumerBase.sol";

contract SecureRandomNumberConsumer is VRFConsumerBase {

    // state variables
    bytes32 internal keyHash;
    uint256 internal fee;

    // initialize contract
    constructor(address _vrfCoordinator, address _linkToken, bytes32 _keyHash, uint256 _fee) 
    VRFConsumerBase(_vrfCoordinator, _linkToken) public {
        keyHash = _keyHash;
        fee = _fee;
    }

    // Get random number
    function getRandomNumber() public view returns(bytes32 requestId) {
        return requestRandomness(keyHash, fee);
    }

    // fullfil randomness
    function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
        // use the random number generated

    }

}