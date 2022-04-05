<p align='center'>
<img width="710" alt="image" src="https://user-images.githubusercontent.com/18473983/161454853-f5efdf32-5afd-4dff-8877-afbb6cc18037.png">
</p>

# Redcoin
Redcoin - a communist shitcoin running a contract based off the ERC-20 contract standard, with a central python worker that determines redistribution as an authority. 

Toil to earn rubles. Call a vote to execute another user and redistribute their coins if they get too rich. The more you toil, the more you earn, so watch your output!

Why does this exist? Why not! This project has presented a challenge in learning Svelte and Solidity and using Python for off-chain computation.

Creating a token, with Python and JS/TS applications running on top of it is a challenge

#### Backend Stack
To run with docker and the makefile: 

```
make redcoin
```
This will load the hardhat environment for development.

```
make redcoin-prod
```
Will load the ETH contract onto test net, or a Geth node and create the frontend/python worker containers (planned)

#### Frontend

The frontend is written in Svelte and can be installed with `yarn` in the project directory

Run `yarn start` to start the frontend. See the README in the frontend directory for more detailed instructions and info

The frontend provides a metagame where users can farm coins by toiling, and steal and redistribute from other users by calling votes to close their account and take their tokens ("execute" them). When a vote is approved, the central ETH address will lock their account and the python worker will determine the best redistribution. Finally, a series of transactions will redistribute the money. 

This project turned into a bit of a creating coding challenge, designing a 90s inspired desktop with a window manager to interface with the various tasks (toiling, executing, and interfacing with the ETH chains).

<p align='center'>
  <img width="664" alt="redos" src="https://user-images.githubusercontent.com/18473983/161454919-39ab885e-1881-42cf-b407-8e529cf3183e.png">
</p> 

