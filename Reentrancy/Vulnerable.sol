// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Vulnerable {

    // state variable
    mapping(address => uint256) public balances;

    // deposit funds
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance);

        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "Transfer failed");
        balances[msg.sender] -= _amount;
    }

    
}