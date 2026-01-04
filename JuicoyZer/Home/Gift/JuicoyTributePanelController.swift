import UIKit
protocol JuicoyLegacyTributeDelegate: AnyObject {
    func JuicoyDidTriggerTribute(JuicoyAmount: Int, JuicoyAsset: String)
}
class JuicoyTributePanelController: UIViewController {
    
    weak var JuicoyDelegate: JuicoyLegacyTributeDelegate?
    
    private var JuicoySelectedIdx: Int? = 0
    private var JuicoyQuantityOrbit: Int = 1
    private let JuicoyVaultBalance: Int = 34452
    
    private let JuicoyGiftRegistry: [[String: Any]] = [
        ["JuicoyName": "Gift box", "JuicoyCost": 20, "JuicoyIcon": "JOICOYbox"],
        ["JuicoyName": "Crystal Bear", "JuicoyCost": 30, "JuicoyIcon": "JOICOYCrystal Bear"],
        ["JuicoyName": "Magic Gift", "JuicoyCost": 50, "JuicoyIcon": "Magicsugar"],
        ["JuicoyName": "Sweet Girl", "JuicoyCost": 70, "JuicoyIcon": "Sweet Girl"],
        ["JuicoyName": "Little star", "JuicoyCost": 88, "JuicoyIcon": "Little star"],
        ["JuicoyName": "Airplane", "JuicoyCost": 120, "JuicoyIcon": "Airplane"],
        ["JuicoyName": "Pearl", "JuicoyCost": 1314, "JuicoyIcon": "Pearl"],
        ["JuicoyName": "Sunflower", "JuicoyCost": 200, "JuicoyIcon": "Sunflower"]
    ]

