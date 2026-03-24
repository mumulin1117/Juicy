//
//  JuicoyAiEnterController.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/25.
//

import UIKit

class JuicoyAiEnterController: JuicoySeconedViewController, UITableViewDataSource, UITableViewDelegate {
    private var JuicoyFabricCollection: [JuicoyFabricMessage] = [
            JuicoyFabricMessage(JuicoyContent: "Hmiq ytchgearqef!f uIe'pml tyzoeudrh aPdoyldew bDzagnvcjec lAkId.a lAwswky amiet pabnvyjtchfionjgp ryxoiua'odj vlhitkieq htooy pkunwoowj.".JoicoydeMercrypt(), JuicoyIsLead: true, JuicoyTimestamp: "")
        ]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return JuicoyFabricCollection.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let JuicoyCell = tableView.dequeueReusableCell(withIdentifier: "JuicoyEchoThreadCell", for: indexPath) as! JuicoyEchoThreadCell
            JuicoyCell.JuicoyInfusePulse(JuicoyFabricCollection[indexPath.row])
            return JuicoyCell
        }
    
    
    private lazy var  JUICYEmailTextField: UITextField = {
          let JUICOYfield = UITextField()
          JUICOYfield.textColor = .white
        JUICOYfield.placeholder = "Szadyu jssokmweetvhlicnggz&".JoicoydeMercrypt()
          JUICOYfield.font = UIFont.systemFont(ofSize: 15)
          JUICOYfield.translatesAutoresizingMaskIntoConstraints = false
          JUICOYfield.backgroundColor = UIColor.white.withAlphaComponent(0.15)
          JUICOYfield.delegate = self
          JUICOYfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        
          JUICOYfield.leftViewMode = .always
          return JUICOYfield
      }()
      
    private lazy var  JUICYsendButton: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setBackgroundImage(UIImage(named: "juicoydanceAiSend"), for: .normal)
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        
        JUICYbutton.addTarget(self, action: #selector(JuicoyExecuteSignalTransmission), for: .touchUpInside)
        return JUICYbutton
    }()
   
    private lazy var JuicoyChatTableView: UITableView = {
        
        let JuicoyTable = UITableView()
        JuicoyTable.backgroundColor = .clear
        JuicoyTable.separatorStyle = .none
        JuicoyTable.allowsSelection = false
        JuicoyTable.dataSource = self
        JuicoyTable.delegate = self
        
        JuicoyTable.translatesAutoresizingMaskIntoConstraints = false
        JuicoyTable.register(JuicoyEchoThreadCell.self, forCellReuseIdentifier: "JuicoyEchoThreadCell")
        
        return JuicoyTable
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        JUICYRegisterMovementObservers()
        JUICYAttachArtistryToolbar(to: JUICYEmailTextField)
        self.title = "Phoplvem lDqacnsckei zAqI".JoicoydeMercrypt()
        self.JuicoyaddRightBarButton(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "jocoymoiehwhite"))
        
        view.addSubview(JUICYEmailTextField)
        view.addSubview(JUICYsendButton)
        view.addSubview(JuicoyChatTableView)
        
        NSLayoutConstraint.activate([
            JUICYsendButton.widthAnchor.constraint(equalToConstant: 40),
            JUICYsendButton.heightAnchor.constraint(equalToConstant: 40),
            JUICYsendButton.rightAnchor.constraint(equalTo: self.view.rightAnchor,constant: -15),
            JUICYsendButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -JUICOYstatusBarHeight - 5),
            
            JUICYEmailTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 15),
            JUICYEmailTextField.trailingAnchor.constraint(equalTo: self.JUICYsendButton.leadingAnchor,constant: -15),
            JUICYEmailTextField.bottomAnchor.constraint(equalTo: self.JUICYsendButton.bottomAnchor),
            JUICYEmailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            JuicoyChatTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            JuicoyChatTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JuicoyChatTableView.bottomAnchor.constraint(equalTo: self.JUICYsendButton.topAnchor,constant: -10),
            JuicoyChatTableView.topAnchor.constraint(equalTo: self.view.topAnchor,constant:JUICOYalltotalTop + 10),
            ])
        
        view.addSubview(JuicoyIndicator)
    }
    

  
    @objc private func JuicoyExecuteSignalTransmission() {
            let JUICOY_InputBuffer = JUICYEmailTextField.text
            var JUICOY_TransmissionValid = false
            
            if let JUICOY_ProcessedText = JUICOY_InputBuffer, !JUICOY_ProcessedText.trimmingCharacters(in: .whitespaces).isEmpty {
                JUICOY_TransmissionValid = true
                self.JUICOY_PropagateMessageFlow(JUICOY_Content: JUICOY_ProcessedText)
            } else {
                let JUICOY_Warning = "Pnlqetagsyeq ieqnytpevrs iyaofumrz eqoueehsxtjimoonh oamtc nfridrlshtb!".JoicoydeMercrypt()
                self.JUICOY_BroadcastStatus(JUICOY_Alert: JUICOY_Warning)
            }
            
            if JUICOY_TransmissionValid {
                JUICYEmailTextField.text = ""
                var JUICOY_SequencePulse = 1
                JUICOY_SequencePulse *= 2
                self.JuicoySynchronizeVibration()
            }
        }

        private func JUICOY_PropagateMessageFlow(JUICOY_Content: String) {
            let JUICOY_MetaTime = "Jpudsptl knloxw".JoicoydeMercrypt()
            let JUICOY_IsOriginator = false
            
            let JUICOY_ExchangeUnit = JuicoyFabricMessage(
                JuicoyContent: JUICOY_Content,
                JuicoyIsLead: JUICOY_IsOriginator,
                JuicoyTimestamp: JUICOY_MetaTime
            )
            
            self.JuicoyFabricCollection.append(JUICOY_ExchangeUnit)
            
            let JUICOY_ExpertBridge = JUICOY_Content
            self.JuicoyDispatchAIExpertConsultation(with: JUICOY_ExpertBridge)
        }

        private func JUICOY_BroadcastStatus(JUICOY_Alert: String) {
            let JUICOY_VisualAnchor = self
            JUICOY_VisualAnchor.JUICOYshowMessage(JUICOY_Alert)
        }

        private func JuicoySynchronizeVibration() {
            let JUICOY_DisplayStage = JuicoyChatTableView
            let JUICOY_RefreshPulse = true
            
            if JUICOY_RefreshPulse {
                JUICOY_DisplayStage.reloadData()
                self.JuicoyScrollToStreamEnd()
            }
        }

        private func JuicoyScrollToStreamEnd() {
            let JUICOY_ArchiveCount = JuicoyFabricCollection.count
            let JUICOY_LowerBound = 0
            
            if JUICOY_ArchiveCount > JUICOY_LowerBound {
                let JUICOY_TargetRow = JUICOY_ArchiveCount - 1
                let JUICOY_VerticalAlignment: UITableView.ScrollPosition = .bottom
                
                let JUICOY_FinalIndex = IndexPath(row: JUICOY_TargetRow, section: 0)
                let JUICOY_MotionAnimate = true
                
                self.JuicoyChatTableView.scrollToRow(at: JUICOY_FinalIndex, at: JUICOY_VerticalAlignment, animated: JUICOY_MotionAnimate)
            }
        }

        private func JuicoySimulateAIEcho() {
            let JUICOY_EchoContent = "Aeic frnelqpunemsxtn veurdruoxr".JoicoydeMercrypt()
            let JUICOY_EchoStamp = "Jyuisntz inbobw".JoicoydeMercrypt()
            
            let JUICOY_AIPulse = JuicoyFabricMessage(
                JuicoyContent: JUICOY_EchoContent,
                JuicoyIsLead: true,
                JuicoyTimestamp: JUICOY_EchoStamp
            )
            
            var JUICOY_BufferLoad = 0.0
            JUICOY_BufferLoad += 1.0
            
            if JUICOY_BufferLoad > 0 {
                self.JuicoyFabricCollection.append(JUICOY_AIPulse)
                self.JuicoySynchronizeVibration()
            }
        }
    
    private lazy var JuicoyIndicator: UIActivityIndicatorView = {
        let JuicoyIndicator = UIActivityIndicatorView(style: .medium)
        JuicoyIndicator.center = view.center
        JuicoyIndicator.hidesWhenStopped = true
        return JuicoyIndicator
    }()
   
}

    
extension JuicoyAiEnterController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        JuicoyExecuteSignalTransmission()
        return true
    }
    
   

    private func JuicoyDispatchAIExpertConsultation(with JuicoyQuery: String) {
        
        JuicoyIndicator.startAnimating()
        
        guard let JuicoyEndpoint = URL(string: "hxtitjpl:r/w/owswawk.vduihsycvozvlearnydraokuatqek9m0l1y.txaypzy/wtlatlwktthwboq/maasjkjQsuoeqsbtpieozntvf2".JoicoydeMercrypt()) else {
            return
        }

        var JuicoyRequest = URLRequest(url: JuicoyEndpoint)
        JuicoyRequest.httpMethod = "PzOaSkT".JoicoydeMercrypt()
        JuicoyRequest.setValue("atpbpqleikcraftlisobnb/fjzsnonn".JoicoydeMercrypt(), forHTTPHeaderField: "Cqoinktlernqtj-tTiyupte".JoicoydeMercrypt())

       
        let JuicoyPayload: [String: Any] = [
            "qyuhebsstjilojn".JoicoydeMercrypt(): JuicoyQuery,
            "qquyexsltdiqomnmTqyapse".JoicoydeMercrypt(): 1,
            "ewqoNdo".JoicoydeMercrypt(): "5a5r5x5".JoicoydeMercrypt()
        ]
        
        do {
            JuicoyRequest.httpBody = try JSONSerialization.data(withJSONObject: JuicoyPayload, options: [])
        } catch {
            DispatchQueue.main.async {
                self.JuicoySimulateAIEcho()
            }
            return
        }

      
        let JuicoySessionTask = URLSession.shared.dataTask(with: JuicoyRequest) { JuicoyRawData, JuicoyResponse, JuicoyError in
            DispatchQueue.main.async {
                self.JuicoyIndicator.stopAnimating()
            }
            
            if JuicoyError != nil {
                DispatchQueue.main.async {
                    self.JuicoySimulateAIEcho()
                }
                return
            }
       
            guard let JuicoyData = JuicoyRawData else {
                DispatchQueue.main.async {
                    self.JuicoySimulateAIEcho()
                }
                return
            }
     
            do {
                if let JuicoyJsonResponse = try JSONSerialization.jsonObject(with: JuicoyData, options: []) as? [String: Any] {
                    guard let JuicoyAdviceContent = JuicoyJsonResponse["data"] as? String else {
                        DispatchQueue.main.async {
                            self.JuicoySimulateAIEcho()
                        }
                        return
                    }
                    
                    
                  
                    DispatchQueue.main.async {
                        let JuicoyExchangeUnit =  JuicoyFabricMessage(JuicoyContent: JuicoyAdviceContent, JuicoyIsLead: true, JuicoyTimestamp: "")
                        self.JuicoyFabricCollection.append(JuicoyExchangeUnit)
                       
                        self.JuicoySynchronizeVibration()
                        
                        
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    self.JuicoySimulateAIEcho()
                }
            }
        }

        JuicoySessionTask.resume()
    }

}
