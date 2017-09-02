var SplitterManager = artifacts.require("./SplitterManager.sol");

module.exports = function(deployer) {
  deployer.deploy(SplitterManager);
};
