// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

//This is the fake marketplace we will use for the DAO tokens
//Note this is way too simple for a real marketplace, but it is a good starting 
//point to use for our little DAO
contract FakeNFTMarketplace {
    //Create a map betweeen token ID and address of holder
    mapping(uint256 => address) public tokens;

    //Base price
    uint256 nftPrice = 0.1 ether;

    //Purchase method
    function purchase(uint256 _tokenId) external payable{
        //Make sure they have paid at least the base price
        require(msg.value >= nftPrice,"Must pay at least 0.1 ETH");
        //If that passes, assign the new address for that tokenId
        tokens[_tokenId] = msg.sender;
    }

    //A function to view the price
    function viewPrice() external view returns (uint256) {
        return nftPrice;
    }

    //A function to check if the token is available
    function available(uint256 _tokenId) external view returns(bool){
        if(tokens[_tokenId] == address(0)){
            return true;
        }
        //If the address != null address, it is already taken
        return false;
    }
}