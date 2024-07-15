# ATM CONTTRACT

This Solidity program is a simple ATM contract that demonstrates the basic syntax and functionality of the Solidity programming language. The purpose of this program is to serve as a starting point for those who are new to Solidity and want to get a feel for how it works.

## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract has several functions that allow users to create accounts, deposit and withdraw funds, and check their account balances. This program serves as a simple and straightforward introduction to Solidity programming, and can be used as a stepping stone for more complex projects in the future.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., ATM.sol). Copy and paste the following code into the file:

```
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

        emit Withdrawal(_account, _amount);
    }

    function deposit(string memory _account, uint _amount) public {
        require(accounts[_account].owner == msg.sender, "Only the account owner can deposit");

        accounts[_account].balance += _amount;

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

        emit AccountCreated(_account);
    }

    event Withdrawal(string indexed _account, uint _amount);
    event Deposit(string indexed _account, uint _amount);
    event AccountCreated(string indexed _account);
}
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.18" (or another compatible version), and then click on the "Compile ATM.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "ATM" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the various functions (e.g., createAccount, deposit, withdraw, getBalance). Click on the "ATM" contract in the left-hand sidebar, select the desired function, and then click on the "transact" button to execute the function.
## Authors

John Angelo Sagum


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
