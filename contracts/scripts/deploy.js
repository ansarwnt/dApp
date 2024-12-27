const hre = require("hardhat");
require("dotenv").config();
async function main() {

    const contractAddress = process.env.CONTRACT_ADDRESS;
  const privateKey = process.env.PRIVATE_KEY;
  const infuraUrl = process.env.INFURA_URL;

  // Connect to the network
  const provider = new hre.ethers.JsonRpcProvider(infuraUrl); // You can use Infura or any other provider


  // Get the contract factory for BankingDApp
  const BankingDApp = await hre.ethers.getContractFactory("BankingDApp");

  // Deploy the contract
  const bankingDApp = await BankingDApp.deploy();

  // Wait for deployment to complete
  await bankingDApp.waitForDeployment();

  // Log the contract address
  console.log("BankingDApp deployed to:", await bankingDApp.getAddress());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
