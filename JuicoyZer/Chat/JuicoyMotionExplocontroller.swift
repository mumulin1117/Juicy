//
//  JuicoyMotionExplocontroller.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/24.
//

import UIKit

class JuicoyMotionExplocontroller: JuicoyBasicController {
    
    private var JuicoyChatItems: [JuicoyConversationPreview] = []
    
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
        
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.JuicoyChatItems = JuicoyDataFactory.JuicoySharedInstance.JuicoyFetchActiveRecipients()
        
        self.JuicoyChatTableView.reloadData()
        
    }
    private let JuicoySearchIcon = UIImageView(image: UIImage.init(named: "Juicoyserchicon"))
    private let JuicoySearchField = UITextField()
    private let JuicoyChatTableView = UITableView(frame: .zero, style: .plain)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        JuicoyConfigureTable()
      
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
        JuicoyConfigureSearchInteractions()
        
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

    // 在 viewDidLoad 或相关 UI 初始化方法中
    private func JuicoyConfigureSearchInteractions() {
        // 假设 JuicoySearchField 是一个 UITextField
        JuicoySearchField.delegate = self
        JuicoySearchField.addTarget(self, action: #selector(JuicoyExecutionSearchFlow(_:)), for: .editingChanged)
        JuicoySearchField.keyboardType = .webSearch
       
    }

    @objc private func JuicoyExecutionSearchFlow(_ sender: UITextField) {
        guard let JuicoyKeyword = sender.text?.lowercased(), !JuicoyKeyword.isEmpty else {
            // 如果搜索框为空，恢复显示全部随机数据
            JuicoyRestoreDiscoveryStream()
            return
        }

        // 1. 获取所有缓存数据
        let JuicoyAllPool = JuicoyDataFactory.JuicoySharedInstance.JuicoyFetchActiveRecipients()
        
        // 2. 执行多维度检索 (昵称 或 标签)
        let JuicoyFilteredResults = JuicoyAllPool.filter { JuicoyModel in
            let JuicoyMatchName = JuicoyModel.JuicoyUser.JuicoyHandle.lowercased().contains(JuicoyKeyword)
            let JuicoyMatchTags = JuicoyModel.JuicoyLastMsg.JuicoyContent.contains { $0.lowercased().contains(JuicoyKeyword) }
            
            return JuicoyMatchName || JuicoyMatchTags
        }
        
        // 3. 更新数据源并刷新 UI
        self.JuicoyChatItems = JuicoyFilteredResults
        self.JuicoyChatTableView.reloadData()
        
        // 4. 处理搜索为空的情况
//        JuicoyToggleEmptyPlaceholder(isVisible: JuicoyFilteredResults.isEmpty)
    }
    
    @objc private func JuicoyConfirmSearchAction() {
        JuicoySearchField.resignFirstResponder()
        
        // 执行一次最终搜索（防止 editingChanged 没捕捉到最后字符）
        if let JuicoyText = JuicoySearchField.text {
            JuicoyExecutionSearchFlow(JuicoySearchField)
        }
    }

    // 恢复初始流的方法
    private func JuicoyRestoreDiscoveryStream() {
        self.JuicoyChatItems = JuicoyDataFactory.JuicoySharedInstance.JuicoyFetchActiveRecipients()
        self.JuicoyChatTableView.reloadData()
        
    }
}

extension JuicoyMotionExplocontroller: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        JuicoyConfirmSearchAction()
        return true
    }
    
    // 当点击清除按钮时
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.JuicoyRestoreDiscoveryStream()
        }
        return true
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
        self.navigationController?.pushViewController(JuicoyMeadggFotuseController(juicoyModel: JuicoyChatItems[indexPath.row].JuicoyUser), animated: true)
    }
}
