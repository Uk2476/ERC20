//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;

contract ManualToken{

    mapping (address=>uint256) accountBalance  ;

    string public constant name = "Manual token";

    function totalSupply() public pure returns(uint256){
        return 100 ether ;
    }

    function decimals() public pure returns(uint256){
        return 18;
    }

    function balance(address memory accountAddress) public view returns(uint256){

    }
}