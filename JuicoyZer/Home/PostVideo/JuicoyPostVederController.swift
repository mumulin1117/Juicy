
import UIKit
import PhotosUI
import AVFoundation

class JuicoyVideoPostController: JuicoySeconedYEUIController {

    private let JuicoyVibrantScrollBase: UIScrollView = {
        let JuicoyScroll = UIScrollView()
        JuicoyScroll.backgroundColor = .clear
        JuicoyScroll.showsVerticalScrollIndicator = false
        JuicoyScroll.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyScroll
    }()

    private let JuicoyStageContainer: UIView = {
        let JuicoyView = UIView()
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()
   
    private let JuicoyLegalAuraLabel: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.text = "Pqlmeyaisvek sexnfskuhrwex iyjonuyrb mvwikdreeossk malrkez zlvejgtazlr.i hDmop unyoytp jsxhuairted rcvoepnyrrlihgmhitjetdb lczoenjtgemnpts dwziatlhnoeuntm kpteyrempiusnsiigovni.d bTzhqen gptluaftofuoyrfmc yinsc snboftv almioazbgltez.".JoicoydeMercrypt()
        JuicoyLab.textColor = .lightGray
        JuicoyLab.font = UIFont.systemFont(ofSize: 14)
        JuicoyLab.numberOfLines = 0
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()

    private let JuicoyStageUploadHeader: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.text = "Uupelaomaldu yVdimdsexo".JoicoydeMercrypt()
        JuicoyLab.textColor = .black
        JuicoyLab.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()
    
    private let JuicoyRhythmTitleHeader: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.text = "Vriidberop pTnidtllhe".JoicoydeMercrypt()
        JuicoyLab.textColor = .black
        JuicoyLab.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
        
    }()
    private let JuicoyVisualPortal: UIView = {
        let JuicoyView = UIView()
        JuicoyView.backgroundColor = UIColor(white: 0.97, alpha: 1.0)
        JuicoyView.layer.cornerRadius = 12
        JuicoyView.clipsToBounds = true
        JuicoyView.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyView
    }()

    private let JuicoyCineIcon: UIImageView = {
        let JuicoyImg = UIImageView()
        JuicoyImg.image = UIImage(systemName: "video.badge.plus")
        JuicoyImg.tintColor = .lightGray
        JuicoyImg.contentMode = .scaleAspectFit
        JuicoyImg.layer.cornerRadius  = 20
        JuicoyImg.layer.masksToBounds = true
        
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyImg
    }()

    private let JuicoyThumbnailEcho: UIImageView = {
        let JuicoyImg = UIImageView()
        JuicoyImg.contentMode = .scaleAspectFill
        JuicoyImg.isHidden = true
        JuicoyImg.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyImg
    }()


