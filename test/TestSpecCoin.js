var SpecCoin = artifacts.require("SpecCoin");

contract("SpecCoin", function(accounts) {
    var testInstance;

    /**
     * Accounts - Deploying account and test accounts
     */
    var deployingAccount = accounts[0];
    var account1 = accounts[1];

    it ("Deploying contract should have total supply", function() {
        return SpecCoin.deployed().then(function(instance) {
            testInstance = instance;
            return instance.balanceOf(deployingAccount);
        }).then(function(val) {
            assert.equal(val, 64000, "Initial Supply not set or this is not the deploying contract address");
        });
    });

    it ("Name of coin should be 'SpecCoin'", function() {
        testInstance.getName().then(function(val) {
            assert.equal(val, "SpecCoin", "Name of coin is not initialized to SpecCoin");
        });
    });

    it ("Symbol of coin should be 'SP'", function() {
        testInstance.getSymbol().then(function(val) {
            assert.equal(val, "SP", "Symbol of coin is not initialized to SP");
        });
    });

    it ("Should transfer 1000 from deploying Account to account1", function() {
        testInstance.transfer(account1, 1000).then(function() {
            var account1Balance = testAccount.balanceOf(account1);

            assert.equal(account1Balance, 100, "1000SP was not transferred to account1");
        });
    });

});