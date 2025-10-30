// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract belajarFunction {
    uint[] public numbers = [1, 2, 3, 4];

    function addNumber(uint _number) public {
        numbers.push(_number);
    }

    function getNumber(uint _index) public view returns(uint) {
        return numbers[_index];
    }

    function getNumbers() public view returns(uint[] memory) {
        return numbers;
    }

    function say(string memory _teks) public pure returns(string memory) {
        return _teks;
    }
    
    function say2(string calldata _teks) public pure returns(string calldata) {
        return _teks;
    }

    function kirimETH() public payable {}
}