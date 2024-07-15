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
