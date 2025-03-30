// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MotoRacerOnChain {
    struct Player {
        address playerAddress;
        uint8 bikeId;
    }
    
    struct Race {
        uint256 raceId;
        address winner;
        bool completed;
    }
    
    address public owner;
    uint256 public nextRaceId;
    mapping(uint256 => Race) public races;
    mapping(address => Player) public players;
    address[] public racers;
    
    event PlayerRegistered(address player, uint8 bikeId);
    event RaceCompleted(uint256 raceId, address winner);
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
    
    constructor() {
        owner = msg.sender;
    }
    
    function register(uint8 _bikeId) external {
        require(players[msg.sender].playerAddress == address(0), "Already registered");
        players[msg.sender] = Player(msg.sender, _bikeId);
        racers.push(msg.sender);
        emit PlayerRegistered(msg.sender, _bikeId);
    }
    
    function startRace() external onlyOwner {
        require(racers.length >= 2, "Not enough racers");
        
        uint256 winnerIndex = uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, racers))) % racers.length;
        address winner = racers[winnerIndex];
        
        races[nextRaceId] = Race(nextRaceId, winner, true);
        emit RaceCompleted(nextRaceId, winner);
        
        nextRaceId++;
        delete racers;
    }
}
