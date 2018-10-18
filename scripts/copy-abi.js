/**
 * Take the abi from each built contract and copy it into a folder called abi.
 **/

const fs = require('fs');

const PROJECT_ROOT = `${__dirname}/..`;
const contracts = fs.readdirSync(`${PROJECT_ROOT}/build/contracts`);

contracts.forEach(contract => {
  const filename = contract.slice(0, -1 * '.json'.length);
  const { abi } = require(`${PROJECT_ROOT}/build/contracts/${contract}`);
  fs.writeFileSync(`${PROJECT_ROOT}/abi/${filename}.abi.json`, JSON.stringify(abi));
});
