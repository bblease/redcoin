'''
Worker for redistributing Rubles

This script acts as an authority for redistributing wealth
'''

from web3 import Web3
import web3

import logging
import json
import os 

# TODO - central authority address is constant
AUTHORITY_ADDR = ''

def blockchain_connect(host, port) -> Web3:
	addr = f'http://{host}:{port}'
	logging.info(f'connecting to {addr}')

	w3 = Web3(Web3.HTTPProvider(addr))
	return w3 

def redcoin_connect(host, port, addr, dev):
	chain = blockchain_connect(host, port)
	assert chain.isConnected(), 'Not connected to chain'

	dir_path = os.path.dirname(os.path.realpath(__file__))
	f_path = os.path.join(dir_path, 'abi', 'redcoin.json')
	with open(f_path, 'r') as f:
		abi = json.loads(f.read())

	# if developing, checksum address is needed for hardhat
	if dev:
		addr = Web3.toChecksumAddress(addr)

	redcoin = chain.eth.contract(address=addr, abi=abi)
	logging.info(f'successfully connected to {redcoin.caller.name()}, symbol {redcoin.caller.symbol()}')