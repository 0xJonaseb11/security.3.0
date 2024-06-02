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

        tokenBalances[msg.sender] -= amountIn;
        tokenBalances[msg.sender] += amountOut;

        emit TradeExecuted(msg.sender, amountIn, amountOut);
    }

    function getAmountOut(uint256 amountIn) public returns(uint256) {
        /**
        * Use a time-weighed average price (TWAP) instead of current price 
        */
        return amountIn * getTWAP();
    }

    // getTWAP implementaion to mitigate the problem of price bait attack
    function getTWAP() public view returns(uint256) {
        /**
        * @dev this is a basic example use case
        * In a real scenario, this would be more complex, 
        * involving historical price data
        */
        return tokenPrice;
    }


}