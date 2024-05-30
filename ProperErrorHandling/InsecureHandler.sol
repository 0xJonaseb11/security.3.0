// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract InsecureErrorHandling {
    
    // state variables
    mapping(address => uint256) public balances;

    function withdraw(uint256 _amount) public {
        if (balances[msg.sender] < _amount) {
            return; // silent failure
        }
        balances[msg.sender] -= _amount;
        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "Transfer failed");
    }
}