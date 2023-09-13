async function main() {
  const [deployer] = await ethers.getSigners();

  console.log(`Deploying contracts with the account: ${deployer.address}`);

  const DynamicNFT = await ethers.getContractFactory("DynamicNFT");
  const dynamicNFT = await DynamicNFT.deploy(
    "DynamicNFT",
    "DNFT",
    "https://your-base-uri.com/"
  );

  console.log(`Contract address: ${dynamicNFT.address}`);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
