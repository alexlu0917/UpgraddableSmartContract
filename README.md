# Upgraddable Smart Contract

This project demonstrates how to make the upgraddable smart contract.

## What is the upgraddable smart contract?

Smart contracts deployed using OpenZeppelin Upgrades Plugins can be upgraded to modify their code, while preserving their address, state, and balance. This allows you to iteratively add new features to your project, or fix any bugs you may find in production.

## How upgrades work

This section will be more theory-heavy than others: feel free to skip over it and return later if you are curious.

When you create a new upgradeable contract instance, the OpenZeppelin Upgrades Plugins actually deploys three contracts:

The contract you have written, which is known as the implementation contract containing the logic.

A ProxyAdmin to be the admin of the proxy.

A proxy to the implementation contract, which is the contract that you actually interact with.

Here, the proxy is a simple contract that just delegates all calls to an implementation contract. A delegate call is similar to a regular call, except that all code is executed in the context of the caller, not of the callee. Because of this, a transfer in the implementation contract’s code will actually transfer the proxy’s balance, and any reads or writes to the contract storage will read or write from the proxy’s own storage.

This allows us to decouple a contract’s state and code: the proxy holds the state, while the implementation contract provides the code. And it also allows us to change the code by just having the proxy delegate to a different implementation contract.

An upgrade then involves the following steps:

Deploy the new implementation contract.

Send a transaction to the proxy that updates its implementation address to the new one.

## references

https://docs.openzeppelin.com/learn/upgrading-smart-contracts?pref=hardhat
