// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract VulnerableDEX {

    mapping(address => uint256) public tokenBalances;
    uint256 public tokenPrice; // Price of token A in terms of Token B

    event TradeExecuted(address indexed trader, uint256 amountIn, uint256 amountOut);

    // set token price
    function setTokenPrice(uint256 _price) external {
        tokenPrice = _price;

    }

    function trade(uint256 amountIn, uint256 minAmountOut) external {
        uint256 amountOut = getAmountOut(amountIn);
        require(amountOut >= minAmountOut, "Slippage too high");

        tokenBanances[msg.sender] -= amountIn;
        tokenBalances[msg.sender] += amountOut;

        emit TradeExecuted(msg.sender, amountIn, minAmountOut);
    }

    // get amount out
    function getAmountOut(uint256 amountIn) public view returns(uint256) {
        return amountIn * tokenPrice;
    }

}    