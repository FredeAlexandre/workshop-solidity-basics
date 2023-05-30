// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

/// @notice Visibility
/// @author Alexandre Frede
/// @dev This contract show what is visibility and how to use it
contract Visibility {
    /// This function can't be called externally (outside the contract) or by the consumer of the contract
    function privateFunction() private pure returns (string memory) {
        return "private function";
    }

    /// This function can't be called externally (outside the contract)
    function internalFunction() internal pure returns (string memory) {
        return "internal function";
    }

    /// This function can't be called inside the contract
    function externalFunction() external pure returns (string memory) {
        return "external function";
    }

    /// This function can be called by everyone
    function publicFunction() public pure returns (string memory) {
        return "public function";
    }

    function callPrivateFunction() public pure returns (string memory) {
        return privateFunction();
    }

    function callInternalFunction() public pure returns (string memory) {
        return internalFunction();
    }

    /**
     *  This function cannot compile because we can't call an external function from inside the contract
     *
     *   function callExternalFunction() public pure returns (string memory) {
     *       return externalFunction();
     *   }
     */
    
    function callPublicFunction() public pure returns (string memory) {
        return publicFunction();
    }
}

contract VisibilityConsumer is Visibility {
    /**
     *  This function cannot compile because we can't call an private function from consumer of the contract
     *
     *  function consumerCallPrivateFunction() public pure returns (string memory) {
     *      return privateFunction();
     *  }
     */

    function consumerCallInternalFunction() public pure returns (string memory) {
        return internalFunction();
    }

    function consumerCallPublicFunction() public pure returns (string memory) {
        return publicFunction();
    }
}
