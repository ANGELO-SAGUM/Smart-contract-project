# Smart Contract Project

## Description

This project demonstrates the implementation of error handling in Solidity smart contracts using require(), assert(), and revert() statements. The smart contract includes basic functions for depositing and withdrawing Ether, as well as examples of each error handling method. This project aims to provide a clear understanding of how to use these statements to ensure the security and correctness of smart contracts.

## Getting Started

### Installing

To get started with this project, follow these steps:

* Download the project repository from GitHub.
* No modifications are needed to be made to files/folders.

### Executing program

* Open the project in Remix IDE:
  // Go to Remix IDE.
  // Open the ErrorHandling.sol file in the Remix editor.
* Compile the contract:
  //In the Remix IDE, go to the "Solidity Compiler" tab. //Click "Compile ErrorHandling.sol".
* Deploy the contract:
  // Go to the "Deploy & Run Transactions" tab.
  // Ensure the correct contract (ErrorHandling) is selected.
  // Click "Deploy".
* Interact with the contract:
  // Use the deployed contract instance to call functions like deposit, withdraw, checkInvariant, and demoRevert.
Example commands in Remix: 
// Deposit 1 ether deposit({ value: web3.utils.toWei("1", "ether") })

// Withdraw 0.5 ether withdraw(web3.utils.toWei("0.5", "ether"))

// Check invariant checkInvariant()

// Trigger revert example demoRevert()
## Help

For common problems or issues:

// Ensure you have enough Ether in your account for transactions.
// Verify the correct contract address if interacting through external scripts.
// Check the Remix console for detailed error messages and stack traces.
## To get more information on using Remix IDE
```remix.help()```

## Authors

John Angelo Sagum
https://github.com/ANGELO-SAGUM


## License

This project is licensed under the MIT License - see the LICENSE.md file for details

Here is the Solidity code for the ErrorHandling contract:
```solidity
pragma solidity 0.8.18;

contract ErrorHandling {
    mapping(address => uint256) public balances;

    // Function to deposit Ether
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        balances[msg.sender] += msg.value;
    }

    // Function to withdraw Ether
    function withdraw(uint256 _amount) public {
        require(_amount > 0, "Withdrawal amount must be greater than 0");
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }

    // Function to demonstrate assert statement
    function checkInvariant() public pure {
        uint256 x = 5;
        assert(x == 5);
    }

    // Function to demonstrate revert statement
    function demoRevert() public pure {
        revert("Revert example");
    }
}



