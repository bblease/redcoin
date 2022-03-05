from distutils.core import setup

setup(
    name="redcoin_worker",
    version="1.0",
    description="Python even listener and worker for RedCoin (TM)",
    author="Ben Blease",
    entry_points={"console_scripts": ["redcoin=src.__main__:main"]},
)
