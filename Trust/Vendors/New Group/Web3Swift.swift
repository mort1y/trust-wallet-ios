// Copyright SIX DAY LLC. All rights reserved.

import Foundation
import web3swift

class Web3Swift {
    var provider: Web3Provider
    var client:web3
    init(with provider:Web3Provider) {
      self.provider = provider
      self.client = web3.init(provider: provider)
    }
}
