// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract VotingContract {
    mapping(address => uint256) public votes;
    uint256 public totalVotes;

    // Function to cast a vote
    function castVote(uint256 _vote) public {
        // Require vote to be either 0 or 1
        require(_vote == 0 || _vote == 1, "Invalid vote. Must be 0 or 1");

        // Increment total votes
        totalVotes++;

        // Set vote for the sender
        votes[msg.sender] = _vote;
    }

    // Function to get total votes
    function getTotalVotes() public view returns (uint256) {
        return totalVotes;
    }

    // Function to demonstrate assert statement
    function assertExample(uint256 _value) public pure returns (uint256) {
        // Assert that the value is even
        assert(_value % 2 == 0);
        return _value;
    }

    // Function to demonstrate revert statement
    function revertExample(uint256 _value) public pure returns (uint256) {
        // Revert if the value is negative
        if (_value < 0) {
            revert("Value cannot be negative");
        }
        return _value;
    }

    // Function to demonstrate custom error
    error InvalidVoteCount(uint256 count);

    function getVoteCount(address _user) public view returns (uint256) {
        uint256 count = votes[_user];
        if (count > 1) {
            revert InvalidVoteCount(count);
        }
        return count;
    }
}
