// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ManualToken {
  mapping(address => uint256) private sBalances;
  string public name = "Manual Token";
  // function name() public pure returns (string memory) {
  //   return "Manual Token";
  // }

  function totalSupply() public pure returns (uint256) {
    return 100 ether;
  }

  function decimals() public pure returns (uint8) {
    return 18;
  }

  function balanceOf(address _owner) public view returns (uint256) {
    return sBalances[_owner];
  }

  function transfer(address _to, uint256 _amount) public {
    uint256 previousBalance = balanceOf(msg.sender) + balanceOf(_to);
    sBalances[msg.sender] -= _amount;
    sBalances[_to] += _amount;
    require(balanceOf(msg.sender) + balanceOf(_to) == previousBalance);
  }
}