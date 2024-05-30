// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// use correct error hanling techniques to provide informative statements

contract SecureErrorHandling {

    // state varibles
    mapping(address => uint256) public balances;

    function withdraw(uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balances");
        balances[msg.sender] -= _amount;

        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "Transfer failed");
    }
}