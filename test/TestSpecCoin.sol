pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/SpecCoin.sol";

contract TestSpecCoin {
    SpecCoin specCoin = SpecCoin(DeployedAddresses.SpecCoin());

    function testInitialBalanceUsingDeployedContract() public {
        uint256 expected = 64000;
        uint256 result = specCoin.getBalanceOf(msg.sender);
        
        Assert.equal(result, expected, "Deploying contract should have total supply");
    }

    /**
     * string - Error thrown in command line interface 'expected type string storage pointer'
     */
    // function testNameOfCoin() public {
    //     string expected = "SpecCoin";
    //     string result = specCoin.getName();

    //     Assert.equal(result, expected, "Returning name is SpecCoin");
    // }

    // function testReturnSymbolOfSpecCoin() public {
    //     string expected = "SP";
    //     string result = specCoin.symbol;

    //     Assert.equal(result, expected, "Returning symbol of coin should be 'SP'");
    // }
}