    private let JuicoyBaseAnchor: UIView = {
        let JuicoyView = UIView()
        JuicoyView.backgroundColor = UIColor(red: 0.05, green: 0.05, blue: 0.05, alpha: 1.0)
        JuicoyView.layer.cornerRadius = 20
        JuicoyView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()

    private let JuicoyGridFlow: UICollectionView = {
        let JuicoyLayout = UICollectionViewFlowLayout()
        JuicoyLayout.scrollDirection = .vertical
        JuicoyLayout.minimumLineSpacing = 7
        JuicoyLayout.minimumInteritemSpacing = 7
        JuicoyLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 21 - 20)/4, height: 110)
        let JuicoyColl = UICollectionView(frame: .zero, collectionViewLayout: JuicoyLayout)
        JuicoyColl.backgroundColor = .clear
        JuicoyColl.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyColl
    }()

    private let JuicoyFooterPanel: UIView = {
        let JuicoyView = UIView()
        JuicoyView.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()

    private let JuicoyTotalCostMarker: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.textColor = .white
        JuicoyLab.font = .systemFont(ofSize: 18, weight: .bold)
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()

    private let JuicoyStepperBase: UIStackView = {
        let JuicoyStack = UIStackView()
        JuicoyStack.axis = .horizontal
        JuicoyStack.spacing = 10
        JuicoyStack.alignment = .center
        JuicoyStack.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyStack
    }()
    
    private let JuicoyQuantityLabel: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.text = "1"
        JuicoyLab.textColor = .white
        JuicoyLab.font = .systemFont(ofSize: 16, weight: .medium)
        return JuicoyLab
    }()

    private let JuicoyDispatchTrigger: UIButton = {
        let JuicoyBtn = UIButton()
        JuicoyBtn.setTitle("Send", for: .normal)
        JuicoyBtn.setTitleColor(.white, for: .normal)
        JuicoyBtn.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        JuicoyBtn.setBackgroundImage(JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "levelSendJOICOY"), for: .normal)
        JuicoyBtn.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyBtn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        let JuicoyDimmer = UITapGestureRecognizer(target: self, action: #selector(JuicoyDismissPanel))
        let JuicoyBg = UIView(frame: view.bounds)
        JuicoyBg.addGestureRecognizer(JuicoyDimmer)
        view.addSubview(JuicoyBg)
        JuicoySetupCanvas()
        JuicoySyncFinancials()
    }
    @objc private func JuicoyDismissPanel() {
        self.dismiss(animated: true)
    }
    private func JuicoySetupCanvas() {
        view.backgroundColor = .clear
        view.addSubview(JuicoyBaseAnchor)
        JuicoyBaseAnchor.addSubview(JuicoyGridFlow)
        JuicoyBaseAnchor.addSubview(JuicoyFooterPanel)
        
       
        
        JuicoyFooterPanel.addSubview(JuicoyTotalCostMarker)
        JuicoyFooterPanel.addSubview(JuicoyStepperBase)
        JuicoyFooterPanel.addSubview(JuicoyDispatchTrigger)
        let dimaoneinmg = UIImageView(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "dimaoOKAneinmg"))
        dimaoneinmg.translatesAutoresizingMaskIntoConstraints = false
        JuicoyFooterPanel.addSubview(dimaoneinmg)
        let JuicoySub = JuicoyBuildStepBtn(JuicoySym: "minus.circle")
        let JuicoyAdd = JuicoyBuildStepBtn(JuicoySym: "plus.circle")
        JuicoySub.addTarget(self, action: #selector(JuicoyDecrement), for: .touchUpInside)
        JuicoyAdd.addTarget(self, action: #selector(JuicoyIncrement), for: .touchUpInside)
        
        JuicoyStepperBase.addArrangedSubview(JuicoySub)
        JuicoyStepperBase.addArrangedSubview(JuicoyQuantityLabel)
        JuicoyStepperBase.addArrangedSubview(JuicoyAdd)

        JuicoyGridFlow.delegate = self
        JuicoyGridFlow.dataSource = self
        JuicoyGridFlow.register(JuicoyTributeCell.self, forCellWithReuseIdentifier: "JuicoyTrib")

        NSLayoutConstraint.activate([
            JuicoyBaseAnchor.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JuicoyBaseAnchor.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JuicoyBaseAnchor.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            JuicoyBaseAnchor.heightAnchor.constraint(equalToConstant: 450),
 
            JuicoyGridFlow.topAnchor.constraint(equalTo: JuicoyBaseAnchor.topAnchor, constant: 20),
            JuicoyGridFlow.leadingAnchor.constraint(equalTo: JuicoyBaseAnchor.leadingAnchor, constant: 10),
            JuicoyGridFlow.trailingAnchor.constraint(equalTo: JuicoyBaseAnchor.trailingAnchor, constant: -10),
            JuicoyGridFlow.bottomAnchor.constraint(equalTo: JuicoyFooterPanel.topAnchor),

            JuicoyFooterPanel.leadingAnchor.constraint(equalTo: JuicoyBaseAnchor.leadingAnchor),
            JuicoyFooterPanel.trailingAnchor.constraint(equalTo: JuicoyBaseAnchor.trailingAnchor),
            JuicoyFooterPanel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            JuicoyFooterPanel.heightAnchor.constraint(equalToConstant: 100),

            
          
            
            JuicoyTotalCostMarker.leadingAnchor.constraint(equalTo: JuicoyFooterPanel.leadingAnchor, constant:12 + 20 + 12),
            JuicoyTotalCostMarker.centerYAnchor.constraint(equalTo: JuicoyFooterPanel.centerYAnchor, constant: -10),

            
            dimaoneinmg.widthAnchor.constraint(equalToConstant: 20),
            dimaoneinmg.heightAnchor.constraint(equalToConstant: 20),
            dimaoneinmg.leadingAnchor.constraint(equalTo: self.JuicoyFooterPanel.leadingAnchor, constant: 12),
            dimaoneinmg.centerYAnchor.constraint(equalTo: JuicoyFooterPanel.centerYAnchor, constant: -10),
          
            JuicoyDispatchTrigger.trailingAnchor.constraint(equalTo: JuicoyFooterPanel.trailingAnchor, constant: -20),
            JuicoyDispatchTrigger.centerYAnchor.constraint(equalTo: JuicoyTotalCostMarker.centerYAnchor),
            JuicoyDispatchTrigger.widthAnchor.constraint(equalToConstant: 80),
            JuicoyDispatchTrigger.heightAnchor.constraint(equalToConstant: 36),
            
            JuicoyStepperBase.trailingAnchor.constraint(equalTo: JuicoyDispatchTrigger.leadingAnchor, constant: -15),
            JuicoyStepperBase.centerYAnchor.constraint(equalTo: JuicoyDispatchTrigger.centerYAnchor)
        ])
        
        JuicoyDispatchTrigger.addTarget(self, action: #selector(JuicoyCommitTribute), for: .touchUpInside)
    }

    private func JuicoyBuildStepBtn(JuicoySym: String) -> UIButton {
        let JuicoyBtn = UIButton()
        JuicoyBtn.setImage(UIImage(systemName: JuicoySym), for: .normal)
        JuicoyBtn.tintColor = .white
        return JuicoyBtn
    }

    private func JuicoySyncFinancials() {
        guard let JuicoyIdx = JuicoySelectedIdx else { return }
        let JuicoyPrice = JuicoyGiftRegistry[JuicoyIdx]["JuicoyCost"] as? Int ?? 0
        JuicoyTotalCostMarker.text = "\(JuicoyPrice * JuicoyQuantityOrbit)"
        JuicoyQuantityLabel.text = "\(JuicoyQuantityOrbit)"
    }

    @objc private func JuicoyIncrement() {
        JuicoyQuantityOrbit += 1
        JuicoySyncFinancials()
    }

    @objc private func JuicoyDecrement() {
        if JuicoyQuantityOrbit > 1 {
            JuicoyQuantityOrbit -= 1
            JuicoySyncFinancials()
        }
    }

    @objc private func JuicoyCommitTribute() {
        guard let JuicoyIdx = JuicoySelectedIdx else { return }
        let JuicoyEmoji = JuicoyGiftRegistry[JuicoyIdx]["JuicoyIcon"] as? String ?? "🚀"
        self.dismiss(animated: true) { [weak self] in
            guard let JuicoySelf = self else { return }
            JuicoySelf.JuicoyDelegate?.JuicoyDidTriggerTribute(JuicoyAmount: JuicoySelf.JuicoyQuantityOrbit, JuicoyAsset: JuicoyEmoji)
        }
    }
}

extension JuicoyTributePanelController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return JuicoyGiftRegistry.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let JuicoyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "JuicoyTrib", for: indexPath) as! JuicoyTributeCell
        JuicoyCell.JuicoyRender(JuicoyGiftRegistry[indexPath.row], JuicoyIsActive: JuicoySelectedIdx == indexPath.row)
        return JuicoyCell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        JuicoySelectedIdx = indexPath.row
        JuicoySyncFinancials()
        collectionView.reloadData()
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: (view.frame.width - 7*3 - 20) / 4, height: 110)
//    }
}

