var SpecCoin = artifacts.require("./SpecCoin.sol");

module.exports = function(deployer) {
    var initialSupply = 6400;
    var tokenName = "SpecCoin";
    var tokenSymbol = "SP";
    deployer.deploy(SpecCoin, initialSupply, tokenName, tokenSymbol);
}