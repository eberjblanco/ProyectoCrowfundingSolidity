// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld {
    
    string public saludo = "Hello World!!";

    function escribirSaludo(string memory _helloworld) public {
        saludo = _helloworld;
    }

    function getSaludo() public view returns(string memory){
        return saludo;
    }
}