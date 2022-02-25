// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.7.0;

contract HelloWorld{

    string private msg;

    constructor(){
        msg = 'Hello World';
    }

    function update(string memory m) public{
        msg=m;
    }

    function getMessage() public view returns (string memory){
        return msg;
    }
}