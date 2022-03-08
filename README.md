![comrade](https://github.com/bblease/redcoin/blob/master/memes/our_coin.png)

# Redcoin
Redcoin - a communist shitcoin running a contract based off the ERC-20 contract standard, with a central python worker that determines redistribution as an authority. 

Toil to earn rubles. Call a vote to execute another user and redistribute their coins if they get too rich. The more you toil, the more you earn, so watch your output!

Why does this exist? Why not!

Creating a token, with Python and JS/TS applications running on top of it is a challenge

To run with docker and the makefile: 

```
make redcoin
```
This will load the hardhat environment for development.

```
make redcoin-prod
```
Will load the ETH contract onto test net, or a Geth node and create the frontend/python worker containers
