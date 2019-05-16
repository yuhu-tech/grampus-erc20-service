#!/usr/bin/env bash

cd src/main/resources/solidity/contract/ && \
    #solc --bin --abi --optimize --overwrite ControllableStandardToken.sol -o build/ && \
    ~/code/web3j-3.2.0/bin/web3j solidity generate \
        build/ControllableStandardToken.bin \
        build/ControllableStandardToken.abi \
        -p io.blk.erc20.generated \
        -o ../../../java/
