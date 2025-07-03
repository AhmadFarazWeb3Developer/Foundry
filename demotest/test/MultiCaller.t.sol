// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {Test, console} from "forge-std/Test.sol";

import {MultiCaller} from "../src/MultiCaller.sol";

contract MultiCallerTest is Test {
    MultiCaller public multicaller;

    function setUp() public {
        multicaller = new MultiCaller();
    }

    function test_recordCall() public {
        multicaller.recordCall();

        console.log("Last caller 1 : ", multicaller.lastCaller());
        vm.startPrank((address(1))); // works for only latest transaction

        multicaller.recordCall();
        console.log("Last caller 2 : ", multicaller.lastCaller());

        multicaller.recordCall(); 
        console.log("Last caller 3 : ", multicaller.lastCaller());

        vm.stopPrank();

        multicaller.recordCall(); // this will be called by actual caller now , means the contract address
        console.log("Last caller 4 : ", multicaller.lastCaller());
        
        multicaller.recordCall(); // this will be called by actual caller now , means the contract address
        console.log("Last caller 5 : ", multicaller.lastCaller());

        assertEq(multicaller.callCount(), 0);
    }
}
