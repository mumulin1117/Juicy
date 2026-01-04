//
//  JuicoyInsightPanelController.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/29.
//

import UIKit
protocol JuicoyInsightInteractionDelegate: AnyObject {
    func JuicoyDidSelectNewArchive(JuicoyData: JuicoyStorageModel)
}
class JuicoyInsightPanelController: UIViewController {
    weak var JuicoyInteractionDelegate: JuicoyInsightInteractionDelegate?
    private let JuicoyPanelCanvas: UIView = {
        let JuicoyView = UIView()
        JuicoyView.backgroundColor = UIColor(red: 18/255, green: 18/255, blue: 18/255, alpha: 1.0)
        JuicoyView.layer.cornerRadius = 20
        JuicoyView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()
    
    private let JuicoyPanelHeadlight: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.text = "Recommend more videos"
        JuicoyLab.textColor = .white
        JuicoyLab.font = .systemFont(ofSize: 18, weight: .bold)
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()
    
    private let JuicoyViewMetric: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.text = "views"
        JuicoyLab.textColor = .gray
        JuicoyLab.font = .systemFont(ofSize: 12)
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()
    
    private let JuicoyDismissCross: UIButton = {
        let JuicoyBtn = UIButton(type: .system)
        JuicoyBtn.setImage(UIImage(systemName: "xmark"), for: .normal)
        JuicoyBtn.tintColor = .white
        JuicoyBtn.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyBtn
    }()
    
    private let JuicoyDiscoveryTable: UITableView = {
        let JuicoyTab = UITableView()
        JuicoyTab.backgroundColor = .clear
        JuicoyTab.separatorStyle = .none
        JuicoyTab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyTab
    }()
    
    private var JuicoyDraftData: [JuicoyStorageModel]  = Array<JuicoyStorageModel>()
    
    private func geting() -> Array<JuicoyStorageModel> {
        // 1. 获取完整的缓存数据
               
        let JuicoyAllData = JuicoyDataFactory.JuicoySharedInstance.JuicoyObtainCachedPayload()
        
        // 2. 安全获取前 8 条数据（防止数组越界）
        let JuicoyTopLimit = min(JuicoyAllData.count, 9)
        var JuicoySubset = Array(JuicoyAllData.prefix(JuicoyTopLimit))
        
        // 3. 对这 8 条数据进行随机打乱 (Shuffling)
        JuicoySubset.shuffle()
        
        // 4. 随机决定抽取的数量 (1 到 3 条)
        let JuicoyRandomCount = Int.random(in: 2...3)
        
        // 5. 再次安全提取并返回最终结果
        let JuicoyFinalSelection = Array(JuicoySubset.prefix(min(JuicoySubset.count, JuicoyRandomCount)))
        
        return JuicoyFinalSelection
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        JuicoyDraftData =  geting()
        JuicoyAssembleInterface()
    }
    
    private func JuicoyAssembleInterface() {
        view.backgroundColor = .clear
        let JuicoyTapOut = UITapGestureRecognizer(target: self, action: #selector(JuicoyClosePanel))
        let JuicoyBackgroundDim = UIView(frame: view.bounds)
        JuicoyBackgroundDim.addGestureRecognizer(JuicoyTapOut)
        view.addSubview(JuicoyBackgroundDim)
        
        view.addSubview(JuicoyPanelCanvas)
        JuicoyPanelCanvas.addSubview(JuicoyPanelHeadlight)
        JuicoyPanelCanvas.addSubview(JuicoyViewMetric)
        JuicoyPanelCanvas.addSubview(JuicoyDismissCross)
        JuicoyPanelCanvas.addSubview(JuicoyDiscoveryTable)
        
        JuicoyDiscoveryTable.delegate = self
        JuicoyDiscoveryTable.dataSource = self
        JuicoyDiscoveryTable.register(JuicoyMotionEntryCell.self, forCellReuseIdentifier: "JuicoyEntry")
        
        NSLayoutConstraint.activate([
            JuicoyPanelCanvas.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JuicoyPanelCanvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JuicoyPanelCanvas.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            JuicoyPanelCanvas.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),
            
            JuicoyPanelHeadlight.topAnchor.constraint(equalTo: JuicoyPanelCanvas.topAnchor, constant: 20),
            JuicoyPanelHeadlight.leadingAnchor.constraint(equalTo: JuicoyPanelCanvas.leadingAnchor, constant: 16),
            
            JuicoyViewMetric.topAnchor.constraint(equalTo: JuicoyPanelHeadlight.bottomAnchor, constant: 4),
            JuicoyViewMetric.leadingAnchor.constraint(equalTo: JuicoyPanelHeadlight.leadingAnchor),
            
            JuicoyDismissCross.centerYAnchor.constraint(equalTo: JuicoyPanelHeadlight.centerYAnchor),
            JuicoyDismissCross.trailingAnchor.constraint(equalTo: JuicoyPanelCanvas.trailingAnchor, constant: -16),
            
            JuicoyDiscoveryTable.topAnchor.constraint(equalTo: JuicoyViewMetric.bottomAnchor, constant: 20),
            JuicoyDiscoveryTable.leadingAnchor.constraint(equalTo: JuicoyPanelCanvas.leadingAnchor),
            JuicoyDiscoveryTable.trailingAnchor.constraint(equalTo: JuicoyPanelCanvas.trailingAnchor),
            JuicoyDiscoveryTable.bottomAnchor.constraint(equalTo: JuicoyPanelCanvas.bottomAnchor)
        ])
        
        JuicoyDismissCross.addTarget(self, action: #selector(JuicoyClosePanel), for: .touchUpInside)
    }
    
    @objc private func JuicoyClosePanel() {
        self.dismiss(animated: true)
    }
}

extension JuicoyInsightPanelController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.JuicoyDraftData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let JuicoyCell = tableView.dequeueReusableCell(withIdentifier: "JuicoyEntry", for: indexPath) as! JuicoyMotionEntryCell
        let JuicoyItem = JuicoyDraftData[indexPath.row]
        JuicoyCell.JuicoyHydrate(JuicoyTitle: JuicoyItem.JuicoyMediaNarration ,
                                 JuicoyTime: JuicoyItem.JUICOYUViadioTime ,
                                JuicoyLikes: "0",
                                 JuicoyLast: false,
                                 JuicoyIndex: indexPath.row, covrr: JuicoyItem.JuicoyMediaCover)
        return JuicoyCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let JuicoySelectedItem = JuicoyDraftData[indexPath.row]
        
        // Visual feedback
        let JuicoyHaptic = UISelectionFeedbackGenerator()
        JuicoyHaptic.selectionChanged()
        
        // Dismiss the drawer and then trigger navigation
        self.dismiss(animated: true) { [weak self] in
            self?.JuicoyInteractionDelegate?.JuicoyDidSelectNewArchive(JuicoyData: JuicoySelectedItem)
        }
        
    }
}

