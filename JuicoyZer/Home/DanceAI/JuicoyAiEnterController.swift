//
//  JuicoyAiEnterController.swift
//  JuicoyZer
//
//  Created by mumu on 2025/12/25.
//

import UIKit

class JuicoyAiEnterController: JuicoySeconedViewController, UITableViewDataSource, UITableViewDelegate {
    private var JuicoyFabricCollection: [JuicoyFabricMessage] = [
            JuicoyFabricMessage(JuicoyContent: "Hi there! I'm your Pole Dance AI. Ask me anything you'd like to know.", JuicoyIsLead: true, JuicoyTimestamp: ""),
            JuicoyFabricMessage(JuicoyContent: "I'm a beginner. What should I practice first?", JuicoyIsLead: false, JuicoyTimestamp: ""),
            JuicoyFabricMessage(JuicoyContent: "Start with basic grips and spins. Focus on control and consistency, not speed.", JuicoyIsLead: true, JuicoyTimestamp: "Today 8:43 AM"),
            JuicoyFabricMessage(JuicoyContent: "Can you suggest something simple for today?", JuicoyIsLead: false, JuicoyTimestamp: "")
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

        self.title = "Pole Dance AI"
        self.JuicoyaddRightBarButton(image: UIImage.init(named: "jocoymoiehwhite"))
        
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
    }
    
//举报
    override func JuicoyonRightBarButtonTapped(){
        
    }

    
  
    @objc private func JuicoyExecuteSignalTransmission() {
            
        guard let JuicoyRawText = JUICYEmailTextField.text, !JuicoyRawText.trimmingCharacters(in: .whitespaces).isEmpty else {
            self.JUICOYshowMessage("Please enter your question at first!")
            return
        }
        
        let JuicoyNewPulse = JuicoyFabricMessage(JuicoyContent: JuicoyRawText, JuicoyIsLead: false, JuicoyTimestamp: "")
        JuicoyFabricCollection.append(JuicoyNewPulse)
        
    JUICYEmailTextField.text = ""
        JuicoySynchronizeVibration()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.JuicoySimulateAIEcho()
        }
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
        let JuicoyAIPulse = JuicoyFabricMessage(JuicoyContent: "That's a great observation! Keep practicing your grip strength.", JuicoyIsLead: true, JuicoyTimestamp: "Just now")
        JuicoyFabricCollection.append(JuicoyAIPulse)
        JuicoySynchronizeVibration()
    }
   
}

    
extension JuicoyAiEnterController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        JuicoyExecuteSignalTransmission()
        return true
    }
    
}
