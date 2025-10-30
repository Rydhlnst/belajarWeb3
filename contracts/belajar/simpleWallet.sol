// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract simpleWallet {
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    mapping(address => uint) private balances;

    event Deposit(address indexed user, uint amount);
    event Transfer(address indexed from, address indexed to, uint amount);
    event Withdraw(address indexed user, uint amount);

    // User dapat menyimpan salfo ke SC
    // User juga dapat melihat saldonya sendiri dan saldo user lain
    // User juga dapat menstranfer saldonya sendiri ke saldo user lain

    function _deposit() private {
        require(msg.value > 0, "Jumlah depo harus lebih besar dari 0");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function deposit() external payable {
        _deposit();
    }

    receive() external payable {
        _deposit();
    }

    fallback() external payable {
        _deposit();
    }

    // External ini buat luar seperti FE, SC lain
    function getUserBalance(address user) external view returns(uint) {
        return balances[user];
    }

    function getMyBalance() external view returns(uint) {
        return balances[msg.sender];
    }

    function transfer(address to, uint amount) external {
        require(balances[msg.sender] >= amount, "Saldo tidak cukup");
        require(to != address(0), "Address False");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
    }

    function withdrawal(uint amount) external {
        require(amount > 0, "Withdrawal minimal diatas 0");
        require(balances[msg.sender] >= amount, "Saldo kurang");

        balances[msg.sender] -= amount;

        (bool success,) = msg.sender.call{value: amount}("");
        require(success, "Transfer Gagal");
    }

}