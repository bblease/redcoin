pragma solidity ^0.8.0;

import "../lib/SafeMath.sol";
import "hardhat/console.sol";

contract RedCoin is SafeMath {

	address private owner;

	string public name;
	string public symbol;

	mapping(address => bool) accounts; 
	mapping(address => bool) executed;
	mapping(address => int) balances;

	// votes to execute a comrade
	mapping(address => int) private votes;
	mapping(address => bool) private voted;
	int256 private vote_counter;
	int256 private voted_count;


	event DeathVote(address indexed caller, bool start);

	// redistribute according to the caller's need 
	event Redistribute(address indexed caller, int need); 

	constructor() {
		name = "RedCoin";
		symbol = "RUB";
		owner = msg.sender;
	}

	modifier onlyBy(address account) {
		require(msg.sender == account, 
				"Not authorized for this address.");

		_; 
	}

	function redistribute(address receiver, int need) private {
		console.log('calling redistribution');
		emit Redistribute(receiver, need);
	}

	function apply_redistribution() public returns (bool success) {
		return false;	
	}

	// add a new comrade
	function newAddress(address new_address) public onlyBy(owner) {
		//the account cannot be pre existing
		require(!accounts[new_address]);
		accounts[new_address] = true;
		balances[new_address] = 0;
	}

	function toil(address user) public returns (bool success){
		// 100 rubles per toil
		balances[user] += 100;
		return true;
	}

	function execute(address condemned) private {
		executed[condemned] = true;
	}

	function callVote(address caller) public {
		vote_counter += 1;
		emit DeathVote(caller, true);
	}

	function vote(address vote_for, address voter) public returns(bool success){
		require(!voted[vote_for]);
		votes[vote_for] += 1;
		voted[voter] = true;
		voted_count += 1;
		return true;
	}

	function balanceOf(address user) public view returns(int balance) {
		return balances[user];
	}

}