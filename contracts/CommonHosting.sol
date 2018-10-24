pragma solidity ^0.4.23;

/**
 * This contract is intended to provide a list of ethereum addresses mapped to
 * domain names, mapped to ipfs addresses.
 *
 * Example constract representation in JSON
 *
 * {
 *   "domainToPath": {
 *     "0xddeC6C333538fCD3de7cfB56D6beed7Fd8dEE604": {
 *       "commontheory.io": "/ipfs/QmVFrWCRoJc6yB1v6h1KQad2uw5UzcsKE9UeMNWdS5gG3V"
 *     },
 *     "0x0": {
 *       "otherdomain.com": "/ipfs/QmRHT55sVPZuMQLJtTFWRXpZd9LXqmVuDtKZZVmgS2zaAJ"
 *     }
 *   }
 * }
 *
 **/

contract CommonHosting {

  struct HostConfig {
    mapping (string => string) domainToPath;
  }

  mapping (address => HostConfig) configs;

  /**
   * This event _must_ be emitted when an entry changes. This allows common
   * hosting nodes to load relevant mappings into memory and listen for updates.
   **/
  event PathUpdate (
    address owner,
    string domain,
    string path
  );

  function setPathForDomain(string domain, string path) public {
    configs[msg.sender].domainToPath[domain] = path;
    emit PathUpdate(msg.sender, domain, path);
  }

  function pathForDomainAndAddress(string domain, address addr) public view returns (string) {
    return configs[addr].domainToPath[domain];
  }

}
