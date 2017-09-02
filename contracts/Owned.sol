pragma solidity ^0.4.0;

contract Owned {
    address public owner;
    
    modifier ownerOnly {
        require(owner == msg.sender);
        _;
    }
    
    function Owned() {
        owner = msg.sender;
    }
}