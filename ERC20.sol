pragma solidity ^0.4.0;
contract ERC20{
    address owner;
    string public name;
    string public symbol;
    uint public totalSupply;
    uint public decimals;
    mapping(address=>uint) public balances;
    function ERC20() public payable{
        name="token";
        totalSupply=5000;
        symbol="#";
        decimals=0;
        balances[msg.sender]=totalSupply;
        owner=msg.sender;
    }
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }
    function transfer(address to,uint256 amount)onlyOwner public {
        require(amount !=0 && amount <=balances[msg.sender]);
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
    function mint(uint256 amount)onlyOwner public{
        require(amount != 0 && amount <= balances[msg.sender]);
        balances[msg.sender] += amount;
    }
}
