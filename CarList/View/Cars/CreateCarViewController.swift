

import UIKit
import SnapKit

final class CreateCarViewController: BaseController {
    
    var presenter: CreateCarPresenter?
    
    private var yearText: String = Date.currentYear
    private var carColor: UIColor?
    private let createLableText = UILabel()
    private let saveButtonCar = UIButton()
    private let containerAddPhoto = UIView()
    private let addPhotoLableText = UILabel()
    private let photoView = UIImageView()
    private let layerContainerView = UIView()
    private let imagePicker = UIImagePickerController()
    private let modelCarLable = UILabel()
    private let modelCarTextField = UITextField()
    private let producerCarLable = UILabel()
    private let producerCarTextField = UITextField()
    private let yearCarLable = UILabel()
    private let yearDataPicker = UIDatePicker()
    private let colorCarLable = UILabel()
    private let colorPickerVC = UIColorPickerViewController()
    private let colorSetButton = UIButton()
    private let closeButton = UIButton()
    private let photoGalleryButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CreateCarViewController {
    override func embedViews() {
        super.embedViews()
        [createLableText,
         saveButtonCar,
         containerAddPhoto,
         photoView,
         modelCarLable,
         modelCarTextField,
         producerCarLable,
         producerCarTextField,
         yearCarLable,
         yearDataPicker,
         colorCarLable,
         colorSetButton,
         closeButton,
         photoGalleryButton].forEach { view in
            self.view.addView(view)
        }
        
        containerAddPhoto.addView(layerContainerView)
        containerAddPhoto.addView(addPhotoLableText)
    }
    
    override func setupLayout() {
        super.setupLayout()
        createLableText.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            make.centerX.equalTo(view.center)
        }
        
        saveButtonCar.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            make.height.equalTo(54)
            make.leading.equalTo(view.snp_leadingMargin).offset(16)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-16)
        }
        
        containerAddPhoto.snp.makeConstraints { make in
            make.height.equalTo(170)
            make.width.equalTo(170)
            make.centerX.equalTo(view.snp_centerXWithinMargins).offset(0)
            make.top.equalTo(createLableText.snp.bottom).offset(30)
        }
        
        addPhotoLableText.snp.makeConstraints { make in
            make.top.equalTo(containerAddPhoto.snp_topMargin).offset(20)
            make.centerX.equalTo(createLableText.snp_centerXWithinMargins).offset(0)
        }
        
        layerContainerView.snp.makeConstraints { make in
            make.centerX.equalTo(containerAddPhoto.snp_centerXWithinMargins)
            make.centerY.equalTo(containerAddPhoto.snp_centerYWithinMargins)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        photoView.snp.makeConstraints { make in
            make.height.equalTo(170)
            make.width.equalTo(170)
            make.centerX.equalTo(view.snp_centerXWithinMargins).offset(0)
            make.top.equalTo(createLableText.snp.bottom).offset(30)
        }
        
        photoGalleryButton.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.leading.equalTo(photoView.snp_trailingMargin).offset(20)
            make.bottom.equalTo(photoView.snp.bottom).offset(0)
        }
        
        modelCarLable.snp.makeConstraints { make in
            make.top.equalTo(containerAddPhoto.snp_bottomMargin).offset(40)
            make.leading.equalTo(view.snp_leadingMargin).offset(16)
        }
        
        modelCarTextField.snp.makeConstraints { make in
            make.top.equalTo(containerAddPhoto.snp_bottomMargin).offset(40)
            make.leading.equalTo(view.snp_leadingMargin).offset(150)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-16)
        }
        
        producerCarLable.snp.makeConstraints { make in
            make.top.equalTo(modelCarLable.snp_bottomMargin).offset(25)
            make.leading.equalTo(view.snp_leadingMargin).offset(16)
        }
        
        producerCarTextField.snp.makeConstraints { make in
            make.top.equalTo(modelCarTextField.snp_bottomMargin).offset(25)
            make.leading.equalTo(view.snp_leadingMargin).offset(150)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-16)
        }
        
        yearCarLable.snp.makeConstraints { make in
            make.top.equalTo(producerCarLable.snp_bottomMargin).offset(25)
            make.leading.equalTo(view.snp_leadingMargin).offset(16)
        }
        
        yearDataPicker.snp.makeConstraints { make in
            make.top.equalTo(producerCarTextField.snp_bottomMargin).offset(20)
            make.leading.equalTo(view.snp_leadingMargin).offset(150)
        }
        
        colorCarLable.snp.makeConstraints { make in
            make.top.equalTo(yearCarLable.snp_bottomMargin).offset(36)
            make.leading.equalTo(view.snp_leadingMargin).offset(16)
        }
        
        colorSetButton.snp.makeConstraints { make in
            make.top.equalTo(yearDataPicker.snp_bottomMargin).offset(25)
            make.leading.equalTo(view.snp_leadingMargin).offset(150)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-10)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
    }
    
    override func setupAppearance() {
        super.setupAppearance()
        
        view.backgroundColor = .backgraundColor
        
        createLableText.text = R.String.createLable
        createLableText.font = .systemFont(ofSize: 30, weight: .semibold)
        createLableText.textColor = .white
        
        containerAddPhoto.backgroundColor = .inactiv
        containerAddPhoto.layer.cornerRadius = 20
        
        saveButtonCar.setTitle(R.String.saveButtonCar, for: .normal)
        saveButtonCar.backgroundColor = .inactivColor
        saveButtonCar.layer.cornerRadius = 24
        
        let dashedCircleWithCrossView = DashedCircleWithCrossView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        dashedCircleWithCrossView.backgroundColor = UIColor.clear
        layerContainerView.addSubview(dashedCircleWithCrossView)
        
        let tapAddPhooto = UITapGestureRecognizer(target: self, action: #selector(addPhotoAction(_:)))
        containerAddPhoto.addGestureRecognizer(tapAddPhooto)
        containerAddPhoto.isUserInteractionEnabled = true
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        photoView.layer.cornerRadius = 20
        photoView.clipsToBounds = true
        
        photoGalleryButton.setImage(UIImage(systemName: "photo.circle"), for: .normal)
        photoGalleryButton.tintColor = .gray
        photoGalleryButton.contentHorizontalAlignment = .fill
        photoGalleryButton.contentVerticalAlignment = .fill
        photoGalleryButton.isHidden = true
        photoGalleryButton.addTarget(self, action: #selector(showGallery), for: .touchUpInside)
        
        colorPickerVC.delegate = self
        
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.lightGray]
        
        modelCarLable.text = R.String.carModel
        modelCarLable.font = .systemFont(ofSize: 18, weight: .medium)
        modelCarLable.textColor = .white
        
        producerCarLable.text = R.String.carProducer
        producerCarLable.font = .systemFont(ofSize: 18, weight: .medium)
        producerCarLable.textColor = .white
        
        yearCarLable.text = R.String.carYear
        yearCarLable.font = .systemFont(ofSize: 18, weight: .medium)
        yearCarLable.textColor = .white
        
        colorCarLable.text = R.String.carColor
        colorCarLable.font = .systemFont(ofSize: 18, weight: .medium)
        colorCarLable.textColor = .white
        
        colorSetButton.setTitle(R.String.carColorButton, for: .normal)
        colorSetButton.backgroundColor = .inactivColor
        colorSetButton.titleLabel?.font = .systemFont(ofSize: 16)
        colorSetButton.layer.cornerRadius = 10
        colorSetButton.addTarget(self, action: #selector(colorChanged), for: .touchUpInside)
        
        yearDataPicker.datePickerMode = .date
        yearDataPicker.preferredDatePickerStyle = .compact
        yearDataPicker.locale = Locale(identifier: R.String.localDataPicker)
        yearDataPicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        
        modelCarTextField.textColor = .white
        modelCarTextField.attributedPlaceholder = NSAttributedString(string: R.String.modelTextField, attributes: attributes)
        
        producerCarTextField.textColor = .white
        producerCarTextField.attributedPlaceholder = NSAttributedString(string: R.String.producerTextField, attributes: attributes)
        
        addPhotoLableText.text = R.String.addPhoto
        addPhotoLableText.font = .systemFont(ofSize: 18, weight: .medium)
        addPhotoLableText.textColor = .white
        
        saveButtonCar.addTarget(self, action: #selector(save(_:)), for: .touchUpInside)
        
        closeButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        closeButton.tintColor = .gray
        closeButton.contentVerticalAlignment = .fill
        closeButton.contentHorizontalAlignment = .fill
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
    }
}


//MARK: - @objc funcs
@objc extension CreateCarViewController {
    func save(_ sender: UIButton) {
        sender.tapAnimation()
        if presenter?.isChangeData == true {
            presenter?.changeData(model: modelCarTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
                                  producer: producerCarTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
                                  year: yearText,
                                 photo: photoView.image,
                                 color: carColor)
        } else {
            presenter?.saveData(model: modelCarTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
                                producer: producerCarTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
                                year: yearText,
                               photo: photoView.image,
                               color: carColor)
        }
       
    }
    
    func addPhotoAction(_ sender: UIView) {
        present(imagePicker, animated: true)
    }
    
    func showGallery() {
        present(imagePicker, animated: true)
    }
    
    func dateChanged(_ sender: UIDatePicker) {
        let components = Calendar.current.dateComponents([.year], from: sender.date)
        if let year = components.year {
            yearText = String(year)
        }
    }
    
    func colorChanged() {
        present(colorPickerVC, animated: true)
    }
    
    func close() {
        presenter?.close()
    }
}

//MARK: -  UIImagePickerControllerDelegate
extension CreateCarViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            containerAddPhoto.isHidden = true
            photoGalleryButton.isHidden = false
            photoView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

//MARK: -  UIColorPickerViewControllerDelegate
extension CreateCarViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        colorSetButton.backgroundColor = viewController.selectedColor
        colorSetButton.setTitle("", for: .normal)
        carColor = viewController.selectedColor
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
    }
}

//MARK: -  CreateCarViewProtocol
extension CreateCarViewController: CreateCarViewProtocol {
    func setViewData(car: Car) {
        photoView.image = car.photo
        modelCarTextField.text = car.model
        producerCarTextField.text = car.producer
        carColor = car.color
        colorSetButton.backgroundColor = carColor
        yearDataPicker.setYear(Int(car.year)!)
        yearText = car.year
        containerAddPhoto.isHidden = true
        photoGalleryButton.isHidden = false
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "no", message: "Error", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Close", style: .cancel)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
}


