require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.28",

  networks: {
    ganache: {
      url: "http://127.0.0.1:7545", // Default RPC URL for Ganache
      accounts: [
        "your private key",
        
      ] // Replace with the private keys from Ganache
    }
  },
};
