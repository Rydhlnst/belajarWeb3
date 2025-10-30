// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Belajar6 {
    address owner;
    uint public number;

    event updateNumber(uint newNumber);

    constructor() {
        owner = msg.sender;
        number = 10;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Anda bukanlah owner");
        _;
    }

    function ubahNumber(uint _number ) public onlyOwner {
        number = _number;
        emit updateNumber(_number);
    }
}