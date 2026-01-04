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
    
    //拉黑刷新数据
    @objc func observeJuicoyUserBlacklisted() {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.JuicoyFabricCollection =  JuicoyDataFactory.JuicoySharedInstance.JuicoyObtainConversation(with: self.juicoyModel.JuicoyIdentifier)
        NotificationCenter.default.addObserver(self, selector: #selector(observeJuicoyUserBlacklisted), name: NSNotification.Name("JuicoyUserBlacklisted"), object: nil)

        self.title = juicoyModel.JuicoyHandle
//        JuicoyStaticBackdrop.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: juicoyModel.JuicoyAvatarKey)
      
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
    
//举报

    @objc func JuicoyonReportButtonTapped() {
        self.navigationController?.pushViewController(JuicoyAlertReportController(), animated: true)
    }
    

    
    @objc func JuicoyonvicolldnTapped() {
        self.navigationController?.pushViewController(JuicoyTeleLinkController(juicoyModel: self.juicoyModel), animated: true)
    }

    
    @objc private func JuicoyExecuteSignalTransmission() {
            
        guard let JuicoyRawText = JUICYEmailTextField.text, !JuicoyRawText.trimmingCharacters(in: .whitespaces).isEmpty else {
            self.JUICOYshowMessage("Pqlienaesceg eeknqtievrx jyjoruhru hqvugessftmigosnd dagtw pfaisrosptf!".JoicoydeMercrypt())
            return
        }
        
        let JuicoyNewPulse = JuicoyFabricMessage(JuicoyContent: JuicoyRawText, JuicoyIsLead: false, JuicoyTimestamp: "")
        
      

        // 保存到工厂缓存
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
