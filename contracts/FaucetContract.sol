// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Faucet {
    // this is a special function
    // its called when you make a tx that doesn't specify
    // function name to call
    // External function are part of the contract interface
    // which means they can be called via contracts and other tx

    uint public numOfFunders;
    mapping(uint => address) public funders;

    receive() external payable {}

    function addFunds() external payable {
        uint index = numOfFunders++;
        funders[index] = msg.sender;
    }

    function justTesting() external pure returns (uint) {
        return 2 + 2;
    }

    // function getAllFunders() external view returns (address[] memory) {
    //     return funders;
    // }

    function getAllOfFunders() external view returns (address[] memory) {
        address[] memory _funders = new address[](numOfFunders);
        for (uint i = 0; i < numOfFunders; i++) {
            _funders[i] = funders[i];
        }

        return _funders;
    }

    function getFunderAtIndex(uint index) external view returns (address) {
        return funders[index];
    }

    // pure, view - read-nly call, no gas free
    // view - it indicatees that the function will not alter  the storage state in any way
    // pure - even more strict, indicating that it wont even read the storage state

    //  Transactions (can generate state changes ) and require gas fee
    // readonly call, no gas fees

    // to talk to the node on the network you can make JSON RPC
}

// const instance = await Faucet.deployed();
// instance.addFunds({from:accounts[0], value:"2000000"});
// instance.addFunds({from:accounts[1],value:"20000000"});
// instance.getFunderAtIndex(0)
// instance.getAllOfFunders();
