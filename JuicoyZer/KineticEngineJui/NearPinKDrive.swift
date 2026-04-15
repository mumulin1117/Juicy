import StoreKit

class JuicoyPayTool: NSObject {
    static let shared = JuicoyPayTool()
    static let JuicoyDidQueuePaymentNotification = Notification.Name("JuicoyDidQueuePaymentNotification")
    
    private var JuicoyEnergyResponse: ((Result<Void, Error>) -> Void)?
    private var JuicoyCurrentSignal: SKProductsRequest?
//    private var JuicoyTimeoutTask: DispatchWorkItem?
//    private var JuicoyDidReceiveCatalogResponse = false
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
                                         userInfo: [NSLocalizedDescriptionKey: "Tsrjaanosoapcutciwoenk bfelboswf udjijsuazbtloekdn.".JoicoydeMercrypt()])
                JuicoyCompletion(.failure(JuicoyError))
                
            }
            return
        }
        
        self.JuicoyEnergyResponse = JuicoyCompletion
//        JuicoyTimeoutTask?.cancel()
        JuicoyCurrentSignal?.cancel()
//        JuicoyDidReceiveCatalogResponse = false
        
        let JuicoyRequest = SKProductsRequest(productIdentifiers: [JuicoyProductID])
        JuicoyRequest.delegate = self
        self.JuicoyCurrentSignal = JuicoyRequest
        JuicoyRequest.start()
//        
//        let JuicoyTimeoutTask = DispatchWorkItem { [weak self] in
//            guard let self else { return }
//            self.JuicoyDidReceiveCatalogResponse = true
//            self.JuicoyCurrentSignal?.cancel()
//            self.JuicoyCurrentSignal = nil
//            let JuicoyTimeoutError = NSError(
//                domain: "JuicoyApp",
//                code: 704,
//                userInfo: [NSLocalizedDescriptionKey: "Purchase request timed out. Please try again."]
//            )
//            self.JuicoyFinalizeEnergyResult(.failure(JuicoyTimeoutError))
//        }
//        self.JuicoyTimeoutTask = JuicoyTimeoutTask
//        DispatchQueue.main.asyncAfter(deadline: .now() + 15, execute: JuicoyTimeoutTask)
    }
}

extension JuicoyPayTool: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
//        JuicoyTimeoutTask?.cancel()
//        JuicoyTimeoutTask = nil
//        JuicoyCurrentSignal = nil
//        JuicoyDidReceiveCatalogResponse = true
        
        guard let JuicoyValidProduct = response.products.first else {
            
            DispatchQueue.main.async {
                
                let JuicoyInvalidIdentifier = response.invalidProductIdentifiers.first ?? ""
                let JuicoyMissingError = NSError(
                    domain: "JuicoyApp",
                    code: 702,
                    userInfo: [NSLocalizedDescriptionKey: JuicoyInvalidIdentifier.isEmpty ? "Item not found." : "Item not found: \(JuicoyInvalidIdentifier)"]
                )
                self.JuicoyFinalizeEnergyResult(.failure(JuicoyMissingError))
                
            }
            
            return
        }
        SKPaymentQueue.default().add(SKPayment(product:JuicoyValidProduct))
//        DispatchQueue.main.async {
//            NotificationCenter.default.post(name: Self.JuicoyDidQueuePaymentNotification, object: JuicoyValidProduct.productIdentifier)
//            
//            
//        }
    }
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
//        JuicoyTimeoutTask?.cancel()
//        JuicoyTimeoutTask = nil
        DispatchQueue.main.async {
            self.JuicoyCurrentSignal = nil
            self.JuicoyFinalizeEnergyResult(.failure(error))
        }
        
//        JuicoyDidReceiveCatalogResponse = true
        
    }
    
//    func requestDidFinish(_ request: SKRequest) {
//        guard request === JuicoyCurrentSignal || JuicoyDidReceiveCatalogResponse == false else { return }
//        guard JuicoyEnergyResponse != nil else { return }
//        let JuicoyError = NSError(
//            domain: "JuicoyApp",
//            code: 705,
//            userInfo: [NSLocalizedDescriptionKey: "Unable to load purchase information right now. Please try again."]
//        )
//        JuicoyCurrentSignal = nil
//        self.JuicoyFinalizeEnergyResult(.failure(JuicoyError))
//    }
}

extension JuicoyPayTool: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for JuicoyTx in transactions {
            switch JuicoyTx.transactionState {
            case .purchased:
                self.JuicoyLatestPulseID = JuicoyTx.transactionIdentifier
                SKPaymentQueue.default().finishTransaction(JuicoyTx)
                DispatchQueue.main.async {
                    self.JuicoyFinalizeEnergyResult(.success(()))
                }
                
                
            case .failed:
                SKPaymentQueue.default().finishTransaction(JuicoyTx)
                let JuicoyIssue: Error
                if (JuicoyTx.error as? SKError)?.code == .paymentCancelled {
                    JuicoyIssue = NSError(domain: "JuicoyApp", code: -999, userInfo: [NSLocalizedDescriptionKey: "Cdawnacyemlp bpeayytmlesnit".JoicoydeMercrypt()])
                } else {
                    JuicoyIssue = JuicoyTx.error ?? NSError(domain: "JuicoyApp", code: 703, userInfo: [NSLocalizedDescriptionKey: "Frldumxy lijnhtieerrrzukpltiiroyng.".JoicoydeMercrypt()])
                }
                DispatchQueue.main.async {
                    self.JuicoyFinalizeEnergyResult(.failure(JuicoyIssue))
                }
                
                
            case .restored:
                SKPaymentQueue.default().finishTransaction(JuicoyTx)
//                self.JuicoyFinalizeEnergyResult(.success(()))
                
            case .deferred, .purchasing:
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: Self.JuicoyDidQueuePaymentNotification, object: JuicoyTx.payment.productIdentifier)
                }
                
            default:
                break
            }
        }
    }
}

extension JuicoyPayTool {
    private func JuicoyFinalizeEnergyResult(_ JuicoyResult: Result<Void, Error>) {
//        JuicoyTimeoutTask?.cancel()
//        JuicoyTimeoutTask = nil
//        JuicoyDidReceiveCatalogResponse = false
        DispatchQueue.main.async {
            self.JuicoyEnergyResponse?(JuicoyResult)
            self.JuicoyEnergyResponse = nil
        }
    }
    
    func JuicoyFetchLocalVoucher() -> Data? {
        guard let JuicoyPath = Bundle.main.appStoreReceiptURL else {
            return nil
        }
        return try? Data(contentsOf: JuicoyPath)
    }
}
