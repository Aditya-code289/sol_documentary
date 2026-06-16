//SPDX License-Identifier:MIT;
pragma solidity ^0.8.19;

contract sp_fn{

    // implement receive() and fallback() functions 

    uint public result;
    address[] public info;

    receive() external payable{
        result = 1;
        info.push(msg.sender);
    }

    fallback() external payable{
        result = 2;
    }
}