//SPDX License-Identifier:MIT
pragma solidity ^0.8.19;

contract simpleStorage3{

    // mapping of name to wallet balance
    mapping(string => uint) public nameToBalance;

    function show(string memory _name, uint _bal) public {
        nameToBalance[_name] = _bal;
    }
}