// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {Test, console} from "forge-std/Test.sol";

import {RequireRevert} from "../src/RequireRevert.sol";

contract RequireRevertTest is Test {
    RequireRevert public requireRevert;

    function setUp() public {
        requireRevert = new RequireRevert();
    }

    function test_setValue() public {
        vm.expectRevert("Value must be greater than 10");
        requireRevert.setValue(9);
    }

    function test_AlwaysRevert() public {
        vm.expectRevert("This function always reverts");
        requireRevert.alwaysRevert();
    }
}
