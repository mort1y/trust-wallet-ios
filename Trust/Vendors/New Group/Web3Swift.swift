// Copyright SIX DAY LLC. All rights reserved.

import Foundation
import web3swift

class Web3Swift {
    private var network:RPCServer
    let client = {
        return Web3.InfuraRinkebyWeb3()
    }()
    init(with config:Config) {
      self.network = RPCServer(chainID: config.chainID)
    }
}
