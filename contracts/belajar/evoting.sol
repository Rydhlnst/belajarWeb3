// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract eVoting {
    address public owner;
    bool sudahBisaVoting;

    constructor() {
        owner = msg.sender;
        sudahBisaVoting = false;
    }

    struct Kandidat {
        address alamatKandidat;
        uint jumlahSuara;
    }

    Kandidat[] public kandidat;

    mapping(address => bool) public kandidatTerdaftar;

    function tambahKandidat(address _alamatKandidat) public {
        require(msg.sender == owner, "Anda bukan owner");
        require(!kandidatTerdaftar[_alamatKandidat], "Kandidat sudah terdaftar");
        kandidat.push(Kandidat(_alamatKandidat, 0));
        kandidatTerdaftar[_alamatKandidat] = true;
    }

    function getTotalKandidat() public view returns(uint){
        return kandidat.length;
    }

    function handleVoting(bool _status) public {
        require(msg.sender == owner, "Anda bukan owner");
        sudahBisaVoting = _status;
    }

    function voting(uint _urutanKandidat) public {
        require(sudahBisaVoting, "Belum bisa voting");
        kandidat[_urutanKandidat].jumlahSuara++;
    }
}