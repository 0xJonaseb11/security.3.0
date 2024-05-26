// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// use @openzeppelin reentrancy guard to secure contract
import { ReentrancyGuard } from "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract SecureWithGuard is ReentrancyGuard {

    // state variables
    mapping(address => uint256) public balances;

    // depost funds
    function deposit() public payable {
        balances[msg.sender] += _amount;
    }

    // withdraw funds
    // prevent reentrancy by nonReentrant modifier of @openzeppelin ReentrantGuard contract
    function withdraw(uint256 _amount) public nonReentrant {
        require(balances[msg.sender] >= _amount, "Insufficient balances!");
        balances[msg.sender] -= _amount;
        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "Transfer failed");
    } 
}