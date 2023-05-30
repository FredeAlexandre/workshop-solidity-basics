// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Safe.sol";

contract SafeTest is Test {
    Safe public safe;

    function setUp() public {
        safe = new Safe(keccak256("right password"));
    }

    function testDeposit() public {
        assertEq(address(safe).balance, 0);
        assertEq(safe.deposited(), address(safe).balance);
        safe.deposit{value: 1 ether}();
        assertEq(address(safe).balance, 1 ether);
        assertEq(safe.deposited(), address(safe).balance);
    }
    
    function testWrongPassword() public {
        vm.expectRevert(bytes("Wrong password"));
        safe.withdraw("wrong password");
    }

    function testRihtPassword() public {
        vm.prank(address(0));
        safe.withdraw("right password");
        assertEq(address(safe).balance, 0);
        assertEq(safe.deposited(), address(safe).balance);
    }
}
