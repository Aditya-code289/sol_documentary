//SPDX License-Identifier: MIT
pragma solidity ^0.8.19;

contract simpleStorage{

    struct info{
        string name;
        uint bal;
        uint nonce;
    }

    info[] public data_list; 

    function show(string memory _name, uint _bal, uint _nonce) public{//Infinite gas is being shown bcz string size is indefinite
        info memory newUser = info(_name, _bal, _nonce);
        data_list.push(newUser);
    }
    function show2(uint input) view public returns (string memory){ // USE MEMORY AHEAD OF STRING IN ARGUMENT, OTHERWISE IT WILL BE TOTAL ERROR****
        return (data_list[input].name); // view public and public view is same but writing public first is a good practice 
    }
}