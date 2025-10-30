// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Kontrak {

    // string public nama;

    // constructor(string memory _nama) payable {
    //     nama = _nama;
    // }

    // function cekSaldo() public view returns(uint) {
    //     return address(this).balance;
    // }

    uint public level = 1;
    uint public uang = 5000;

    function levelUp() public {
        require(uang >= 5000, "You don't have enough money");
        level++;
        uang-=5000;
    }

    // Global Value
    function cekAddress() public view returns(address) {
        return msg.sender;
    }

    function topUp() public payable returns(uint) {
        return msg.value;
    }
}