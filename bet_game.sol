pragma solidity ^0.4.0;
contract DiceGame {

    address public owner;
    uint public betLimit = 0.1 ether;
    uint public winMultiplier = 5 ether;
    function DiceGame() public payable{
        owner = msg.sender;

    }

    modifier onlyAdmin()
    {
        require(msg.sender == owner);
        _;
    }

    function spin(uint betValue) payable public{

        require(betValue > 0 || betValue <= 6);
        require(msg.value <= betLimit);
        //call oracle to get random value
        uint randomValue = 3;
        if(betValue == randomValue){
            msg.sender.transfer(msg.value*winMultiplier);
        }
    }

    function addAmountToBetPot() public payable onlyAdmin{

    }

    function transferAmounttoOwner(uint amount) public onlyAdmin{
        owner.transfer(amount);
    }

}
