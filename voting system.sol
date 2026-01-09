// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.5.0 <0.9.0; 

contract SimpleVoting {

    uint public votes1;
    uint public votes2;

    mapping(address => bool) public hasVoted;

    address public owner;
    bool public isVotingOpen;
    constructor() 
    {
        owner = msg.sender;  
        isVotingOpen = true;    
    }

    function setVotingStatus(bool _status) public {
        require(msg.sender == owner, "Only admin can do this.");
        isVotingOpen = _status;
    }

    function vote(uint _candidateId) public {
        require(isVotingOpen == true, "Sorry, voting is currently closed.");

        require(hasVoted[msg.sender] == false, "You have already voted!");

        require(_candidateId == 1 || _candidateId == 2, "Invalid candidate ID.");

        hasVoted[msg.sender] = true;

        if (_candidateId == 1) {
            votes1 = votes1 + 1;
        } else {
            votes2 = votes2 + 1;
        }
    }

    function getVotes() public view returns (uint, uint) {
        return (votes1, votes2);
    }
}