pragma solidity ^0.4.0;
import "./main.sol";
contract inventory is ERC20{
    string s="S";
    address owner;
    uint public count=0;
    struct invent{
        uint[] id;
        uint[] price;
        bytes32[] proName;
        uint[] avail;
        bytes32[] name;
        uint[] phno;
    }
    mapping(string=>invent) m;
    function inventory() public{
        owner=msg.sender;
    }
    modifier onlyOwner(){
        require( owner == msg.sender);
        _;
    }
    function ProductDetails(uint _id,uint _price,bytes32 _proName,uint _avail)onlyOwner public {
        m[s].id.push(_id);
        m[s].price.push(_price);
        m[s].proName.push(_proName);
        m[s].avail.push(_avail);
            count=count+1;
    }
    function totalProducts() public view returns(uint){
        return count;
    }
    function AvailableProducts() public view returns(uint[],uint[],bytes32[],uint[]){
        return (m[s].id,m[s].price,m[s].proName,m[s].avail);
    }
    function userDetails(bytes32 _name,uint _phno) public{
        m[s].name.push(_name);
        m[s].phno.push(_phno);
    }
    function GetProducts(uint _id,bytes32 _proName,uint count)public returns(bool){
        for(uint i=0;i<m[s].id.length;i++){
            if(_id == m[s].id[i] && count != 0 && count <= m[s].avail[i] ){
                uint amount=m[s].price[i] * count;
                    m[s].avail[i]=m[s].avail[i]-1;
                    transfer(owner,amount);
                    return true;
            }
        }
    }
    function EtherSend() public payable{
        uint etherValue= msg.value * 100;
        uint value=  etherValue / 1 ether;
         balances[msg.sender] = balances[msg.sender].add(value);
        balances[owner] = balances[owner].sub(value);
    }
}

