// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.7.0;

contract Hello{

    struct Person{
        string name;
        string surname;
        address addr;
    }

    mapping (address => Person) public map;
    
    function addPerson(string memory name, string memory surname, address addr) public{
        addr = msg.sender;
        map[addr] = Person(name, surname, addr);
        emit addPersonEvent(name, surname, addr);
    }

    function getPersonByAddress(address addr) public view returns(string memory name, string memory surname){
        string memory name = map[addr].name;
        string memory surname = map[addr].surname;
        return (name, surname);
    }

    event addPersonEvent(string name, string surname, address addr);
}