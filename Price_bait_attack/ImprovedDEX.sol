// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ImprovedDEX {

    mapping(address => uint256) public tokenBalances;
    uint256 public tokenPrice; // Price of token A in terms of B

    event TradeExecuted(address indexed trader, uint256 amountIn, uint256 amountOut);

    // set token price
    function setTokenPrice(uint256 _price) external {
        tokenPrice = _price;
    }

    function trade(uint256 amountIn, uint256 minAmountOut) external {
        uint256 amountOut = getAmountOut(minAmountOut);
        require(amountOut >= minAmountOut, "Slippage too high");
    }


}