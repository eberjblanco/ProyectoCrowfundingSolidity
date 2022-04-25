// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract 6_Crowdfunding {

    address private owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier isOwner(){
        require(owner == msg.sender);
        _;
    }

    string public nombre;
    string public apellido;

    uint public objetivo = 10 ether;
    uint public balance;
    uint public totalRecaudado;

    address payable public artista = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);

    function setMecenas(
        string memory nombre_mecenas,
        string memory apellido_mecenas
    ) public isOwner payable {
        nombre = nombre_mecenas;
        apellido = apellido_mecenas;

        require(msg.value > 1 ether);

        balance = balance + msg.value;

        if(balance >= objetivo){
            payOut();
        }
    }

    function getMecenas() public view returns(string memory,string memory){
        return (nombre,apellido);
    }

    function payOut() private {
        totalRecaudado = balance;
        balance = 0;
        artista.transfer(totalRecaudado);
    }
}