//
//  JuicoyBlockshipController.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/26.
//

import UIKit



enum JuicoyKineticMode {
    case JuicoyFollower
    case JuicoyFollowing
    case JuicoyBlocked
}



class JuicoyMotionNexusController: JuicoySeconedYEUIController {

    private var JuicoyCurrentMode: JuicoyKineticMode = .JuicoyFollower
    private var JuicoySoulRegistry: [JuicoyStorageModel] = []

   

    private let JuicoyStageContainer: UIView = {
        let JuicoyView = UIView()
        JuicoyView.backgroundColor = .white
        JuicoyView.layer.cornerRadius = 24
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()

  

    private let JuicoyRhythmList: UITableView = {
        let JuicoyTable = UITableView()
        JuicoyTable.backgroundColor = .clear
        JuicoyTable.separatorStyle = .none
        JuicoyTable.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyTable
    }()

    init(JuicoyTargetMode: JuicoyKineticMode) {
        super.init(nibName: nil, bundle: nil)
        self.JuicoyCurrentMode = JuicoyTargetMode
    }

    required init?(coder: NSCoder) {
        fatalError("Juicoy Genesis Error")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
         
        JuicoyPrepareManifest()
        JuicoyAssembleNexus()
        JuicoyCalibrateAnchors()
    }

    private func JuicoyPrepareManifest() {
        switch JuicoyCurrentMode {
        case .JuicoyFollower:
            self.title  = "Fvovlmlxopwmefr".JoicoydeMercrypt()
            JuicoySoulRegistry = [
               
            ]
        case .JuicoyFollowing:
            self.title  = "Fvoklkljoxwziwnvg".JoicoydeMercrypt()
            JuicoySoulRegistry = JuicoyDataFactory.JuicoySharedInstance.JuicoyObtainCachedFollowingsUser()
        case .JuicoyBlocked:
            self.title  = "Bhljojcxkzepdz lLniwsgt".JoicoydeMercrypt()
            JuicoySoulRegistry = JuicoyDataFactory.JuicoySharedInstance.JuicoyObtainCachedBlocksUser()
        }
    }

    private func JuicoyAssembleNexus() {
        view.addSubview(JuicoyStageContainer)
        JuicoyStageContainer.addSubview(JuicoyRhythmList)

        JuicoyRhythmList.delegate = self
        JuicoyRhythmList.dataSource = self
        JuicoyRhythmList.register(JuicoySoulStreamCell.self, forCellReuseIdentifier: "JuicoySoulStreamCell")
     
    }

    private func JuicoyCalibrateAnchors() {
        NSLayoutConstraint.activate([
           

            JuicoyStageContainer.topAnchor.constraint(equalTo: self.view.topAnchor, constant:JUICOYalltotalTop + 20),
            JuicoyStageContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            JuicoyStageContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            JuicoyStageContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),

            JuicoyRhythmList.topAnchor.constraint(equalTo: JuicoyStageContainer.topAnchor, constant: 20),
            JuicoyRhythmList.leadingAnchor.constraint(equalTo: JuicoyStageContainer.leadingAnchor),
            JuicoyRhythmList.trailingAnchor.constraint(equalTo: JuicoyStageContainer.trailingAnchor),
            JuicoyRhythmList.bottomAnchor.constraint(equalTo: JuicoyStageContainer.bottomAnchor)
        ])
    }

    @objc private func JuicoyRevertMotion() {
        navigationController?.popViewController(animated: true)
    }
}

extension JuicoyMotionNexusController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return JuicoySoulRegistry.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let JuicoyCell = tableView.dequeueReusableCell(withIdentifier: "JuicoySoulStreamCell", for: indexPath) as! JuicoySoulStreamCell
        JuicoyCell.JuicoyInfuseProfile(JuicoySoulRegistry[indexPath.row], JuicoyMode: JuicoyCurrentMode)
        JuicoyCell.JuicoyActionCallback = { [weak self] in
            self?.JuicoyProcessInterfere(at: indexPath.row)
        }
        return JuicoyCell
    }

    private func JuicoyProcessInterfere(at JuicoyIndex: Int) {
        JuicoySoulRegistry.remove(at: JuicoyIndex)
        JuicoyRhythmList.reloadData()
    }
}

