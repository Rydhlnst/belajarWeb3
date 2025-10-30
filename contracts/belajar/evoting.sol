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
    mapping(address => bool) public userSudahMemilih;

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
        require(!userSudahMemilih[msg.sender], "Anda sudah voting");
        require(_urutanKandidat < kandidat.length, "Kandidat tidak ada");
        require(msg.sender != owner, "Owner ga boleh voting");
        kandidat[_urutanKandidat].jumlahSuara++;
        userSudahMemilih[msg.sender] = true;
    }

    function siapaYangMenang() public view returns(address, uint) {
        require(!sudahBisaVoting, "Masih proses voting");
        require(kandidat.length >= 2, "Kandidat kurang");

        uint suaraTertinggi = 0;
        uint indexPemenang = 0;

        for(uint i = 0; i < kandidat.length; i++) {
            if (kandidat[i].jumlahSuara > suaraTertinggi) {
                suaraTertinggi = kandidat[i].jumlahSuara;
                indexPemenang = i;
            }
        }

        return (kandidat[indexPemenang].alamatKandidat, kandidat[indexPemenang].jumlahSuara);
    }

}