//SPDX License-Identifier: MIT;
pragma solidity ^0.8.19;

import {simpleStorage} from "../basics/arrays02.sol";
import {skills} from "../RealProjects/skills.sol";
contract contract_factory{
    simpleStorage public contract1;
    skills public contract2;

    function deploy() public {
        contract1 = new simpleStorage();  
        contract2 = new skills();

        // new keyword deploys the imported contract, but it does not run the function which those contract contains
        // it just creates the address, and the state var created store the address. 
        // the bytecode is created and is stored onchian forever
        
    }

}


