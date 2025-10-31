// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Hewan {
    function berjalan() public pure virtual returns(string memory) {
        return "Berjalan ";
    }
}

contract Kucing is Hewan {
    function berjalan() public pure override returns(string memory) {
        string memory _berjalan = super.berjalan();
        return string.concat(_berjalan, "dengan 4 kaki");
    }
}

contract Ayam is Hewan {
    function berjalan() public pure override returns(string memory) {
        string memory _berjalan = super.berjalan();
        return string.concat(_berjalan, "dengan 2 kaki");
    }
}

contract A {
    function sayA() internal pure returns(string memory) {
        return "A";
    }
}

contract B {
    function sayB() internal pure returns(string memory) {
        return "B";
    }
}

contract Gabungan is A, B {
    function sayAB() public pure returns(string memory){
        return string.concat(sayA(), sayB());
    }
}