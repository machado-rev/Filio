const FilioToken = artifacts.require("FilioToken");
const util = require("util");
const fs = require("fs");
const path = require("path");
const writeFile = util.promisify(fs.writeFile);

module.exports = async function(deployer) {
  const filioToken = await deployer.deploy(FilioToken);
  const addresses = {
    tokenAddress: FilioToken.address
  };

  await writeFile(
    path.join(__dirname, "..", "front", "src", "addresses.json"),
    JSON.stringify(addresses)
  );
};
