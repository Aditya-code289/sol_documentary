//SPDX License-Identifier: MIT;
pragma solidity ^0.8.19;

import {simpleStorage} from "../basics/arrays02.sol";

contract contract_factory{
    simpleStorage public contract1;
    simpleStorage[] public storingAddress;

    function deploy() public {
        contract1 = new simpleStorage();  
        storingAddress.push(contract1);
        // other method is create address typed array and storingAddress.push(address(contract1))
    }

}
