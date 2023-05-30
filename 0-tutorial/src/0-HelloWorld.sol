// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

/// @notice Hello World
/// @author Alexandre Frede
/// @dev This contract only return a string "Hello World" on the call of user to the function hello()
contract HelloWorld {
    
    /// @notice Return a string "Hello World"
    /// @return string "Hello World"
    function hello() public pure returns (string memory) {
        return "Hello World";
    }
}

/**
 * Pour essayer ce contract je vous laisse executer la commande suivante sur votre terminal.
 * /!\ Faite attention d'etre dans le dossier 0-tutorial et non pas a la racine du repo que vous avez cloner /!\
 * commande: forge script script/Cat.s.sol
 * 
 * Vous pouvez aller voir le comportement de ce script dans le fichier script/Cat.s.sol
 */
