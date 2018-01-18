// Copyright SIX DAY LLC. All rights reserved.

import web3swift
import BigInt

protocol TokensBalanceRequests {
    //Get ETH balance of the wallet
    func balance(address: String)
    //Get ERC20 token balance of the wallet with specific array of contracts.
    func ERC20Balance(for address: String, contract: [String])
    //ETH balance subscribable variable
    var ethBalance: Subscribable<BigUInt> { get }
    //ERC20 balance subscribable variable
    var ERC20Balance: Subscribable<[String: BigUInt]> { get }
}

class TokensBalanceCoordinator: TokensBalanceRequests {
    var ethBalance: Subscribable<BigUInt> = Subscribable(nil)
    var ERC20Balance: Subscribable<[String: BigUInt]> = Subscribable(nil)
    private let web3: Web3Swift
    init(web3: Web3Swift) {
        self.web3 = web3
    }
}

extension TokensBalanceCoordinator {
    func balance(address: String) {
        let walletAddress = EthereumAddress(address)
        ethBalance.value = web3.client.eth.getBalance(address: walletAddress)
    }
    func ERC20Balance(for address: String, contract: [String]) {
    }
}
