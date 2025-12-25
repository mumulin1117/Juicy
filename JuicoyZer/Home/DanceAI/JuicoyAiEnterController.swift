//
//  JuicoyAiEnterController.swift
//  JuicoyZer
//
//  Created by mumu on 2025/12/25.
//

import UIKit

class JuicoyAiEnterController: JuicoySeconedViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let JuicoyCell = tableView.dequeueReusableCell(withIdentifier: "JuicoyChatCell", for: indexPath) as! JuicoyChatCell
        
        return JuicoyCell
    }
    
    
      private let JUICYEmailTextField: UITextField = {
          let JUICOYfield = UITextField()
          JUICOYfield.textColor = .white
          JUICOYfield.placeholder = "Say something…"
          JUICOYfield.font = UIFont.systemFont(ofSize: 15)
          JUICOYfield.translatesAutoresizingMaskIntoConstraints = false
          JUICOYfield.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        
          JUICOYfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        
          JUICOYfield.leftViewMode = .always
          return JUICOYfield
      }()
      
    private let JUICYsendButton: UIButton = {
        let JUICYbutton = UIButton()
        JUICYbutton.setBackgroundImage(UIImage(named: "juicoydanceAiSend"), for: .normal)
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        
        JUICYbutton.addTarget(self, action: #selector(juicoysendSmesgl), for: .touchUpInside)
        return JUICYbutton
    }()
    private let JuicoyChatTableView = UITableView(frame: .zero, style: .plain)
    private func JuicoyConfigureTable() {
        JuicoyChatTableView.frame = CGRect.zero
           JuicoyChatTableView.backgroundColor = .clear
           JuicoyChatTableView.separatorStyle = .none
           JuicoyChatTableView.rowHeight = 78
           JuicoyChatTableView.dataSource = self
           JuicoyChatTableView.delegate = self
           JuicoyChatTableView.register(JuicoyChatCell.self, forCellReuseIdentifier: "JuicoyChatCell")
           view.addSubview(JuicoyChatTableView)
      
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Pole Dance AI"
        self.JuicoyaddRightBarButton(image: UIImage.init(named: "jocoymoiehwhite"))
        
        view.addSubview(JUICYEmailTextField)
        view.addSubview(JUICYsendButton)
        JuicoyConfigureTable()
        
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
            JuicoyChatTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            JuicoyChatTableView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: JUICOYalltotalTop + 40),
            ])
    }
    
//举报
    override func JuicoyonRightBarButtonTapped(){
        
    }

    
   @objc func juicoysendSmesgl() {
        
    }
}
