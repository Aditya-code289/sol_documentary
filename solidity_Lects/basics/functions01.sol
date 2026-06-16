// SPDX License-Identifier: MIT
pragma solidity ^ 0.8.19;

contract simpleStorage{
    uint public bal;

    function upd_bal(uint _bal) public{
        bal=_bal + bal;
    }
    function show() public view returns(uint){
        return bal;
    }
    


}