// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

import {HelloWorld} from "../src/0-HelloWorld.sol";

/// @notice CatScript
/// @author Alexandre Frede
/// @dev The CatScript contract is a script that call the contract HelloWorld and show on stdout the returned string
contract CatScript is Script {

    /// @dev Store the hello world contract
    HelloWorld public helloWorld;

    /// @dev Set up the script this function is ensured to be called only once before everything else
    function setUp() public {
        // We use the keyword new to deploy the contract HelloWorld from the script
        helloWorld = new HelloWorld();
    }

    /// @dev Run the script this function is called after the setUp function
    function run() public view {
        // We call the function hello() from the contract HelloWorld
        string memory hello = helloWorld.hello();
        // We use the function log() from the forge-std/Script.sol to show the string on stdout
        console.log(hello);
    }
}

/**
 * Solidity est language qui tourne sur la blockchain donc elle n'a pas de acces au stdout comme dans les autres languages
 * Ici j'ai cree un script qui recupere la string renvoyer par hello world et utilise une fonction qui communique avec l'outil
 * forge pour afficher la string sur le terminal.
 */
