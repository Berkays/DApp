pragma solidity ^0.4.17;

contract Adoption {
    //Array of ethereum addresses
    //Public variables have automatic getter 
    address[16] public adopters;

    // Adopting a pet
    function adopt(uint petId) public returns (uint) 
    {
        //We are checking to make sure petId is in range of our adopters array
        require(petId >= 0 && petId <= 15);

        //The address of the person or smart contract who called this function is denoted by msg.sender
        adopters[petId] = msg.sender;

        return petId;
    }

    // Retrieving the adopters
    //view makes the state of contract immutable
    function getAdopters() public view returns (address[16]) 
    {
        return adopters;
    }
}