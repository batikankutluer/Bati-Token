/**
 *Submitted for verification at BscScan.com on 2021-10-29
*/

pragma solidity ^0.8.2;

contract Token {
    mapping(address => uint) public balances;
    mapping(address => mapping(address => uint)) public allowance;
    uint public totalSupply = 10000 * 10 ** 18;
    string public name = "BatiToken";
    string public symbol = "BTKN";
    uint public decimals = 18;
    
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
    
    constructor(){
        balances[msg.sender] = totalSupply;
    }
    
    function balanceOf (address owner) public view returns(uint){
        return balances[owner];
    }
    
    function transfer(address to, uint value) public returns(bool){
        require(balanceOf(tx.origin) >= value, 'balance too low');
        balances[to] += value;
        balances[tx.origin] -= value;
        emit Transfer(tx.origin, to, value);
        return true;
    }
    
    function transferFrom(address from, address to, uint value) public returns(bool) {
        require(balanceOf(from) >= value, 'balance too low');
        require(allowance[from][to] >= value, 'allowance too low');
        balances[to] += value;
        balances[from] -= value;
        emit Transfer(from, to, value);
        return true;
    } 
    
    function approve(address spender, uint value) public returns(bool){
        allowance[tx.origin][spender] = value;
        emit Approval(tx.origin, spender, value);
        return true;
    }
}