class JuicoyMotionEntryCell: UITableViewCell {
    
    private let JuicoyCoreContainer: UIView = {
        let JuicoyView = UIView()
        JuicoyView.backgroundColor = UIColor(white: 1.0, alpha: 0.05)
        JuicoyView.layer.cornerRadius = 12
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()
    
    private let JuicoyPreviewFrame: UIImageView = {
        let JuicoyImg = UIImageView()
        JuicoyImg.contentMode = .scaleAspectFill
        JuicoyImg.layer.cornerRadius = 8
        JuicoyImg.clipsToBounds = true
        JuicoyImg.backgroundColor = .darkGray
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyImg
    }()
    
    private let JuicoyTitleScript: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.textColor = .white
        JuicoyLab.font = .systemFont(ofSize: 14, weight: .medium)
        JuicoyLab.numberOfLines = 2
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()
    
    private let JuicoyChronosLabel: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.textColor = .lightGray
        JuicoyLab.font = .systemFont(ofSize: 12)
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()
    
    private let JuicoyHeartScore: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.textColor = .systemYellow
        JuicoyLab.font = .systemFont(ofSize: 12)
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()
    
    private let JuicoyLastSeenTag: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.text = "Last viewed"
        JuicoyLab.backgroundColor = .black.withAlphaComponent(0.6)
        JuicoyLab.textColor = .white
        JuicoyLab.font = .systemFont(ofSize: 10)
        JuicoyLab.textAlignment = .center
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        JuicoyLayoutNode()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func JuicoyLayoutNode() {
        contentView.addSubview(JuicoyCoreContainer)
        JuicoyCoreContainer.addSubview(JuicoyPreviewFrame)
        JuicoyCoreContainer.addSubview(JuicoyTitleScript)
        JuicoyCoreContainer.addSubview(JuicoyChronosLabel)
        JuicoyCoreContainer.addSubview(JuicoyHeartScore)
        JuicoyPreviewFrame.addSubview(JuicoyLastSeenTag)
        
        NSLayoutConstraint.activate([
            JuicoyCoreContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            JuicoyCoreContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            JuicoyCoreContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            JuicoyCoreContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            JuicoyPreviewFrame.leadingAnchor.constraint(equalTo: JuicoyCoreContainer.leadingAnchor, constant: 10),
            JuicoyPreviewFrame.centerYAnchor.constraint(equalTo: JuicoyCoreContainer.centerYAnchor),
            JuicoyPreviewFrame.widthAnchor.constraint(equalToConstant: 100),
            JuicoyPreviewFrame.heightAnchor.constraint(equalToConstant: 80),
            
            JuicoyLastSeenTag.bottomAnchor.constraint(equalTo: JuicoyPreviewFrame.bottomAnchor),
            JuicoyLastSeenTag.leadingAnchor.constraint(equalTo: JuicoyPreviewFrame.leadingAnchor),
            JuicoyLastSeenTag.trailingAnchor.constraint(equalTo: JuicoyPreviewFrame.trailingAnchor),
            JuicoyLastSeenTag.heightAnchor.constraint(equalToConstant: 18),
            
            JuicoyTitleScript.topAnchor.constraint(equalTo: JuicoyPreviewFrame.topAnchor),
            JuicoyTitleScript.leadingAnchor.constraint(equalTo: JuicoyPreviewFrame.trailingAnchor, constant: 12),
            JuicoyTitleScript.trailingAnchor.constraint(equalTo: JuicoyCoreContainer.trailingAnchor, constant: -10),
            
            JuicoyChronosLabel.bottomAnchor.constraint(equalTo: JuicoyPreviewFrame.bottomAnchor),
            JuicoyChronosLabel.leadingAnchor.constraint(equalTo: JuicoyTitleScript.leadingAnchor),
            
            JuicoyHeartScore.bottomAnchor.constraint(equalTo: JuicoyPreviewFrame.bottomAnchor),
            JuicoyHeartScore.trailingAnchor.constraint(equalTo: JuicoyCoreContainer.trailingAnchor, constant: -10)
        ])
    }
    
    func JuicoyHydrate(JuicoyTitle: String, JuicoyTime: String, JuicoyLikes: String, JuicoyLast: Bool, JuicoyIndex: Int,covrr:String) {
        JuicoyTitleScript.text = JuicoyTitle
        JuicoyChronosLabel.text = JuicoyTime
        JuicoyHeartScore.text = JuicoyLikes
        JuicoyLastSeenTag.isHidden = !JuicoyLast
        JuicoyPreviewFrame.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: covrr)
        if JuicoyIndex == 0 {
            JuicoyTitleScript.textColor = .systemYellow
        } else {
            JuicoyTitleScript.textColor = .white
        }
    }
}
