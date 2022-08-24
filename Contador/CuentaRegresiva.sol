// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract CuentaRegresiva {
   uint256 private tiempoInicio; 
   uint256 private duracionJuego = 60; // segundos

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
}