// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
    }

    function testIncrement() public {
        counter.setValue(0);
        counter.increment();
        assertEq(counter.getValue(), 1);
    }

    function testDecrement() public {
        counter.setValue(2);
        counter.decrement();
        assertEq(counter.getValue(), 1);
    }

    function testIncrementByValue(uint amount) public {
        counter.setValue(0);
        counter.add(amount);
        assertEq(counter.getValue(), amount);
    }

    function testDecrementByValue(uint init, uint amount) public {
        assert(init >= amount);
        counter.setValue(amount);
        counter.sub(amount);
        assertEq(counter.getValue(), init - amount);
    }
}
