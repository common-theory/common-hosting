const PrivateKeyProvider = require('truffle-privatekey-provider');

/**
 * Fallback address 0xE67e55722b80bbE75767249336E94143e4eBBf5D
 * There's a small amount of eth there on rinkeby so I can locally test
 **/
const rinkebyKey = process.env.RINKEBY_PRIVATE_KEY || '3a131d0db16f5ba25ee623e669ffc9553e3d81f0d51df8e7c1fe322e3d0942bf';

module.exports = {
  networks: {
    development: {
      host: '127.0.0.1',
      port: 7545,
      network_id: '*'
    },
    rinkeby: {
      provider: () => new PrivateKeyProvider(rinkebyKey, 'https://rinkeby.commontheory.io'),
      network_id: 4
    },
    live: {
      host: 'eth.commontheory.io',
      port: 80,
      network_id: 1
    }
  }
};
