//SPDX License-Identifier: MIT;
pragma solidity ^0.8.19;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract fundMe_usd{

    uint min_usd = 5;  
    address[] public address_sender;

    function get_fund() public payable {

        require(msg.value>=(min_usd), "Insufficient fund transfer");
        address_sender.push(msg.sender);
    }

    function get_price() public view returns(uint256) {
        
        // contract address required from chainlink of suitable crypto conversion;
        // here the contract address is 0x694AA1769357215DE4FAC081bf1f309aDC325306;

        // ABI is required- will use interface forr that

        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);

        (,int256  price,,,) =  priceFeed.latestRoundData();

        return uint256(price * 1e18);
    }

    

    function conversion(uint eth_amount) public view returns(uint) {

        uint eth_price = get_price();
        uint amt_in_usd = (eth_price * eth_amount) / 1e18;
        return amt_in_usd;
    }

}