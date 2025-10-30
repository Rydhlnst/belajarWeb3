// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract belajarStruct {
    struct orang {
        string nama;
        uint umur;
        string makananFavorit;
    }

    // orang public nanda = orang("Nanda", 20, "Cewe");
    // orang public riyan = orang("Riyan", 17, "Telur");

    string[] public humans = ["Nanda","Riyan","Faiq"];

    orang[] public heroes;
    // heroes.push(orang(""));

    function tambahOrang() public {
        heroes.push(orang("Riyan", 17, "Telur"));
    }

}