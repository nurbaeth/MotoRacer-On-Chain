# MotoRacer On-Chain

MotoRacer On-Chain is a fully decentralized motorcycle racing game built on Solidity. Players register, choose their bikes, and compete in blockchain-based races. The winner is determined using on-chain randomness, ensuring fairness and transparency.

## Features
- **On-Chain Racing**: Every race result is recorded on the blockchain.
- **Player Registration**: Players can join by selecting a bike.
- **Randomized Outcomes**: Race results are determined using on-chain randomness.
- **Fair and Transparent**: No centralized authority influences the game.

## How It Works
1. Players register by calling `register(uint8 _bikeId)`, selecting their preferred bike.
2. Once enough players join, the owner starts a race using `startRace()`.
3. A winner is chosen randomly, and the race result is stored on-chain. 
4. The race history can be checked at any time.

## Getting Started
### Deployment
1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/MotoRacerOnChain.git
   cd MotoRacerOnChain
   ```
2. Deploy the contract using Hardhat or Remix.

### Interacting with the Contract
- Register as a player:
  ```solidity
  contractInstance.register(1); // Choose a bike ID (e.g., 1)
  ```
- Start a race (owner only):
  ```solidity
  contractInstance.startRace();
  ```
- View race results:
  ```solidity
  contractInstance.races(raceId);
  ```

## Future Enhancements
- **NFT Integration**: Bikes as NFTs with unique stats.
- **Betting System**: Players can place bets on races.
- **Upgradable Bikes**: Performance boosts for frequent racers.

## License
This project is licensed under the MIT License.

