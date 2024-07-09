// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandling {
    address public contractOwner;
    uint public contractBalance;

    constructor() {
        contractOwner = msg.sender;
        contractBalance = 0;
    }

    // Function to deposit Ether into the contract
    function depositFunds() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        contractBalance += msg.value;
    }

    // Function to withdraw Ether from the contract
    function withdrawFunds(uint withdrawalAmount) public {
        require(msg.sender == contractOwner, "Only the owner can withdraw");
        require(withdrawalAmount <= contractBalance, "Insufficient balance");

        contractBalance -= withdrawalAmount;

        (bool success, ) = msg.sender.call{value: withdrawalAmount}("");
        require(success, "Withdrawal failed");
    }

    // Function to check the contract's invariant
    function checkContractInvariant() public view {
        assert(contractBalance >= 0);
    }

    // Function to demonstrate the use of revert
    function demonstrateRevert() public pure {
        revert("This is a revert example");
    }  
}
