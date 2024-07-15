# TOLL CONTRACT

This Solidity program is a simple toll contract that demonstrates the basic syntax and functionality of the Solidity programming language. The purpose of this program is to serve as a starting point for those who are new to Solidity and want to get a feel for how it works.

## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract has several functions that allow users to register vehicles, deposit tolls, pass through toll gates, and check their toll balances. This program serves as a simple and straightforward introduction to Solidity programming, and can be used as a stepping stone for more complex projects in the future.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a.sol extension (e.g., Toll.sol). Copy and paste the following code into the file:

```
// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Toll {
    struct Vehicle {
        address owner;
        uint tollBalance;
    }

    mapping (string => Vehicle) public vehicles;

    event TollGatePassed(string vehicle);

    function registerVehicle(string memory _vehicle, address _owner) public {
        require(vehicles[_vehicle].owner == address(0), "Vehicle already exists");
        vehicles[_vehicle].owner = _owner;
        vehicles[_vehicle].tollBalance = 0;
    }

    function depositToll(string memory _vehicle, uint _amount) public {
        require(vehicles[_vehicle].owner!= address(0), "Vehicle does not exist");
        vehicles[_vehicle].tollBalance += _amount;
    }

    function passThroughTollGate(string memory _vehicle) public {
        require(vehicles[_vehicle].owner!= address(0), "Vehicle does not exist");
        require(vehicles[_vehicle].tollBalance >= 10, "Toll balance must be at least 10");

        assert(vehicles[_vehicle].tollBalance >= 10);

        vehicles[_vehicle].tollBalance -= 10;

        emit TollGatePassed(_vehicle);
    }

    function checkTollBalance(string memory _vehicle) public view returns (uint) {
        require(vehicles[_vehicle].owner!= address(0), "Vehicle does not exist");
        return vehicles[_vehicle].tollBalance;
    }
}
```
To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.0" (or another compatible version), and then click on the "Compile Toll.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "Toll" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the various functions (e.g., registerVehicle, depositToll, passThroughTollGate, checkTollBalance). Click on the "Toll" contract in the left-hand sidebar, select the desired function, and then click on the "transact" button to execute the function.
## Authors

John Angelo Sagum


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
