// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

/// @notice SimpleStorage
/// @author Alexandre Frede
/// @dev This contract show how to use storage for variables
contract SimpleStorage {
    /// This storage variable can't be changed after the deployement (constructor scope)
    address public immutable owner;
    string public name;
    uint256 public age;
    int256 public favoriteNumber;
    bool public isMarried;

    constructor() {
        owner = msg.sender;
    }

    function setName(string memory _name) public {
        require(owner == msg.sender, "Only the owner can set the name");
        name = _name;
    }

    function setAge(uint256 _age) public {
        require(owner == msg.sender, "Only the owner can set the age");
        age = _age;
    }

    function setFavoriteNumber(int256 _favoriteNumber) public {
        require(owner == msg.sender, "Only the owner can set the favorite number");
        favoriteNumber = _favoriteNumber;
    }

    function setIsMarried(bool _isMarried) public {
        require(owner == msg.sender, "Only the owner can set if is maried or not");
        isMarried = _isMarried;
    }
}

/// @notice MapStorage
/// @author Alexandre Frede
/// @dev This contract show how to use maps storage
contract MapStorage {
    mapping(address => string) public name;
    mapping(address => uint256) public age;
    mapping(address => int256) public favoriteNumber;
    mapping(address => bool) public isMarried;

    mapping(address => mapping(address => bool)) public isFriend;

    mapping(uint256 => string) public numberDatabase;

    function setName(string memory _name) public {
        name[msg.sender] = _name;
    }

    function setAge(uint256 _age) public {
        age[msg.sender] = _age;
    }

    function setFavoriteNumber(int256 _favoriteNumber) public {
        favoriteNumber[msg.sender] = _favoriteNumber;
    }

    function setIsMarried(bool _isMarried) public {
        isMarried[msg.sender] = _isMarried;
    }

    function toggleFriend(address _friend) public {
        isFriend[msg.sender][_friend] = !isFriend[msg.sender][_friend];
    }

    function setStringForNumber(uint256 _number, string memory _string) public {
        numberDatabase[_number] = _string;
    }
}
