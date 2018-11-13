pragma solidity ^0.4.17;

import "truffle/Assert.sol"; //Assertion library for tests
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol"; //Smart contract to be tested

contract TestAdoption 
{
    // The address of the adoption contract to be tested
    // DeployedAddresses.Adoption() gets smart contract address 
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    // The id of the pet that will be used for testing
    uint expectedPetId = 8;

    //The expected owner of adopted pet is this contract
    address expectedAdopter = this;

}