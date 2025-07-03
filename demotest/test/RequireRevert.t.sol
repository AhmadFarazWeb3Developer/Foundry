// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {Test, console} from "forge-std/Test.sol";

import {RequireRevert} from "../src/RequireRevert.sol";

contract RequireRevertTest is Test {
    RequireRevert public requireRevert;

    function setUp() public {
        requireRevert = new RequireRevert();
    }

    function test_setValue() public { //fuzz test
    vm.expectRevert("Value must be greater than 10");
        requireRevert.setValue(9);
    }
}
