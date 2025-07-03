// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

contract FFITest is Test {
    function testFFI() public {
        // Define the command to execute
        string[] memory command = new string[](2);
        command[0] = "echo";
        command[1] = "42";

        // Execute the command and capture the output
        bytes memory result = vm.ffi(command);
        console.logBytes(result);
    }

    function test_timestamp() public {
        string[] memory command = new string[](4);

        command[0] = "bash";
        command[1] = "-c";
        command[2] = "date";
        command[3] = "+%s";

        bytes memory result=vm.ffi(command);
        string memory resultStr=string(result);
        console.log("result",resultStr);
    }
}
