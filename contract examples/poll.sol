// SPDX-License-Identifier: GPL-3.0

pragma solidity >0.8.21;

struct Option {
    // TODO: Change name type from string to byte32
    string name;
    uint votes;
}

struct Voting {
    Option[] options;
    uint maxDate;
    bool multi;
    address creator;
}

struct Vote {
    uint choice;
    uint date;
}

contract poll {
    address public owner;
    /* 
    TODO: Can I remove "CurrentVoting" var and replace for using "votings.length - 1" instead of
    checking this variable? 
    */
    uint public currentVoting = 0;
    Voting[] public votings;
    mapping(uint => mapping(address => Vote[])) private votes;

    constructor(){
        owner = msg.sender;
    }

    function getCurrentVoting() public view returns (Voting memory) {
        return votings[currentVoting];
    }

    function addVoting(string[] memory optionsName, uint timeToVote, bool multiVote) public {
        /* 
        TODO: Create a contract for a token and a require so only 
        token owners can create a poll and cast votes.
        TODO : Can I avoid using "arrays.push()" and instead use a fixed lenght array?       
        */
        require(optionsName.length >= 1 && optionsName.length <= 4, "Number of options must be between 1 and 4");
        votings.push();
        currentVoting = votings.length - 1;
        Voting storage newVoting = votings[votings.length - 1];
        newVoting.creator = msg.sender;
        Option memory noOption = Option({
            name: "no/none",
            votes: 0
        });
        newVoting.options.push(noOption);
        for(uint i = 0; i < optionsName.length; i++) {
            /* 
            TODO: If name var in Option struct is byte32 instead of string, 
            javascript code needs to ensure that each given value don't exceed 32bytes.
            */
            Option memory newOption = Option({
                name: optionsName[i],
                votes: 0
            });
            newVoting.options.push(newOption);
        }
        newVoting.maxDate = timeToVote + block.timestamp;
        newVoting.multi = multiVote;
    }

    function getOptionsLength() private view returns (uint) {
    return votings[currentVoting].options.length;
    }

    function vote(uint choice) public {
        require(choice < getOptionsLength(), "Invalid vote");
        require(getCurrentVoting().maxDate > block.timestamp, "No open votings");
        if (!getCurrentVoting().multi) {
        require(votes[currentVoting][msg.sender].length == 0, "You can't vote again");
    }
    Vote memory newVote = Vote({
        choice: choice,
        date: block.timestamp
    });
    votes[currentVoting][msg.sender].push(newVote);
    votings[currentVoting].options[choice].votes++;
    }

    function getVotingResults(uint votingIndex) public view returns (Option[] memory) {
    require(votingIndex < votings.length, "Invalid voting index");
    return votings[votingIndex].options;
    }

    function getMyVotes(uint votingIndex) public view returns (Vote[] memory) {
    require(votingIndex < votings.length, "Invalid voting index");
    return votes[votingIndex][msg.sender];
    }
}