pragma solidity ^0.4.0;

import "./Splitter.sol";
import "./Owned.sol";

contract SplitterManager is Owned {
    address[] public splitters;
    
    event LogSplitterCreated(address payer, address recipient1, address recipient2, address splitterAddress);
    
    function SplitterManager() {
        
    }
    
    function createNewSplitter(address payer, address recipient1, address recipient2) ownerOnly returns (address newSplitterAddress) {
        address splitter = new Splitter(payer, recipient1, recipient2);
        splitters.push(splitter);
        LogSplitterCreated(payer, recipient1, recipient2, splitter);
        return splitter;
    }
    
    function destroy() ownerOnly {
        selfdestruct(owner);
    }
}