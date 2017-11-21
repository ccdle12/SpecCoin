pragma solidity ^0.4.17;

contract SpecCoin {
    /**
     * Public variables of SpecCoin
     */
    string public name;
    string public symbol;
    uint8 public decimals = 18;
    uint256 public totalSupply;
    
    /**
     * Maps the balance of address to the balance
     */
    mapping(address => uint256) public balanceOf;


    /**
     * Generates an event on the blockchain that will notify clients
     */
    event Transfer(address indexed from, address indexed to, uint256 amount);
    event Burn(address indexed from, uint256 value);

    /**
     * Constructor - Don't know how to implement the decimals
     */
    function SpecCoin(uint256 initialSupply, string coinName, string tokenSymbol) public {
        totalSupply = initialSupply * 10;
        balanceOf[msg.sender] = totalSupply;
        name = coinName;
        symbol = tokenSymbol;
    }

    /**
     * Getters for public variables
     */
    function getBalanceOf(address inquireAddress) public view returns (uint256) {
        return balanceOf[inquireAddress];
    }

    function getName() public view returns (string) {
        return name;
    }

    function getSymbol() public view returns (string) {
        return symbol;
    }


    /**
     * Internal transfer, can only be called by this contract
     */
    function transfer(address from, address to, uint256 amount) internal { 
        //Check account being sent to is not an empty account
        require(to != 0x0);

        //Check sending addresse has enough funds to send amount
        require(balanceOf[from] >= amount);

        //Check for overflows?
        require(balanceOf[to] + amount > balanceOf[to]);

        //Subtract amount from sender
        balanceOf[from] -= amount;

        //Add amount to the recipient
        balanceOf[to] += amount;
        Transfer(from, to, amount);
     }


     /**
     * Transfer - transfer coins between accounts
     *
     * Send amount coins to the to address
     *
     * @param to The address of the recipient
     * @param amount The amount to send
     */
     function transfer(address to, uint256 amount) public {
         transfer(msg.sender, to, amount);
     }
}