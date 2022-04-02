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

	/**
	 * Only the owner (state) can remove (execute) an account
	 * Returns the condemned address as verification
	 */
	function execute(address condemned) public onlyBy(owner) returns (address executed) {
		// can't execute already executed
		require(!executed[condemned], "The user is already dead");
		require(balances[condemed] > 0, "Can't execute someone with no RUB");

		executed[condemned] = true;
		return condemed;
	}

	/**
	 * Apply a redistribution by moving funds from donor account to receiver account
	 */
	function apply_redistribution(address donor, address receiver, int amount) public onlyBy(owner) returns (bool success) {
		require(amount <= balances[donor], 
				"Donor doesn't have enough to give, redistribution may be incorect");

		balances[donor] -= amount;
		balances[receiver] += amount;

		return true;	
	}

	// add a new comrade
	function newAddress(address new_address) public onlyBy(owner) returns (address added) {
		//the account cannot be pre existing
		require(!accounts[new_address]);
		accounts[new_address] = true;
		balances[new_address] = 0;
		return new_address;
	}

	// only the owner of the contract can end a vote
	// this is either through timeout or manually
	function endVote() public onlyBy(owner) {
		emit DeathVote(owner, false);
	}

	function toil(address user) public returns (bool success){
		require(!executed[user])

		// 100 rubles per toil
		balances[user] += 100;
		return true;
	}

	function callVote(address caller) public {
		vote_counter += 1;
		emit DeathVote(caller, true);
	}

	/** 
	 * Vote for a user to be executed
	 * Return true as verification
	 */
	function vote(address vote_for, address voter) public returns (bool success){
		require(vote_for != voter, "Can't vote to kill yourself");

		require(!voted[vote_for]);
		votes[vote_for] += 1;
		voted[voter] = true;
		voted_count += 1;
		return true;
	}

	function redistribute(address receiver, int need) private {
		console.log('calling redistribution');
		emit Redistribute(receiver, need);
	}

	function balanceOf(address user) public view returns(int balance) {
		return balances[user];
	}
}