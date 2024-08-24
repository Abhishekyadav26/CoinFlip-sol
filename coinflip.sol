// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract coinFlip {
    enum CoinSide{Heads, Tails}
    enum FlipResult {Win, lose}

    event Result(address player , CoinSide chosenSide , FlipResult result);

    function flipCoin (CoinSide chosenSide) public {
        uint256 randomNumber = uint256 (keccak256 (abi.encodePacked (block.timestamp, msg.sender))) % 2;
        CoinSide result = CoinSide (randomNumber);
        FlipResult flipResult = (chosenSide == result) ? FlipResult.WIN : FlipResult.LOSE;
        emit Result(msg.sender, chosenSide, flipResult);
    }
}