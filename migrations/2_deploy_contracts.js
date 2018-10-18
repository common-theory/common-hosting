const CommonHosting = artifacts.require('./CommonHosting.sol');

module.exports = function(deployer) {
  deployer.deploy(CommonHosting);
};
