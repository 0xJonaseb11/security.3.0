// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract InsecureAccess {

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function changeOwner(address _newOwner) public {
        owner = _newOwner; // no access control
    }
}