    private let JuicoyRhythmInputField: UITextField = {
        let JuicoyField = UITextField()
        JuicoyField.placeholder = "Pelvejafsrep jeunbteevrz rad avqihdcejob ftmiittlne".JoicoydeMercrypt()
        JuicoyField.backgroundColor = UIColor(white: 0.97, alpha: 1.0)
        JuicoyField.layer.cornerRadius = 8
        let JuicoyPad = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 1))
        JuicoyField.leftView = JuicoyPad
        JuicoyField.leftViewMode = .always
        JuicoyField.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyField
    }()

    private let JuicoyEchoDescHeader: UILabel = {
        let JuicoyLab = UILabel()
        JuicoyLab.text = "Vwiqdneson uDqeisxcprriipntgikobn".JoicoydeMercrypt()
        JuicoyLab.textColor = .black
        JuicoyLab.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        JuicoyLab.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyLab
    }()

    private let JuicoyEchoInputField: UITextView = {
        let JuicoyTv = UITextView()
        JuicoyTv.text = "Pulueeaesheb weundtyeiro dab hvliedaemov qdeewslcbroispltuiuogn".JoicoydeMercrypt()
        JuicoyTv.backgroundColor = UIColor(white: 0.97, alpha: 1.0)
        JuicoyTv.layer.cornerRadius = 8
        JuicoyTv.font = UIFont.systemFont(ofSize: 15)
        JuicoyTv.textContainerInset = UIEdgeInsets(top: 12, left: 8, bottom: 12, right: 8)
        JuicoyTv.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyTv
    }()

    private let JuicoyFinalizePulseTrigger: UIButton = {
        
        let JuicoyBtn = UIButton(type: .system)
        JuicoyBtn.setTitle("Ckojnufniwrzm".JoicoydeMercrypt(), for: .normal)
        JuicoyBtn.setTitleColor(.white, for: .normal)
        JuicoyBtn.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        JuicoyBtn.layer.cornerRadius = 25
        JuicoyBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        JuicoyBtn.isEnabled = false
        JuicoyBtn.translatesAutoresizingMaskIntoConstraints = false
        return JuicoyBtn
    }()

    private var JuicoySelectedCineURL: URL?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pcopsdth bvdiedjejo".JoicoydeMercrypt()
        JuicoyFabricateUI()
        JuicoyBindInteractions()
    }

    private func JuicoyFabricateUI() {
        view.backgroundColor = .white
        view.addSubview(JuicoyVibrantScrollBase)
        JuicoyVibrantScrollBase.addSubview(JuicoyStageContainer)

        [ JuicoyLegalAuraLabel,
         JuicoyStageUploadHeader, JuicoyVisualPortal,JuicoyRhythmTitleHeader,
         JuicoyRhythmInputField, JuicoyEchoDescHeader, JuicoyEchoInputField,
         JuicoyFinalizePulseTrigger].forEach { JuicoyStageContainer.addSubview($0) }

        JuicoyVisualPortal.addSubview(JuicoyCineIcon)
        JuicoyVisualPortal.addSubview(JuicoyThumbnailEcho)

        NSLayoutConstraint.activate([
            JuicoyVibrantScrollBase.topAnchor.constraint(equalTo: view.topAnchor),
            JuicoyVibrantScrollBase.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            JuicoyVibrantScrollBase.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            JuicoyVibrantScrollBase.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            JuicoyStageContainer.topAnchor.constraint(equalTo: JuicoyVibrantScrollBase.topAnchor),
            JuicoyStageContainer.leadingAnchor.constraint(equalTo: JuicoyVibrantScrollBase.leadingAnchor),
            JuicoyStageContainer.trailingAnchor.constraint(equalTo: JuicoyVibrantScrollBase.trailingAnchor),
            JuicoyStageContainer.bottomAnchor.constraint(equalTo: JuicoyVibrantScrollBase.bottomAnchor),
            JuicoyStageContainer.widthAnchor.constraint(equalTo: JuicoyVibrantScrollBase.widthAnchor),

            JuicoyLegalAuraLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: JUICOYalltotalTop + 20),
            JuicoyLegalAuraLabel.leadingAnchor.constraint(equalTo: JuicoyStageContainer.leadingAnchor, constant: 20),
            JuicoyLegalAuraLabel.trailingAnchor.constraint(equalTo: JuicoyStageContainer.trailingAnchor, constant: -20),

            JuicoyStageUploadHeader.topAnchor.constraint(equalTo: JuicoyLegalAuraLabel.bottomAnchor, constant: 25),
            JuicoyStageUploadHeader.leadingAnchor.constraint(equalTo: JuicoyLegalAuraLabel.leadingAnchor),

            JuicoyVisualPortal.topAnchor.constraint(equalTo: JuicoyStageUploadHeader.bottomAnchor, constant: 15),
            JuicoyVisualPortal.leadingAnchor.constraint(equalTo: JuicoyLegalAuraLabel.leadingAnchor),
            JuicoyVisualPortal.widthAnchor.constraint(equalToConstant: 120),
            JuicoyVisualPortal.heightAnchor.constraint(equalToConstant: 140),

            JuicoyCineIcon.centerXAnchor.constraint(equalTo: JuicoyVisualPortal.centerXAnchor),
            JuicoyCineIcon.centerYAnchor.constraint(equalTo: JuicoyVisualPortal.centerYAnchor),
            JuicoyCineIcon.widthAnchor.constraint(equalToConstant: 40),
            JuicoyCineIcon.heightAnchor.constraint(equalToConstant: 40),

            JuicoyThumbnailEcho.topAnchor.constraint(equalTo: JuicoyVisualPortal.topAnchor),
            JuicoyThumbnailEcho.leadingAnchor.constraint(equalTo: JuicoyVisualPortal.leadingAnchor),
            JuicoyThumbnailEcho.trailingAnchor.constraint(equalTo: JuicoyVisualPortal.trailingAnchor),
            JuicoyThumbnailEcho.bottomAnchor.constraint(equalTo: JuicoyVisualPortal.bottomAnchor),

            JuicoyRhythmTitleHeader.topAnchor.constraint(equalTo: JuicoyVisualPortal.bottomAnchor, constant: 25),
            JuicoyRhythmTitleHeader.leadingAnchor.constraint(equalTo: JuicoyLegalAuraLabel.leadingAnchor),
            
            JuicoyRhythmInputField.topAnchor.constraint(equalTo: JuicoyRhythmTitleHeader.bottomAnchor, constant: 12),
            JuicoyRhythmInputField.leadingAnchor.constraint(equalTo: JuicoyLegalAuraLabel.leadingAnchor),
            JuicoyRhythmInputField.trailingAnchor.constraint(equalTo: JuicoyLegalAuraLabel.trailingAnchor),
            JuicoyRhythmInputField.heightAnchor.constraint(equalToConstant: 50),

            JuicoyEchoDescHeader.topAnchor.constraint(equalTo: JuicoyRhythmInputField.bottomAnchor, constant: 25),
            JuicoyEchoDescHeader.leadingAnchor.constraint(equalTo: JuicoyLegalAuraLabel.leadingAnchor),

            JuicoyEchoInputField.topAnchor.constraint(equalTo: JuicoyEchoDescHeader.bottomAnchor, constant: 12),
            JuicoyEchoInputField.leadingAnchor.constraint(equalTo: JuicoyLegalAuraLabel.leadingAnchor),
            JuicoyEchoInputField.trailingAnchor.constraint(equalTo: JuicoyLegalAuraLabel.trailingAnchor),
            JuicoyEchoInputField.heightAnchor.constraint(equalToConstant: 120),

            JuicoyFinalizePulseTrigger.topAnchor.constraint(equalTo: JuicoyEchoInputField.bottomAnchor, constant: 80),
            JuicoyFinalizePulseTrigger.leadingAnchor.constraint(equalTo: JuicoyLegalAuraLabel.leadingAnchor),
            JuicoyFinalizePulseTrigger.trailingAnchor.constraint(equalTo: JuicoyLegalAuraLabel.trailingAnchor),
            JuicoyFinalizePulseTrigger.heightAnchor.constraint(equalToConstant: 55),
            JuicoyFinalizePulseTrigger.bottomAnchor.constraint(equalTo: JuicoyStageContainer.bottomAnchor, constant: -40)
        ])
    }

    private func JuicoyBindInteractions() {
        
        let JuicoyTap = UITapGestureRecognizer(target: self, action: #selector(JuicoyInvokeCinePicker))
        JuicoyVisualPortal.addGestureRecognizer(JuicoyTap)
        JuicoyFinalizePulseTrigger.addTarget(self, action: #selector(JuicoyExecutePublication), for: .touchUpInside)
        JuicoyRhythmInputField.addTarget(self, action: #selector(JuicoyValidateManifest), for: .editingChanged)
    }

    @objc private func JuicoyRevertTransition() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func JuicoyInvokeCinePicker() {
        var JuicoyConfig = PHPickerConfiguration()
        JuicoyConfig.filter = .videos
        JuicoyConfig.selectionLimit = 1
        let JuicoyPicker = PHPickerViewController(configuration: JuicoyConfig)
        JuicoyPicker.delegate = self
        present(JuicoyPicker, animated: true)
    }

    @objc private func JuicoyValidateManifest() {
        let JuicoyReady = !(JuicoyRhythmInputField.text?.isEmpty ?? true) && JuicoySelectedCineURL != nil
        JuicoyFinalizePulseTrigger.isEnabled = JuicoyReady
        JuicoyFinalizePulseTrigger.backgroundColor = JuicoyReady ? .systemPink : UIColor(white: 0.9, alpha: 1.0)
    }

    @objc private func JuicoyExecutePublication() {
        let JuicoyIndicator = UIActivityIndicatorView(style: .medium)
        JuicoyIndicator.center = JuicoyFinalizePulseTrigger.center
        view.addSubview(JuicoyIndicator)
        JuicoyIndicator.startAnimating()
        JuicoyFinalizePulseTrigger.isHidden = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            JuicoyIndicator.stopAnimating()
            self.navigationController?.popViewController(animated: true)
        }
    }

    private func JuicoyExtractFrame(from JuicoyURL: URL) {
        let JuicoyAsset = AVAsset(url: JuicoyURL)
        let JuicoyGenerator = AVAssetImageGenerator(asset: JuicoyAsset)
        JuicoyGenerator.appliesPreferredTrackTransform = true
        let JuicoyTime = CMTime(seconds: 1, preferredTimescale: 60)
        
        do {
            let JuicoyRef = try JuicoyGenerator.copyCGImage(at: JuicoyTime, actualTime: nil)
            let JuicoyImage = UIImage(cgImage: JuicoyRef)
            DispatchQueue.main.async {
                self.JuicoyThumbnailEcho.image = JuicoyImage
                self.JuicoyThumbnailEcho.isHidden = false
                self.JuicoyCineIcon.isHidden = true
                self.JuicoyValidateManifest()
            }
        } catch {
            print("Juicoy frame error")
        }
    }
}

extension JuicoyVideoPostController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        guard let JuicoyResult = results.first else { return }
        
        JuicoyResult.itemProvider.loadFileRepresentation(forTypeIdentifier: UTType.movie.identifier) { [weak self] JuicoyURL, JuicoyErr in
            guard let JuicoyPath = JuicoyURL else { return }
            let JuicoyLocalBase = FileManager.default.temporaryDirectory.appendingPathComponent(JuicoyPath.lastPathComponent)
            try? FileManager.default.removeItem(at: JuicoyLocalBase)
            try? FileManager.default.copyItem(at: JuicoyPath, to: JuicoyLocalBase)
            
            DispatchQueue.main.async {
                self?.JuicoySelectedCineURL = JuicoyLocalBase
                self?.JuicoyExtractFrame(from: JuicoyLocalBase)
            }
        }
    }
}

