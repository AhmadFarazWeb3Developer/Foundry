// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract RequireRevert {
    uint256 public value;

    function setValue(uint256 _value) public {
        require(_value > 10, "Value must be greater than 10");
        value = _value;
    }

    function alwaysRevert() public pure {
        revert("This function always reverts");
    }
}
