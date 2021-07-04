pragma solidity ^0.4.8;

contract HoneyPot {
    mapping(address => uint256) public balances;

    function HoneyPot() payable {
        put();
    }

    function put() payable {
        balances[msg.sender] = msg.value;
    }
    
    // get() is the vulnerable code !!!
    function get() {
        if (!msg.sender.call.value(balances[msg.sender])()) {
            throw;
        }
        balances[msg.sender] = 0;
    }
    
    // get2() fixed the issue in get() by updating states before transfering ether
    function get2() {
        uint amount = balances[msg.sender];
        balances[msg.sender] = 0;

        if (!msg.sender.call.value(amount)()) {
            throw;
        }
    }

    function() {
        throw;
    }
}
