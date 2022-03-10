import argparse
import coloredlogs, logging
import time

from .wordart import hammer_sickle
from .blockchain import blockchain_connect, redcoin_connect

REDCOIN_ADDRESS = "0xe7f1725e7734ce288f8367e1bb143e90bb3f0512"

logger = logging.getLogger(__name__)
coloredlogs.install(level="DEBUG")

parser = argparse.ArgumentParser(description="Redcoin Worker Script")

parser.add_argument(
    "-o",
    "--host",
    default="127.0.0.1",
    required=False,
    type=str,
    help="blockchain host address",
)

parser.add_argument(
    "-p", "--port", default=8545, required=False, type=int, help="blockchain port"
)

parser.add_argument(
    "-a",
    "--address",
    default="0xe7f1725e7734ce288f8367e1bb143e90bb3f0512",
    required=False,
    type=str,
    help="Redcoin contract address",
)

parser.add_argument(
	'-d',
	'--dev',
	default=True,
	required=False,
	type=bool,
	help='Dev mode flag, some security will be impacted'
)

def main():
    args = parser.parse_args()

    logger.info(f"Running redcoin worker with the following args: {args}")

    redcoin_connect(args.host, args.port, args.address, args.dev)

    while True:
    	time.sleep(100)