class JuicoyTributeCell: UICollectionViewCell {
    private let JuicoyCoreContainer: UIView = {
        let JuicoyView = UIView()
        JuicoyView.layer.cornerRadius = 12
        JuicoyView.layer.borderWidth = 2
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()
    
    private let JuicoySymbol: UIImageView = {
        let JuicoyLab = UIImageView()
        JuicoyLab.contentMode = .scaleAspectFit
      
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()
    
    
    private let JuicoyName: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.font = .systemFont(ofSize:10, weight: .semibold)
        JuicoyLab.textColor =  UIColor.white
        JuicoyLab.textAlignment = .center
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()
    
    private let JuicoyPrice: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.font = .systemFont(ofSize: 11, weight: .semibold)
        
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(JuicoyCoreContainer)
        JuicoyCoreContainer.addSubview(JuicoySymbol)
        JuicoyCoreContainer.addSubview(JuicoyName)
        
        JuicoyCoreContainer.addSubview(JuicoyPrice)
        let dimaoneinmg = UIImageView(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: "dimaoOKAneinmg"))
        dimaoneinmg.translatesAutoresizingMaskIntoConstraints = false
        
        JuicoyCoreContainer.addSubview(dimaoneinmg)
        NSLayoutConstraint.activate([
            JuicoyCoreContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            JuicoyCoreContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            JuicoyCoreContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            JuicoyCoreContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            
            JuicoySymbol.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 7),
            JuicoySymbol.widthAnchor.constraint(equalToConstant: 55),
            JuicoySymbol.heightAnchor.constraint(equalToConstant: 55),
            JuicoySymbol.centerXAnchor.constraint(equalTo: JuicoyCoreContainer.centerXAnchor),
            
            
            dimaoneinmg.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            dimaoneinmg.widthAnchor.constraint(equalToConstant: 13),
            dimaoneinmg.heightAnchor.constraint(equalToConstant: 13),
            dimaoneinmg.topAnchor.constraint(equalTo: JuicoySymbol.bottomAnchor, constant: 6),
            
            JuicoyName.centerYAnchor.constraint(equalTo: dimaoneinmg.centerYAnchor, constant:0),
            JuicoyName.leadingAnchor.constraint(equalTo: dimaoneinmg.trailingAnchor,constant:1),
            JuicoyName.trailingAnchor.constraint(equalTo: self.JuicoyCoreContainer.trailingAnchor, constant: -3),
            
            JuicoyPrice.topAnchor.constraint(equalTo: JuicoyName.bottomAnchor, constant:4),
            JuicoyPrice.centerXAnchor.constraint(equalTo: JuicoyCoreContainer.centerXAnchor)
        ])
    }

    required init?(coder: NSCoder) { fatalError() }

    func JuicoyRender(_ JuicoyData: [String: Any], JuicoyIsActive: Bool) {
        JuicoySymbol.image = JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: JuicoyData["JuicoyIcon"] as? String ?? "")
        JuicoyPrice.text = "\(JuicoyData["JuicoyCost"] ?? 0)"
        JuicoyName.text = JuicoyData["JuicoyName"] as? String
        if JuicoyIsActive {
            JuicoyCoreContainer.backgroundColor = UIColor.systemPink.withAlphaComponent(0.2)
            JuicoyCoreContainer.layer.borderColor = UIColor(red: 0.95, green: 0.58, blue: 1, alpha: 1).cgColor
            JuicoyPrice.textColor = UIColor(red: 0.95, green: 0.58, blue: 1, alpha: 1)
            JuicoyName.textColor = UIColor(red: 0.95, green: 0.58, blue: 1, alpha: 1)
        } else {
            JuicoyCoreContainer.backgroundColor = .clear
            JuicoyCoreContainer.layer.borderColor = UIColor.white.withAlphaComponent(0.1).cgColor
            JuicoyPrice.textColor = .white
            JuicoyName.textColor = .white
        }
    }
}


