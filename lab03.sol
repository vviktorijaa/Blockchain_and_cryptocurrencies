//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.7.0;

struct Person{
    address addr;
    string name;
    string surname;
}

struct Company{
    address addr;
    string name;
}

interface Interface{

    function addPerson(address addr, string memory name, string memory surname) external;
    
    function addCompany(address addr, string memory name) external;

    function getPerson(address addrFind) external view returns (address addr);

    function getCompany(address addrFind) external view returns (address addr);
}

library Lib{
    
    struct LibPerson {
        mapping(address => Person) mapPerson;
    }

    struct LibCompany {
        mapping(address => Company) mapCompany;
    }

    function addPerson(LibPerson storage lp, address addr, string memory name, string memory surname) public{
        addr = msg.sender;
        lp.mapPerson[addr] = Person(addr, name, surname);
    }

    function addCompany(LibCompany storage lc, address addr, string memory name) public{
        addr = msg.sender;
        lc.mapCompany[addr] = Company(addr, name);
    }    

    function getCompany(LibCompany storage lc, address addrFind) view external returns(address){
        return lc.mapCompany[addrFind].addr;
    }   

    function getPerson(LibPerson storage lp, address addrFind) view external returns(address){
        return lp.mapPerson[addrFind].addr;
    }     
}

contract Lab03 is Interface{
    
    Lib.LibPerson libP;
    Lib.LibCompany libC;

    function addPerson(address addr, string memory name, string memory surname) public override {
        Lib.addPerson(libP, addr, name, surname);
        emit addPersonEvent(addr, name, surname);
    }

    function addCompany(address addr, string memory name) public override{
        Lib.addCompany(libC, addr, name);
        emit addCompanyEvent(addr, name);
    }

    function getPerson(address addr) public override view returns (address a) {
        return Lib.getPerson(libP, addr);
    }

    function getCompany(address addr) public override view returns (address a) {
        return Lib.getCompany(libC, addr);
    }

    event addPersonEvent(address addr, string name, string surname);
    event addCompanyEvent(address addr, string name);
}