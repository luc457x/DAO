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
}

contract poll {
    address public owner;
    uint public currentVoting = 0;
    Voting[] public votings;

    constructor(){
        owner = msg.sender;
    }

    function getCurrentVoting() public view returns (Voting memory) {
        return votings[currentVoting];
    }

    function addVoting(string[] memory optionsName, uint timeToVote) public {
        /* TODO: create a contract for a token and change the requirements so
        only token owners can create a poll and cast votes.        
        */
        require(msg.sender == owner, "Invalid sender");
        require(optionsName.length >= 1 && optionsName.length <= 4, "Number of options must be between 1 and 4");
        if(currentVoting != 0) currentVoting++;
        votings.push();
        Voting storage newVoting = votings[votings.length - 1];
        Option memory noOption = Option({
            name: "no/none",
            votes: 0
        });
        newVoting.options.push(noOption);
        for(uint i = 0; i < optionsName.length; i++) {
            // TODO: The javascript code needs to ensure that each given value don't exceed 32bytes.
            Option memory newOption = Option({
                name: optionsName[i],
                votes: 0
            });
            newVoting.options.push(newOption);
        }
        newVoting.maxDate = timeToVote + block.timestamp;
    }
}