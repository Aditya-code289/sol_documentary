//SPDX License-Identifier: MIT;
pragma solidity ^0.8.19;

// our target is to recieve tx in the contract, A contract can hold balance and owner can withdraw that balance 
// also we will put a condition to have min tx amount otherwise send user an error message 

contract fundMe{

    function get_fund() public payable{
        require(msg.value>1e18, "Not sufficient amount ");  // 1e18 basically means 1 eth, i.e 1e18 = 1ETH = 10**18 wei;
    }

    // function withdraw() public{}

}