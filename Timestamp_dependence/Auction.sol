// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Auction {


   /**
    * @dev this contract shows the vulnerability imposed by timestamp dependence
    * 
    * auctionEnd() function - vulnerable
    * 
    */
    function auctionEnd() public {
        require(now >= auctionEndTime, "Auction not ended");
        // end auction
    }

    /**
     * @dev Mitigate the timestamp dependence vulnerability
     * 
     * use block numbers instead
     */

    function auctionEnd__secure(uint256 endBlock) public {
        require(block.number >= endBlock, "Auction not yet ended");
        // end auction
    }
}