var Sbbs = artifacts.require("./Sbbs.sol");

module.exports = function(deployer) {
  deployer.deploy(Sbbs, "123");
};