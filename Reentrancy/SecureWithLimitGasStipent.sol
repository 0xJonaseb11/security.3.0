// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SecureWithGasLimited {

    // state variables
    mapping(address => uint256) public balances;

    // deposit funds
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    // withdraw funds
    function withdraw(uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balances!");
        balances[msg.sender] -= _amount;
        (bool success, ) = msg.sender.call{value: _amount, gas: 2300}("");
        require(success, "Transfer failed!");
    }
}