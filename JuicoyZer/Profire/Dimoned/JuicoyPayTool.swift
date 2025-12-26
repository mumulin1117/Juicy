import StoreKit

class JuicoyPayTool: NSObject {
    static let shared = JuicoyPayTool()
    
    private var JuicoyEnergyResponse: ((Result<Void, Error>) -> Void)?
    private var JuicoyCurrentSignal: SKProductsRequest?
    var JuicoyLatestPulseID: String?
    
    private override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }
    
    deinit {
        SKPaymentQueue.default().remove(self)
    }

    func JuicoyIgniteFlux(JuicoyTargetItem JuicoyProductID: String, JuicoyCompletion: @escaping (Result<Void, Error>) -> Void) {
        guard SKPaymentQueue.canMakePayments() else {
            DispatchQueue.main.async {
                let JuicoyError = NSError(domain: "JuicoyApp",
                                         code: 701,
                                         userInfo: [NSLocalizedDescriptionKey: "Transaction flow disabled."])
                JuicoyCompletion(.failure(JuicoyError))
            }
            return
        }
        
        self.JuicoyEnergyResponse = JuicoyCompletion
        JuicoyCurrentSignal?.cancel()
        
        let JuicoyRequest = SKProductsRequest(productIdentifiers: [JuicoyProductID])
        JuicoyRequest.delegate = self
        self.JuicoyCurrentSignal = JuicoyRequest
        JuicoyRequest.start()
    }
}

extension JuicoyPayTool: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        guard let JuicoyValidProduct = response.products.first else {
            DispatchQueue.main.async {
                let JuicoyMissingError = NSError(domain: "JuicoyApp",
                                                code: 702,
                                                userInfo: [NSLocalizedDescriptionKey: "Item spectrum not found."])
                self.JuicoyEnergyResponse?(.failure(JuicoyMissingError))
                self.JuicoyEnergyResponse = nil
            }
            return
        }
        
        let JuicoyPayment = SKPayment(product: JuicoyValidProduct)
        SKPaymentQueue.default().add(JuicoyPayment)
    }
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
        DispatchQueue.main.async {
            self.JuicoyEnergyResponse?(.failure(error))
            self.JuicoyEnergyResponse = nil
        }
    }
}

extension JuicoyPayTool: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for JuicoyTx in transactions {
            switch JuicoyTx.transactionState {
            case .purchased:
                self.JuicoyLatestPulseID = JuicoyTx.transactionIdentifier
                SKPaymentQueue.default().finishTransaction(JuicoyTx)
                DispatchQueue.main.async {
                    self.JuicoyEnergyResponse?(.success(()))
                    self.JuicoyEnergyResponse = nil
                }
                
            case .failed:
                SKPaymentQueue.default().finishTransaction(JuicoyTx)
                let JuicoyIssue: Error
                if (JuicoyTx.error as? SKError)?.code == .paymentCancelled {
                    JuicoyIssue = NSError(domain: "JuicoyApp", code: -999, userInfo: [NSLocalizedDescriptionKey: "User halted the vibe."])
                } else {
                    JuicoyIssue = JuicoyTx.error ?? NSError(domain: "JuicoyApp", code: 703, userInfo: [NSLocalizedDescriptionKey: "Flux interruption."])
                }
                DispatchQueue.main.async {
                    self.JuicoyEnergyResponse?(.failure(JuicoyIssue))
                    self.JuicoyEnergyResponse = nil
                }
                
            case .restored:
                SKPaymentQueue.default().finishTransaction(JuicoyTx)
                DispatchQueue.main.async {
                    self.JuicoyEnergyResponse?(.success(()))
                    self.JuicoyEnergyResponse = nil
                }
                
            default:
                break
            }
        }
    }
}

extension JuicoyPayTool {
    func JuicoyFetchLocalVoucher() -> Data? {
        guard let JuicoyPath = Bundle.main.appStoreReceiptURL else {
            return nil
        }
        return try? Data(contentsOf: JuicoyPath)
    }
}
