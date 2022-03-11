//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract BoxUpgradeStateVariable is Initializable{
    uint256 private _value;
    address public _admin;

    event ValueChanged(uint256 value);

    function initialize(address admin) public initializer {
        _admin = admin;
    }

    constructor() initializer {}
    function store(uint256 value) public {
        require(_admin === msg.sender, "only admin can store a value");
        _value = value;
        emit ValueChanged(value);
    }

    function getValue() public view returns (uint256) {
        return _value;
    }

    function increment() public {
        _value = _value + 1;
        emit ValueChanged(_value);
    }
}
