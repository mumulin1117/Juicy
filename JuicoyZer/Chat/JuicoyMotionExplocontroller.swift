//
//  JuicoyMotionExplocontroller.swift
//  JuicoyZer
//
//  Created by mumu on 2025/12/24.
//

import UIKit

class JuicoyMotionExplocontroller: JuicoyBasicController {
    
    private var JuicoyChatItems: [JuicoyChatItemModel] = []
    
    private lazy var  JUICYMotionStageContainer: UIImageView = {
        let JUICOY = UIImageView.init(image: UIImage.init(named: "JuicychauiTitle"))
        JUICOY.translatesAutoresizingMaskIntoConstraints = false
        return JUICOY
    }()
    private lazy var JuicoyCommentCountButton: UIButton = {
        let JUICYbutton = UIButton()
        
        JUICYbutton.setImage(UIImage(named: "JUICYchat"), for: .normal)
        JUICYbutton.translatesAutoresizingMaskIntoConstraints = false
        JUICYbutton.setTitle(" 0", for: .normal)
      
        return JUICYbutton
    }()
    private let JuicoySearchContainer = UIView()
        
    private let JuicoySearchIcon = UIImageView(image: UIImage.init(named: "Juicoyserchicon"))
    private let JuicoySearchField = UITextField()
    private let JuicoyChatTableView = UITableView(frame: .zero, style: .plain)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        JuicoyConfigureTable()
        JuicoyLoadMockData()
        JuicoySearchField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        JuicoySearchContainer.translatesAutoresizingMaskIntoConstraints = false
        JuicoySearchIcon.translatesAutoresizingMaskIntoConstraints = false
        JuicoySearchField.translatesAutoresizingMaskIntoConstraints = false
        JuicoyChatTableView.translatesAutoresizingMaskIntoConstraints = false
        JuicoyChatTableView.backgroundColor = .clear
        
        JuicoyConfigureSearch()
        JuicoyAssembleFashionComponents()
    }
    
    private func JuicoyAssembleFashionComponents() {
        view.addSubview(JUICYMotionStageContainer)
        view.addSubview(JuicoyCommentCountButton)
        view.addSubview(JuicoySearchContainer)
        JuicoySearchContainer.addSubview(JuicoySearchIcon)
        JuicoySearchContainer.addSubview(JuicoySearchField)
        
        view.addSubview(JuicoyChatTableView)
        NSLayoutConstraint.activate([
            JUICYMotionStageContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            JUICYMotionStageContainer.widthAnchor.constraint(equalToConstant: 61),
            JUICYMotionStageContainer.heightAnchor.constraint(equalToConstant: 30),
            JUICYMotionStageContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: JUICOYtopSafeAreaHeight + 14),
            
            
            JuicoyCommentCountButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
            JuicoyCommentCountButton.heightAnchor.constraint(equalToConstant: 82),
            JuicoyCommentCountButton.centerYAnchor.constraint(equalTo: JUICYMotionStageContainer.centerYAnchor),
            
            JuicoySearchContainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            JuicoySearchContainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
            JuicoySearchContainer.heightAnchor.constraint(equalToConstant: 50),
            JuicoySearchContainer.topAnchor.constraint(equalTo: self.JUICYMotionStageContainer.bottomAnchor, constant: 26),
            
            JuicoySearchIcon.leadingAnchor.constraint(equalTo: self.JuicoySearchContainer.leadingAnchor, constant: 20),
            JuicoySearchIcon.heightAnchor.constraint(equalToConstant: 18),
            JuicoySearchIcon.centerYAnchor.constraint(equalTo: self.JuicoySearchContainer.centerYAnchor),
            JuicoySearchIcon.widthAnchor.constraint(equalToConstant: 17),
            
            JuicoySearchField.heightAnchor.constraint(equalToConstant: 50),
            JuicoySearchField.trailingAnchor.constraint(equalTo: JuicoySearchContainer.trailingAnchor, constant: -10),
            JuicoySearchField.leadingAnchor.constraint(equalTo: JuicoySearchIcon.trailingAnchor,constant: 12),
            JuicoySearchField.centerYAnchor.constraint(equalTo: self.JuicoySearchIcon.centerYAnchor),
           
            JuicoyChatTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            JuicoyChatTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JuicoyChatTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            JuicoyChatTableView.topAnchor.constraint(equalTo: JuicoySearchContainer.bottomAnchor, constant:27),
           
        ])
    }
    
    private func JuicoyConfigureSearch() {
        
        JuicoySearchContainer.backgroundColor = UIColor.white.withAlphaComponent(0.08)
        JuicoySearchContainer.layer.cornerRadius = 22
        
        
        JuicoySearchIcon.image = UIImage(systemName: "magnifyingglass")
        JuicoySearchIcon.tintColor = UIColor.white.withAlphaComponent(0.6)
        JuicoySearchIcon.frame = CGRect(x: 16, y: 12, width: 20, height: 20)
        
        
        
        JuicoySearchField.placeholder = "Search"
        JuicoySearchField.textColor = .white
        JuicoySearchField.tintColor = .white
        JuicoySearchField.borderStyle = .none
        
        
    }
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

      
    private func JuicoyLoadMockData() {
        JuicoyChatItems = [
            JuicoyChatItemModel(JuicoyTitle: "System messages", JuicoySubtitle: "Your feed has fresh pole routines", JuicoyUnread: 3, JuicoyIsSystem: true),
            JuicoyChatItemModel(JuicoyTitle: "Cameron Curtis", JuicoySubtitle: "Shape motion into art", JuicoyUnread: 2, JuicoyIsSystem: false),
            JuicoyChatItemModel(JuicoyTitle: "Caleb Harmon", JuicoySubtitle: "Found through movement", JuicoyUnread: 5, JuicoyIsSystem: false),
            JuicoyChatItemModel(JuicoyTitle: "Bobby Patterson", JuicoySubtitle: "Dance in your own gravity", JuicoyUnread: 0, JuicoyIsSystem: false)
        ]
    }
    
    
    
}
extension JuicoyMotionExplocontroller: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        JuicoyChatItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let JuicoyCell = tableView.dequeueReusableCell(withIdentifier: "JuicoyChatCell", for: indexPath) as! JuicoyChatCell
        JuicoyCell.JuicoyBind(item: JuicoyChatItems[indexPath.row])
        return JuicoyCell
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let JuicoyDelete = UIContextualAction(style: .destructive, title: "Delete") { _, _, completion in
            self.JuicoyChatItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        JuicoyDelete.backgroundColor = UIColor(red: 1, green: 0.35, blue: 0.3, alpha: 1)
        return UISwipeActionsConfiguration(actions: [JuicoyDelete])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(JuicoyMeadggFotuseController(), animated: true)
    }
}