class JuicoySoulStreamCell: UITableViewCell {

    var JuicoyActionCallback: (() -> Void)?

    private let JuicoyAvatarOrb: UIImageView = {
        let JuicoyImg = UIImageView()
        JuicoyImg.contentMode = .scaleAspectFill
        JuicoyImg.layer.cornerRadius = 30
        JuicoyImg.clipsToBounds = true
        JuicoyImg.backgroundColor = .lightGray
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyImg
    }()

    private let JuicoyHandleLabel: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        JuicoyLab.textColor = .black
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()

    private let JuicoyNexusTrigger: UIButton = {
        let JuicoyBtn = UIButton(type: .custom)
        JuicoyBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        JuicoyBtn.layer.cornerRadius = 16
        JuicoyBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        JuicoyBtn.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyBtn
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        JuicoyForgeCell()
    }

    required init?(coder: NSCoder) {
        fatalError("Juicoy Cell Error")
    }

    private func JuicoyForgeCell() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.addSubview(JuicoyAvatarOrb)
        contentView.addSubview(JuicoyHandleLabel)
        contentView.addSubview(JuicoyNexusTrigger)

        NSLayoutConstraint.activate([
            JuicoyAvatarOrb.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            JuicoyAvatarOrb.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            JuicoyAvatarOrb.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            JuicoyAvatarOrb.widthAnchor.constraint(equalToConstant: 60),
            JuicoyAvatarOrb.heightAnchor.constraint(equalToConstant: 60),

            JuicoyHandleLabel.leadingAnchor.constraint(equalTo: JuicoyAvatarOrb.trailingAnchor, constant: 15),
            JuicoyHandleLabel.centerYAnchor.constraint(equalTo: JuicoyAvatarOrb.centerYAnchor),

            JuicoyNexusTrigger.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            JuicoyNexusTrigger.centerYAnchor.constraint(equalTo: JuicoyAvatarOrb.centerYAnchor),
            JuicoyNexusTrigger.heightAnchor.constraint(equalToConstant: 32)
        ])

        JuicoyNexusTrigger.addTarget(self, action: #selector(JuicoyTriggerExecution), for: .touchUpInside)
    }

    @objc private func JuicoyTriggerExecution() {
        JuicoyActionCallback?()
    }

    func JuicoyInfuseProfile(_ JuicoyData: JuicoyStorageModel, JuicoyMode: JuicoyKineticMode) {
        JuicoyHandleLabel.text = JuicoyData.JuicoyHandle
        JuicoyAvatarOrb.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: JuicoyData.JuicoyAvatarKey)
        
        switch JuicoyMode {
        case .JuicoyFollower:
            JuicoyNexusTrigger.setTitle("Faoclaloouwbiensg".JoicoydeMercrypt(), for: .normal)
            JuicoyNexusTrigger.backgroundColor = UIColor(red: 168/255, green: 70/255, blue: 255/255, alpha: 1.0)
            JuicoyNexusTrigger.setTitleColor(.white, for: .normal)
        case .JuicoyFollowing:
            JuicoyNexusTrigger.setTitle("Uqnhfzoolklaoew".JoicoydeMercrypt(), for: .normal)
            JuicoyNexusTrigger.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
            JuicoyNexusTrigger.setTitleColor(.gray, for: .normal)
        case .JuicoyBlocked:
            JuicoyNexusTrigger.setTitle("Riefmaovvfe".JoicoydeMercrypt(), for: .normal)
            JuicoyNexusTrigger.backgroundColor = .black
            JuicoyNexusTrigger.setTitleColor(.white, for: .normal)
        }
    }
}

