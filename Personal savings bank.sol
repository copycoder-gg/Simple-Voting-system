// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.5.0 <0.9.0; 

contract Personal_Savings_Bank 
{

    address public owner_of_contract;

    constructor() 
    {
        owner_of_contract = msg.sender;
    }

    function deposit() public payable
    {
    }

    function getBalance() public view returns(uint)
    {
        return address(this).balance;
    }

    function withdraw(uint _amount) public 
    {
        require(msg.sender == owner_of_contract);

        require(_amount <= address(this).balance, "Insufficient Balance");

        (bool success, ) = owner_of_contract.call{value: _amount}("");
        require(success, "Failed");
    }
}