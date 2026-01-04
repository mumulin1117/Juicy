//
//  JuicoyAiEnterController.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/25.
//

import UIKit

class JuicoyAiEnterController: JuicoySeconedViewController, UITableViewDataSource, UITableViewDelegate {
    private var JuicoyFabricCollection: [JuicoyFabricMessage] = [
            JuicoyFabricMessage(JuicoyContent: "Hi there! I'm your Pole Dance AI. Ask me anything you'd like to know.", JuicoyIsLead: true, JuicoyTimestamp: "")
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
          JUICOYfield.placeholder = "Say something…"
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
        JUICYbutton.setBackgroundImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "juicoydanceAiSend"), for: .normal)
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

        self.title = "Pole Dance AI"
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
            
        guard let JuicoyRawText = JUICYEmailTextField.text, !JuicoyRawText.trimmingCharacters(in: .whitespaces).isEmpty else {
            self.JUICOYshowMessage("Please enter your question at first!")
            return
        }
        
        let JuicoyExchangeUnit =  JuicoyFabricMessage(JuicoyContent: JuicoyRawText, JuicoyIsLead: false, JuicoyTimestamp: "Just now")
        self.JuicoyFabricCollection.append(JuicoyExchangeUnit)
       
      
        JuicoyDispatchAIExpertConsultation(with: JuicoyRawText)
       
        
    
        JUICYEmailTextField.text = ""
        
        JuicoySynchronizeVibration()
        
      
    }

    private func JuicoySynchronizeVibration() {
        JuicoyChatTableView.reloadData()
        JuicoyScrollToStreamEnd()
    }

    private func JuicoyScrollToStreamEnd() {
        if JuicoyFabricCollection.count > 0 {
            let JuicoyFinalIndex = IndexPath(row: JuicoyFabricCollection.count - 1, section: 0)
            JuicoyChatTableView.scrollToRow(at: JuicoyFinalIndex, at: .bottom, animated: true)
        }
    }

    private func JuicoySimulateAIEcho() {
        let JuicoyAIPulse = JuicoyFabricMessage(JuicoyContent: "Ai request error", JuicoyIsLead: true, JuicoyTimestamp: "Just now")
        JuicoyFabricCollection.append(JuicoyAIPulse)
        JuicoySynchronizeVibration()
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
        // 使用 Juicoy 特色的加载提示
        JuicoyIndicator.startAnimating()
        
        guard let JuicoyEndpoint = URL(string: "http://www.discoveryroute901.xyz/talktwo/askQuestionv2") else {
            return
        }

        var JuicoyRequest = URLRequest(url: JuicoyEndpoint)
        JuicoyRequest.httpMethod = "POST"
        JuicoyRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // 参数命名根据 App 描述调整，增强关联性
        let JuicoyPayload: [String: Any] = [
            "question": JuicoyQuery,       // 用户关于钢管舞技巧或动作的咨询
            "questionType": 1,             // 预留类型标识
            "eqNo": "5555"                 // 内部识别码
        ]
        
        do {
            JuicoyRequest.httpBody = try JSONSerialization.data(withJSONObject: JuicoyPayload, options: [])
        } catch {
            DispatchQueue.main.async {
                self.JuicoySimulateAIEcho()
            }
            return
        }

        // 执行异步数据任务
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
