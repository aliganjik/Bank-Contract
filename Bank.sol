// SPDX-License-Identifier: MIT

pragma solidity >=0.4.22 <0.9.0;

contract Bank {                                       // this contract has a simple bank

    mapping(address => uint256) public userBalance;   // balances, indexed by addresses
    mapping(address => bool) public userExists;       // Check user availability
    uint256 amount;
    
    // To find out if the user has an account or not
    // If not, make it
    function creationAccount() public payable returns(string memory) {  
        require(userExists[msg.sender] == false, "account already created");
        userBalance[msg.sender] = 0;
        userExists[msg.sender] = true;
        return "account created";
    }
    // Send address
    function deposit() public payable {
        
        require(userExists[msg.sender] == true, "account not created");
        userBalance[msg.sender] += msg.value;            
        

    }
    // Receive the recipient's address and enter the amount of Ether sent
    function withdraw(address payable _toAddress, uint256 _amount) public payable returns(string memory) {
        amount == _amount;
        require(userExists[msg.sender] == true, "account not created");
        require(userBalance[msg.sender] >= amount , "not enough ether");
        userBalance[msg.sender] -= amount;     // First deducted from inventory then sent 
        _toAddress.call{value: amount};
        return "Withdrawal Succesfully";
        
    }

    function getBalance() public view returns(uint256) {
        return userBalance[msg.sender];
    }

    function getExist() public view returns(bool) {
        return userExists[msg.sender];
    }
     
     
}