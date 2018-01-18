// Copyright SIX DAY LLC. All rights reserved.

import web3swift
import Alamofire

class TrustProvider: Web3Provider {
    public var accessToken:String? = nil
    public var network: Networks? = nil
    public var attachedKeystoreManager: KeystoreManagerV3? = nil
    private var config: Config
    init(with config:Config) {
        self.config = config
    }
    public func sendSync(request: JSONRPCrequest) -> [String: Any]? {
        guard let response = self.sync(request) else {return nil}
        guard let res = response as? [String: Any] else {return nil}
        return res
    }
    internal func sync(_ request: JSONRPCrequest) -> Any? {
        let requestURL = config.rpcURL
        guard let _ = try? JSONEncoder().encode(request) else {return nil}
        let response = Alamofire.request(requestURL, method: .post, parameters: nil, encoding: request).responseJSON()
        switch response.result {
        case .success(let resp):
            return resp
        case .failure(let err):
            print("TrustProvider error: \(err)")
            return nil
        }
    }
}
