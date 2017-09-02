pragma solidity ^0.4.0;

import "./Owned.sol";

contract Splitter is Owned {
    address[] public participants;
    address public payer;
    
    event LogPayment(uint amount, uint splitAmount);
    
    function Splitter(address _payer, address recipient1, address recipient2) {
        require(recipient1 != recipient2); // Defeats the purpose of a splitter
        require(_payer != recipient1); // Defeats the purpose of a splitter
        require(_payer != recipient2); // Defeats the purpose of a splitter
        participants.push(recipient1);
        participants.push(recipient2);
        payer = _payer;
    }
    
    function() payable {
        require((msg.value/2 + msg.value/2) == msg.value);
        require(msg.sender == payer);
        participants[0].transfer(msg.value/2);
        participants[1].transfer(msg.value/2);
        LogPayment(msg.value, msg.value/2);
    }
}