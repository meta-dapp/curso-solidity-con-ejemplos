// SPDX-License-Indentifier: MIT
pragma solidity 0.8.12;

contract HolaMundo {
    string private usuario;

    function agregarUsuarioSaludar(string memory _usuario) public {
        usuario = _usuario;
    }

    function saludarSolidity() public view returns(string memory){
        string memory saludo1 = "Hola ";
        string memory saludo2 = ", Bienvenido al curso de Solidity con ejemplos!";
        string memory saludo = string(abi.encodePacked(saludo1, usuario, saludo2));

        return saludo;
    }

    function saludarSolidity12() public view returns(string memory){
        string memory saludo1 = "Hola ";
        string memory saludo2 = ", Bienvenido al curso de Solidity con ejemplos!";
        string memory saludo = string.concat(saludo1, usuario, saludo2);

        return saludo;
    }
}