pragma solidity ^0.4.23;

contract CommonHosting {

  struct HostConfig {
    mapping (string => string) domainToPath;
  }

  mapping (address => HostConfig) configs;

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
