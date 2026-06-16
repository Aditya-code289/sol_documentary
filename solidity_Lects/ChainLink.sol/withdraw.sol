//SPDX License-Identifier:MIT;
pragma solidity ^0.8.19;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract fundMe{

    address[] public Sender_contract;
    address owner;
    uint min_usd = 1e18;   // 1 USD = 0.005 ETH

    function fetch_price() public view returns(uint) {
        //Adderess: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //ABI
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int price,,,) = priceFeed.latestRoundData();

        return uint(price*1e10);
    }

    function conversion(uint eth_amt) public view returns(uint){
        uint result = (eth_amt * fetch_price())/1e18;
        return result;
    }

    function get_fund() public payable{
        require(conversion(msg.value) >= min_usd, "Not enough emount");
        Sender_contract.push(msg.sender);
    }

    constructor(){ 
        owner = msg.sender;
    }

    modifier onlyOwner{
        require(msg.sender == owner, "Not Owner");
        _;
    }

    function withdraw() public payable onlyOwner{

        // Transfer
        // payable(msg.sender).transfer(address(this).balance);

        // call
        (bool success,) =payable(msg.sender).call{value: address(this).balance}("");
        require(success, "failed");
    }

}
