//SPDX License-Identifier: MIT;
pragma solidity ^0.8.19;

import {simpleStorage3} from "../basics/mapping03.sol";

contract storageFactory{

    simpleStorage3 public contractNew;

    function imp_fun(string memory name, uint bal) public{
        contractNew = new simpleStorage3();
        contractNew.show(name, bal);
    }

    function get_val(string memory namee) public view returns(uint){
        return contractNew.nameToBalance(namee);
    }


    
}