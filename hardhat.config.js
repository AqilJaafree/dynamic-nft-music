require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-ethers");

module.exports = {
  solidity: "0.8.0",
  networks: {
    // Add your network configurations here (e.g., development, mainnet, etc.)
    // Example for the development network:
    development: {
      url: "http://localhost:8545", // Make sure you have a local Ethereum node running.
    },
  },
};
