// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**

Checks-Effects-Interactions Pattern: 
Always update the contract’s state before making external calls. 
*/

contract Secure {

    // state variables
    mapping(address => uint256) public balances;

    // deposit funds
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    // withdraw funds
    function withdraw(uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;
        
        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "Transfer failed");

    }
}