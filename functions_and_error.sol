// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

contract ATM {
    struct Account {
        address owner;
        uint balance;
    }

    mapping(string => Account) public accounts;

    constructor() {
    }

    function withdraw(string memory _account, uint _amount) public {
        require(accounts[_account].owner == msg.sender, "Only the account owner can withdraw");
        require(accounts[_account].balance >= _amount, "Insufficient balance");

        accounts[_account].balance -= _amount;

        assert(accounts[_account].balance >= 0); // Check that balance is not negative

        emit Withdrawal(_account, _amount);
    }

    function deposit(string memory _account, uint _amount) public {
        require(accounts[_account].owner == msg.sender, "Only the account owner can deposit");

        accounts[_account].balance += _amount;

        assert(accounts[_account].balance >= 0); // Check that balance is not negative

        emit Deposit(_account, _amount);
    }

    function getBalance(string memory _account) public view returns (uint) {
        require(accounts[_account].owner != address(0), "Account does not exist");

        return accounts[_account].balance;
    }

    function createAccount(string memory _account) public {
        require(accounts[_account].owner == address(0), "Account already exists");

        accounts[_account].owner = msg.sender;

        accounts[_account].balance = 0;

        assert(accounts[_account].owner != address(0)); // Check that account owner is not zero

        emit AccountCreated(_account);
    }

    event Withdrawal(string indexed _account, uint _amount);
    event Deposit(string indexed _account, uint _amount);
    event AccountCreated(string indexed _account);
}
