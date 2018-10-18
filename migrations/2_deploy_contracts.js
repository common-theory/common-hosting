const CommonHosting = artifacts.require('CommonHosting');

module.exports = function(deployer) {
  deployer.deploy(CommonHosting);
};
