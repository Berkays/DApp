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

    // Testing the adopt() function
    function testUserCanAdoptPet() public 
    {
        uint returnedId = adoption.adopt(expectedPetId);

        //Check if returned pet id and expected pet id is equal.
        Assert.equal(returnedId, expectedPetId, "Adoption of the expected pet should match what is returned.");
    }

    // Testing retrieval of a single pet's owner
    function testGetAdopterAddressByPetId() public 
    {
        address adopter = adoption.adopters(expectedPetId);

        //Check if returned adopter and expected adopter is equal.
        Assert.equal(adopter, expectedAdopter, "Owner of the expected pet should be this contract");
    }

    // Testing retrieval of all pet owners
    function testGetAdopterAddressByPetIdInArray() public 
    {
        // Store adopters in memory rather than contract's storage
        // The memory attribute tells Solidity to temporarily store the value in memory, rather than saving it to the contract's storage.
        address[16] memory adopters = adoption.getAdopters();

        // Check if owner of given pet id and expected adopter is equal.
        Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this contract");
    }
}