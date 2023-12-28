

import UIKit
import SnapKit

final class CarsDetailsViewController: BaseController {
    
    var presenter: DetailsCarPresenter?
    
    private let carImageView = UIImageView()
    private let blurViewForImage = UIView()
    private let modelText = UILabel()
    private let backButton = UIButton()
    private let changeButton = UIButton()
    private let containerDetailsView = UIView()
    private let producerTextLable = UILabel()
    private let producerTextValueLable = UILabel()
    private let yearTextValueLable = UILabel()
    private let colorTextLable = UILabel()
    private let colorView = UIView()
    private let divider = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension CarsDetailsViewController {
    override func embedViews() {
        super.embedViews()
        [carImageView,
         backButton,
         changeButton,
         containerDetailsView].forEach { view in
            self.view.addView(view)
        }
        
        carImageView.addView(blurViewForImage)
        blurViewForImage.addView(modelText)
        blurViewForImage.addView(yearTextValueLable)
        
        [producerTextLable, 
         producerTextValueLable,
         colorTextLable,
         colorView, divider].forEach { view in
            containerDetailsView.addView(view)
        }
    }
    
    override func setupLayout() {
        super.setupLayout()
        carImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(80)
            make.leading.equalTo(view.snp_leadingMargin).offset(16)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-16)
            make.height.equalTo(270)
        }
        
        blurViewForImage.snp.makeConstraints { make in
            make.leading.equalTo(carImageView.snp.leading).offset(0)
            make.trailing.equalTo(carImageView.snp.trailing).offset(0)
            make.bottom.equalTo(carImageView.snp.bottom).offset(0)
            make.height.equalTo(100)
        }
        
        modelText.snp.makeConstraints { make in
            make.top.equalTo(blurViewForImage.snp.top).offset(30)
            make.leading.equalTo(blurViewForImage.snp_leadingMargin).offset(16)
            make.trailing.equalTo(blurViewForImage.snp_trailingMargin).offset(-16)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalTo(view.snp.leading).offset(30)
            make.height.equalTo(30)
            make.width.equalTo(20)
        }
        
        changeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.trailing.equalTo(view.snp.trailing).offset(-30)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        containerDetailsView.snp.makeConstraints { make in
            make.top.equalTo(carImageView.snp.bottom).offset(16)
            make.leading.equalTo(view.snp.leading).offset(30)
            make.trailing.equalTo(view.snp.trailing).offset(-30)
        }
        
        yearTextValueLable.snp.makeConstraints { make in
            make.bottom.equalTo(blurViewForImage.snp_bottomMargin).offset(-10)
            make.leading.equalTo(blurViewForImage.snp_leadingMargin).offset(16)
        }
        
        producerTextLable.snp.makeConstraints { make in
            make.top.equalTo(containerDetailsView.snp.top).offset(18)
            make.leading.equalTo(containerDetailsView.snp_leadingMargin).offset(12)
        }
        
        producerTextValueLable.snp.makeConstraints { make in
            make.top.equalTo(containerDetailsView.snp.top).offset(18)
            make.leading.equalTo(containerDetailsView.snp_leadingMargin).offset(120)
            make.trailing.equalTo(containerDetailsView.snp_trailingMargin).offset(-12)
        }
        
        divider.snp.makeConstraints { make in
            make.top.equalTo(producerTextLable.snp.bottom).offset(10)
            make.height.equalTo(1)
            make.leading.equalTo(containerDetailsView.snp_leadingMargin).offset(5)
            make.trailing.equalTo(containerDetailsView.snp_trailingMargin).offset(-5)
        }
        
        colorTextLable.snp.makeConstraints { make in
            make.top.equalTo(divider.snp.bottom).offset(10)
            make.leading.equalTo(containerDetailsView.snp_leadingMargin).offset(12)
            make.bottom.equalTo(containerDetailsView.snp.bottom).offset(-18)
        }
        
        colorView.snp.makeConstraints { make in
            make.top.equalTo(divider.snp.bottom).offset(10)
            make.leading.equalTo(containerDetailsView.snp_leadingMargin).offset(120)
            make.height.equalTo(27)
            make.width.equalTo(60)
        }
    }
    
    override func setupAppearance() {
        super.setupAppearance()
        view.backgroundColor = .backgraundColor
        
        carImageView.backgroundColor = .inactivColor
        carImageView.layer.cornerRadius = 25
        carImageView.clipsToBounds = true
        
        blurViewForImage.addTransparentGradient()
        
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.tintColor = .gray
        backButton.contentVerticalAlignment = .fill
        backButton.contentHorizontalAlignment = .fill
        backButton.addTarget(self, action: #selector(goToBack), for: .touchUpInside)
        
        changeButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        changeButton.tintColor = .gray
        changeButton.contentVerticalAlignment = .fill
        changeButton.contentHorizontalAlignment = .fill
        changeButton.addTarget(self, action: #selector(goToChange), for: .touchUpInside)
        
        modelText.textColor = .white
        modelText.font = .systemFont(ofSize: 25, weight: .bold)
        
        containerDetailsView.backgroundColor = .inactiv
        containerDetailsView.layer.cornerRadius = 25
        
        yearTextValueLable.textColor = .white
        yearTextValueLable.font = .systemFont(ofSize: 18, weight: .medium)
        
        producerTextLable.textColor = .white
        producerTextLable.text = "Producer:"
        producerTextLable.font = .systemFont(ofSize: 20, weight: .regular)
        
        producerTextValueLable.textColor = .white
        producerTextValueLable.font = .systemFont(ofSize: 20, weight: .medium)
        
        divider.backgroundColor = .black
        
        colorTextLable.textColor = .white
        colorTextLable.text = "Color:"
        colorTextLable.font = .systemFont(ofSize: 20, weight: .regular)

        colorView.layer.cornerRadius = 12
    }
}

@objc extension CarsDetailsViewController {
    func goToBack() {
        presenter?.goToRoot()
    }
    
    func goToChange() {
        presenter?.changeCar()
    }
}

extension CarsDetailsViewController: DetailsViewProtocol {
    func setup(car: Car) {
        carImageView.image = car.photo
        modelText.text = car.model
        yearTextValueLable.text = car.year
        producerTextValueLable.text = car.producer
        colorView.backgroundColor = car.color
    }
}