extension JuicoyMotionDeepController: JuicoyLegacyTributeDelegate {
    
    func JuicoyDidTriggerTribute(JuicoyAmount: Int, JuicoyAsset: String) {
        let JuicoyEffectNode = UIView(frame: CGRect(x: -300, y: view.frame.height * 0.6, width: 280, height: 80))
        JuicoyEffectNode.backgroundColor = .systemPurple.withAlphaComponent(0.6)
        JuicoyEffectNode.layer.cornerRadius = 40
        
        let JuicoyRocket = UIImageView.init(image: JuicoyResPulseArchitect.JuicoyExtractVisualPulse(fullIdentifier: JuicoyAsset))
        JuicoyRocket.frame = CGRect(x: 20, y: 10, width: 60, height: 60)
        JuicoyRocket.contentMode = .scaleAspectFit
        let JuicoyCounter = UILabel(frame: CGRect(x: 100, y: 10, width: 150, height: 60))
        JuicoyCounter.text = "X \(JuicoyAmount)"
        JuicoyCounter.textColor = .white
        JuicoyCounter.font = .italicSystemFont(ofSize: 40)
        
        JuicoyEffectNode.addSubview(JuicoyRocket)
        JuicoyEffectNode.addSubview(JuicoyCounter)
        view.addSubview(JuicoyEffectNode)
        
        // Haptic feedback
        let JuicoyHaptic = UIImpactFeedbackGenerator(style: .heavy)
        JuicoyHaptic.impactOccurred()
        
        // Success Fly-in Animation
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            JuicoyEffectNode.frame.origin.x = 20
        } completion: { _ in
            UIView.animate(withDuration: 0.4, delay: 1.5, options: .curveEaseIn) {
                JuicoyEffectNode.alpha = 0
                JuicoyEffectNode.frame.origin.y -= 50
            } completion: { _ in
                JuicoyEffectNode.removeFromSuperview()
            }
        }
    }
    @objc private func JuicoyRevealTributeSelector() {
        let JuicoyPanel = JuicoyTributePanelController()
        JuicoyPanel.JuicoyDelegate = self
        JuicoyPanel.modalPresentationStyle = .overFullScreen
        self.present(JuicoyPanel, animated: true)
    }
}
