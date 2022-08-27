// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract CuentaRegresiva {
   uint256 private tiempoInicio; 
   uint256 private duracionJuego = 60; // segundos

   struct Votante {
      uint peso;
      bool votado;
   }

   mapping(address => Votante) private votantes;

   constructor() {
    tiempoInicio = block.timestamp;
   }

   function setDurationJuego(uint256 tiempo) external {
    duracionJuego = tiempo;
   }

   function getDuration() external view returns(uint256){
    return duracionJuego;
   }

   function restablecer() external {
    tiempoInicio = block.timestamp;
   }
   
   function tiempoRestante() public view returns(uint256){
        require(tiempoInicio <= block.timestamp, "No valido");
        uint256 diff = block.timestamp - tiempoInicio;
        uint256 restante = diff >= duracionJuego ? 0 : duracionJuego - diff;
        return restante;
   }


   function getVoto() external view returns(Votante memory){
      return votantes[msg.sender];
   }

   function votar(uint _peso) external {
      require(tiempoRestante() > 0, "Se acabo el tiempo");
      Votante storage votante = votantes[msg.sender];
      votante.votado = true;
      votante.peso = _peso;
   }
}