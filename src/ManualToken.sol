//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;

error invalidtransaction();
error insufficientBalance();

contract ManualToken{

    mapping (address=>uint256) accountBalance  ;

    string public constant NAME = "Manual token";

    function totalSupply() public pure returns(uint256){
        return 100 ether ;
    }

    function decimals() public pure returns(uint256){
        return 18;
    }

    function balance(address _accountAddress) public view returns(uint256){
        return accountBalance[_accountAddress];
    }

    function transfer(address  _reciever , uint256 _amountToSend) public {
        uint256  totalBalanceofTheseTwo = balance(_reciever)+balance(msg.sender);
        require(accountBalance[msg.sender]>_amountToSend , insufficientBalance());
        accountBalance[msg.sender]-=_amountToSend;
        accountBalance[_reciever]+=_amountToSend;
        require((balance(_reciever)+balance(msg.sender))== totalBalanceofTheseTwo, invalidtransaction());
    }
}