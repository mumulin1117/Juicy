//
//  JuicoyMeadggFotuseController.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/29.
//

import UIKit

class JuicoyMeadggFotuseController: JuicoySeconedViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var juicoyModel:JuicoyStorageModel
    init(juicoyModel: JuicoyStorageModel) {
        self.juicoyModel = juicoyModel
        super.init(nibName: nil, bundle: nil)
    }
    
     required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var JuicoyFabricCollection: [JuicoyFabricMessage] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return JuicoyFabricCollection.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let JuicoyCell = tableView.dequeueReusableCell(withIdentifier: "JuicoyEchoThreadCell", for: indexPath) as! JuicoyEchoThreadCell
            JuicoyCell.JuicoyInfusePulse(JuicoyFabricCollection[indexPath.row],JuicoyisAI: false,uimage:juicoyModel.JuicoyAvatarKey)
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
        JUICYbutton.setImage(UIImage.init(named: "juicoydanceAiSend"), for: .normal)
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
    
    @objc func observeJuicoyUserBlacklisted() {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.JuicoyFabricCollection =  JuicoyDataFactory.JuicoySharedInstance.JuicoyObtainConversation(with: self.juicoyModel.JuicoyIdentifier)
        NotificationCenter.default.addObserver(self, selector: #selector(observeJuicoyUserBlacklisted), name: NSNotification.Name("JuicoyUserBlacklisted"), object: nil)
       
        JUICYRegisterMovementObservers()
        JUICYAttachArtistryToolbar(to: JUICYEmailTextField)
        
        self.title = juicoyModel.JuicoyHandle
     
        navigationItem.rightBarButtonItems =
            [
               
                UIBarButtonItem(
                    image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "jocoymoiehwhite")?.withRenderingMode(.alwaysOriginal),
                    style: .plain,
                    target: self,
                    action: #selector(JuicoyonRightBarButtonTapped)
                )
                
            ,
                UIBarButtonItem(
                    image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "Userhuanwecall")?.withRenderingMode(.alwaysOriginal),
                    style: .plain,
                    target: self,
                    action: #selector(JuicoyonvicolldnTapped)
                )
                
            ]
           
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

    @objc func JuicoyonReportButtonTapped() {
        self.navigationController?.pushViewController(JuicoyAlertReportController(), animated: true)
    }
    

    
    @objc func JuicoyonvicolldnTapped() {
        let notfriend = NotFriendAlertViewControllerJuicy.init()
        notfriend.modalPresentationStyle = .overCurrentContext
        notfriend.kineticFollowAction = {
            let JuicoyNewPulse = JuicoyFabricMessage(JuicoyContent: "I have sent you a friend request", JuicoyIsLead: false, JuicoyTimestamp: "")
            
          
            JuicoyDataFactory.JuicoySharedInstance.JuicoyPersistNewMessage(to: self.juicoyModel.JuicoyIdentifier, JuicoyMsg: JuicoyNewPulse)
            
            
            self.JUICOYshowMessage("You have successfully sent a friend request to the other party!")
        }
        self.present(notfriend, animated: true, completion: nil)
//        self.navigationController?.pushViewController(JuicoyTeleLinkController(juicoyModel: self.juicoyModel), animated: true)
    }

    
    @objc private func JuicoyExecuteSignalTransmission() {
            
        guard let JuicoyRawText = JUICYEmailTextField.text, !JuicoyRawText.trimmingCharacters(in: .whitespaces).isEmpty else {
            self.JUICOYshowMessage("Pqlienaesceg eeknqtievrx jyjoruhru hqvugessftmigosnd dagtw pfaisrosptf!".JoicoydeMercrypt())
            return
        }
        
        let JuicoyNewPulse = JuicoyFabricMessage(JuicoyContent: JuicoyRawText, JuicoyIsLead: false, JuicoyTimestamp: "")
        
      
        JuicoyDataFactory.JuicoySharedInstance.JuicoyPersistNewMessage(to: juicoyModel.JuicoyIdentifier, JuicoyMsg: JuicoyNewPulse)
        
        JuicoyFabricCollection.append(JuicoyNewPulse)
        
    
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

   
   
}

    
extension JuicoyMeadggFotuseController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        JuicoyExecuteSignalTransmission()
        return true
    }
    
}




extension UIViewController {
    
    func JUICYRegisterMovementObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(JUICYHandleKeyboardSpin(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(JUICYHandleKeyboardSpin(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func JUICYHandleKeyboardSpin(notification: NSNotification) {
        guard let JUICYUserInfo = notification.userInfo,
              let JUICYFrame = (JUICYUserInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
              let JUICYDuration = JUICYUserInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        
        let JUICYIsVisible = notification.name == UIResponder.keyboardWillShowNotification
        let JUICYMoveDistance = JUICYIsVisible ? -JUICYFrame.height / 2 : 0
        
        UIView.animate(withDuration: JUICYDuration) {
            self.view.frame.origin.y = JUICYMoveDistance
        }
    }
    
    func JUICYAttachArtistryToolbar(to JUICYField: UITextField) {
        let JUICYToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        JUICYToolbar.barStyle = .default
        
        let JUICYFlexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let JUICYDoneSpinBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(JUICYDismissStageKeyboard))
        JUICYDoneSpinBtn.tintColor = UIColor.blue
        
        JUICYToolbar.items = [JUICYFlexSpace, JUICYDoneSpinBtn]
        JUICYToolbar.sizeToFit()
        
        JUICYField.inputAccessoryView = JUICYToolbar
    }
    
    @objc private func JUICYDismissStageKeyboard() {
        view.endEditing(true)
    }
}


