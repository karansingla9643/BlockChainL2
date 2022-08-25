//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7; // ^0.8.7 means any version greater than 0.8.7 // >=0.8.7 <0.9.0 selects a range

contract SimpleStorage{ // It tells solidity its a contract or it act similar to a class 
    //boolean, int, uint -> whole number which is positive, address, bytes
    int a = 5;
    string name = "karan";
    uint256 x = 256; //uint256 it shows bytes
    address myAddress = 0x74dCD8d37A0195b80719d28bf7b8A2200E52A57F;
    bytes32 favoriteBytes = "cats"; // bytes32 ->0x12467849
    uint256 public favoriteNumber; //by default 0

    struct People {
        uint256 favoriteNumber;
        string name;
    }
    People[] public people;

    mapping(string => uint256) public nameToFavoriteNumber;
    
    function store(uint256 val) public {
        favoriteNumber = val;
        // retrieve(); // in this it will cost gas
        // b++;
    }
    // view functions are for read thats why no gas is used and there color is blue
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }
    // pure read is not possible, it runs codes which doesnt need any read. No gas
    // function add() public pure returns(uint256){
    //     return (1+1);
    // }

    //calldata are variables that can't be modified
    // memory are variables that can be modified
    // storage are permanent variables that can be modified
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}  
