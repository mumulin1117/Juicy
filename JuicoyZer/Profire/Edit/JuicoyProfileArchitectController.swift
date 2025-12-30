//
//  JuicoyProfileArchitectController.swift
//  JuicoyZer
//
//  Created by Juicoy on 2025/12/26.
//

import UIKit

import UIKit

class JuicoyProfileArchitectController: JuicoySeconedYEUIController {
    private var JuicoyCurrentPickerTarget: Int = 0 // 0: Avatar, 1: Background
    private let JuicoyCosmicCanvas: UIScrollView = {
        let JuicoyScroll = UIScrollView()
        JuicoyScroll.backgroundColor = .clear
        JuicoyScroll.showsVerticalScrollIndicator = false
        JuicoyScroll.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyScroll
    }()

    private let JuicoyContentManifest = UIView()
    
    private let JuicoyAvatarHalo: UIImageView = {
        let JuicoyImg = UIImageView(image: UIImage(named: "juicoyDynamicLog"))
        JuicoyImg.contentMode = .scaleAspectFill
        JuicoyImg.layer.cornerRadius = 50
        JuicoyImg.clipsToBounds = true
        JuicoyImg.isUserInteractionEnabled = true
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyImg
    }()
    
    private let JuicoyAvatarPencil: UIButton = {
        let JuicoyImg = UIButton.init()
        JuicoyImg.setImage(UIImage.init(named: "joicoyavatoercha"), for: .normal)
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        JuicoyImg.addTarget(self, action: #selector(JuicoyInvokeAvatarPicker), for: .touchUpInside)
        return JuicoyImg
    }()

    private let JuicoyBackgroundTitle: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.text = "Profile Background"
        JuicoyLab.font = .systemFont(ofSize: 14, weight: .medium)
        JuicoyLab.textColor = .darkGray
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()

    private lazy var JuicoyGalleryOrbit: UIStackView = {
        let JuicoyStack = UIStackView()
        JuicoyStack.axis = .horizontal
        JuicoyStack.spacing = 10
        JuicoyStack.distribution = .fillEqually
        JuicoyStack.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyStack
    }()

    private let JuicoyIdentityStack: UIStackView = {
        let JuicoyStack = UIStackView()
        JuicoyStack.axis = .vertical
        JuicoyStack.spacing = 15
        JuicoyStack.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyStack
    }()

    private let JuicoyHobbyCloudTitle: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.text = "Interesting"
        JuicoyLab.font = .systemFont(ofSize: 14, weight: .medium)
        JuicoyLab.textColor = .darkGray
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()

    private let JuicoyHobbyFlowContainer: UIView = {
        let JuicoyView = UIView()
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()

    private let JuicoyCommitTrigger: UIButton = {
        let JuicoyBtn = UIButton()
        JuicoyBtn.setBackgroundImage(UIImage.init(named: "joicoyDave"), for: .normal)
        JuicoyBtn.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyBtn
    }()

    private var JuicoyVibeTags = ["Guitar", "Piano", "Dance", "Contemporary", "Drawing", "Traveling", "Singing", "drumming", "Yoga"]
    private var JuicoySelectedVibes: Set<String> = ["Guitar", "Dance", "Yoga"]

    override func viewDidLoad() {
        super.viewDidLoad()
        JuicoyInitializeStage()
        JuicoySyncLocalData()
    }
    private func JuicoySyncLocalData() {
        // Mocking local fetch logic
        
    }
    private func JuicoyInitializeStage() {
        title = "Edit Profile"
       
        
        view.addSubview(JuicoyCosmicCanvas)
        JuicoyCosmicCanvas.addSubview(JuicoyContentManifest)
       
        
        JuicoyContentManifest.addSubview(JuicoyAvatarHalo)
        JuicoyCosmicCanvas.addSubview(JuicoyAvatarPencil)
        JuicoyContentManifest.addSubview(JuicoyBackgroundTitle)
        JuicoyContentManifest.addSubview(JuicoyGalleryOrbit)
        JuicoyContentManifest.addSubview(JuicoyIdentityStack)
        JuicoyContentManifest.addSubview(JuicoyHobbyCloudTitle)
        JuicoyContentManifest.addSubview(JuicoyHobbyFlowContainer)
        view.addSubview(JuicoyCommitTrigger)

        JuicoyContentManifest.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            JuicoyCosmicCanvas.topAnchor.constraint(equalTo: view.topAnchor),
            JuicoyCosmicCanvas.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JuicoyCosmicCanvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JuicoyCosmicCanvas.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            JuicoyContentManifest.topAnchor.constraint(equalTo: JuicoyCosmicCanvas.topAnchor),
            JuicoyContentManifest.leadingAnchor.constraint(equalTo: JuicoyCosmicCanvas.leadingAnchor),
            JuicoyContentManifest.trailingAnchor.constraint(equalTo: JuicoyCosmicCanvas.trailingAnchor),
            JuicoyContentManifest.bottomAnchor.constraint(equalTo: JuicoyCosmicCanvas.bottomAnchor),
            JuicoyContentManifest.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            JuicoyContentManifest.heightAnchor.constraint(equalToConstant: 900),
            
            JuicoyAvatarHalo.topAnchor.constraint(equalTo: JuicoyContentManifest.topAnchor, constant: 20),
            JuicoyAvatarHalo.centerXAnchor.constraint(equalTo: JuicoyContentManifest.centerXAnchor),
            JuicoyAvatarHalo.widthAnchor.constraint(equalToConstant: 100),
            JuicoyAvatarHalo.heightAnchor.constraint(equalToConstant: 100),

            JuicoyAvatarPencil.trailingAnchor.constraint(equalTo: JuicoyAvatarHalo.trailingAnchor),
            JuicoyAvatarPencil.bottomAnchor.constraint(equalTo: JuicoyAvatarHalo.bottomAnchor),
            JuicoyAvatarPencil.widthAnchor.constraint(equalToConstant: 24),
            JuicoyAvatarPencil.heightAnchor.constraint(equalToConstant: 24),

            JuicoyBackgroundTitle.topAnchor.constraint(equalTo: JuicoyAvatarHalo.bottomAnchor, constant: 30),
            JuicoyBackgroundTitle.leadingAnchor.constraint(equalTo: JuicoyContentManifest.leadingAnchor, constant: 20),

            JuicoyGalleryOrbit.topAnchor.constraint(equalTo: JuicoyBackgroundTitle.bottomAnchor, constant: 12),
            JuicoyGalleryOrbit.leadingAnchor.constraint(equalTo: JuicoyContentManifest.leadingAnchor, constant: 20),
            JuicoyGalleryOrbit.trailingAnchor.constraint(equalTo: JuicoyContentManifest.trailingAnchor, constant: -20),
            JuicoyGalleryOrbit.heightAnchor.constraint(equalToConstant: 100),

            JuicoyIdentityStack.topAnchor.constraint(equalTo: JuicoyGalleryOrbit.bottomAnchor, constant: 30),
            JuicoyIdentityStack.leadingAnchor.constraint(equalTo: JuicoyContentManifest.leadingAnchor, constant: 20),
            JuicoyIdentityStack.trailingAnchor.constraint(equalTo: JuicoyContentManifest.trailingAnchor, constant: -20),

            JuicoyHobbyCloudTitle.topAnchor.constraint(equalTo: JuicoyIdentityStack.bottomAnchor, constant: 30),
            JuicoyHobbyCloudTitle.leadingAnchor.constraint(equalTo: JuicoyBackgroundTitle.leadingAnchor),

            JuicoyHobbyFlowContainer.topAnchor.constraint(equalTo: JuicoyHobbyCloudTitle.bottomAnchor, constant: 12),
            JuicoyHobbyFlowContainer.leadingAnchor.constraint(equalTo: JuicoyContentManifest.leadingAnchor, constant: 15),
            JuicoyHobbyFlowContainer.trailingAnchor.constraint(equalTo: JuicoyContentManifest.trailingAnchor, constant: -15),
            JuicoyHobbyFlowContainer.bottomAnchor.constraint(equalTo: JuicoyContentManifest.bottomAnchor, constant: -20),
            JuicoyHobbyFlowContainer.heightAnchor.constraint(equalToConstant: 180),

            JuicoyCommitTrigger.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            JuicoyCommitTrigger.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            JuicoyCommitTrigger.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            JuicoyCommitTrigger.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        JuicoySetupGalleryUnits()
        JuicoyGenerateIdentityFields()
        JuicoyRenderHobbyMatrix()
        
        JuicoyCommitTrigger.addTarget(self, action: #selector(JuicoyExecutePersistence), for: .touchUpInside)
    }

    private func JuicoySetupGalleryUnits() {
            for JuicoyIdx in 0..<3 {
                let JuicoyUnit = UIButton(type: .custom)
                JuicoyUnit.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
                JuicoyUnit.layer.cornerRadius = 12
                JuicoyUnit.clipsToBounds = true
                JuicoyUnit.imageView?.contentMode = .scaleAspectFill
                let JuicoyIcon = UIImage(systemName: "photo.on.rectangle")
                JuicoyUnit.setImage(JuicoyIcon, for: .normal)
                JuicoyUnit.tintColor = .lightGray
                JuicoyUnit.tag = JuicoyIdx + 100
                JuicoyUnit.addTarget(self, action: #selector(JuicoyInvokeGalleryPicker(_:)), for: .touchUpInside)
                JuicoyGalleryOrbit.addArrangedSubview(JuicoyUnit)
            }
        }

    private func JuicoyGenerateIdentityFields() {
            let JuicoyBlueprints = [("Nickname", "Nathan Neal"), ("Birthday", "2001-07-19"), ("Weight", "66kg"), ("Height", "160 cm")]
            for JuicoyData in JuicoyBlueprints {
                let JuicoyField = JuicoyInputCell()
                JuicoyField.JuicoySetData(JuicoyTitle: JuicoyData.0, JuicoyValue: JuicoyData.1)
                JuicoyIdentityStack.addArrangedSubview(JuicoyField)
            }
        }

        private func JuicoyRenderHobbyMatrix() {
            JuicoyHobbyFlowContainer.subviews.forEach { $0.removeFromSuperview() }
            var JuicoyOffsetPoint = CGPoint(x: 5, y: 5)
            let JuicoyMaxLimit = UIScreen.main.bounds.width - 40
            
            for JuicoyVibe in JuicoyVibeTags {
                let JuicoyPill = UIButton()
                JuicoyPill.setTitle(JuicoyVibe, for: .normal)
                JuicoyPill.titleLabel?.font = .systemFont(ofSize: 14)
                JuicoyPill.contentEdgeInsets = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15)
                JuicoyPill.layer.cornerRadius = 18
                JuicoyPill.layer.borderWidth = 1
                
                let JuicoyIsActive = JuicoySelectedVibes.contains(JuicoyVibe)
                JuicoyPill.layer.borderColor = JuicoyIsActive ? UIColor.systemPurple.cgColor : UIColor.lightGray.withAlphaComponent(0.3).cgColor
                JuicoyPill.setTitleColor(JuicoyIsActive ? .systemPurple : .black, for: .normal)
                JuicoyPill.backgroundColor = JuicoyIsActive ? UIColor.systemPurple.withAlphaComponent(0.05) : .clear
                
                JuicoyPill.addTarget(self, action: #selector(JuicoyToggleVibe(_:)), for: .touchUpInside)
                
                let JuicoySize = JuicoyPill.intrinsicContentSize
                if JuicoyOffsetPoint.x + JuicoySize.width > JuicoyMaxLimit {
                    JuicoyOffsetPoint.x = 5
                    JuicoyOffsetPoint.y += 45
                }
                JuicoyPill.frame = CGRect(origin: JuicoyOffsetPoint, size: JuicoySize)
                JuicoyHobbyFlowContainer.addSubview(JuicoyPill)
                JuicoyOffsetPoint.x += JuicoySize.width + 10
            }
        }

        @objc private func JuicoyToggleVibe(_ JuicoySender: UIButton) {
            guard let JuicoyVibe = JuicoySender.title(for: .normal) else { return }
            if JuicoySelectedVibes.contains(JuicoyVibe) {
                JuicoySelectedVibes.remove(JuicoyVibe)
            } else {
                JuicoySelectedVibes.insert(JuicoyVibe)
            }
            JuicoyRenderHobbyMatrix()
        }

        @objc private func JuicoyInvokeAvatarPicker() {
            JuicoyCurrentPickerTarget = 0
            JuicoyLaunchSystemCamera()
        }

        @objc private func JuicoyInvokeGalleryPicker(_ JuicoySender: UIButton) {
            JuicoyCurrentPickerTarget = JuicoySender.tag
            JuicoyLaunchSystemCamera()
        }

        private func JuicoyLaunchSystemCamera() {
            let JuicoyPicker = UIImagePickerController()
            JuicoyPicker.delegate = self
            JuicoyPicker.sourceType = .photoLibrary
            self.present(JuicoyPicker, animated: true)
        }

        @objc private func JuicoyExecutePersistence() {
            let JuicoyIndicator = UIActivityIndicatorView(style: .medium)
            JuicoyIndicator.center = view.center
            view.addSubview(JuicoyIndicator)
            JuicoyIndicator.startAnimating()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                JuicoyIndicator.stopAnimating()
                self.navigationController?.popViewController(animated: true)
            }
        }
    }

    
extension JuicoyProfileArchitectController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let JuicoySelectedImg = info[.originalImage] as? UIImage {
            if JuicoyCurrentPickerTarget == 0 {
                JuicoyAvatarHalo.image = JuicoySelectedImg
            } else {
                if let JuicoyTargetBtn = JuicoyGalleryOrbit.viewWithTag(JuicoyCurrentPickerTarget) as? UIButton {
                    JuicoyTargetBtn.setImage(JuicoySelectedImg.withRenderingMode(.alwaysOriginal), for: .normal)
                }
            }
        }
        picker.dismiss(animated: true)
    }
}

class JuicoyInputCell: UIView {
    private let JuicoyHeader: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.font = .systemFont(ofSize: 14)
        JuicoyLab.textColor = .darkGray
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()
    
    private let JuicoyValueSlot: UITextField = {
        let JuicoyField = UITextField()
        JuicoyField.font = .systemFont(ofSize: 16, weight: .semibold)
        JuicoyField.textColor = .black
        JuicoyField.textAlignment = .left
        JuicoyField.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 12
        
        addSubview(JuicoyHeader)
        addSubview(JuicoyValueSlot)
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 55),
            JuicoyHeader.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            JuicoyHeader.centerYAnchor.constraint(equalTo: centerYAnchor),
            JuicoyHeader.widthAnchor.constraint(equalToConstant: 80),
            
            JuicoyValueSlot.leadingAnchor.constraint(equalTo: JuicoyHeader.trailingAnchor, constant: 10),
            JuicoyValueSlot.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            JuicoyValueSlot.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    func JuicoySetData(JuicoyTitle: String, JuicoyValue: String) {
        JuicoyHeader.text = JuicoyTitle
        JuicoyValueSlot.text = JuicoyValue
    }
}
