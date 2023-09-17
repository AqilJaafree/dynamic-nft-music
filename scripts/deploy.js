const { ethers } = require("hardhat");

async function main() {
  const ImprovedDynamicNFT = await ethers.getContractFactory(
    "ImprovedDynamicNFT"
  );
  const improvedDynamicNFT = await ImprovedDynamicNFT.deploy(
    "DynamicNFT",
    "DNFT",
    "https://my-nft-api.com/metadata/"
  );

  console.log("Contract deployed to:", improvedDynamicNFT.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
