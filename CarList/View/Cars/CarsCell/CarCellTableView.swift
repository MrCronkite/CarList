

import UIKit
import SnapKit

final class CarCellTableView: UITableViewCell {
    private let pictureImageView = UIImageView()
    private let modelTextLable = UILabel()
    private let producerTextLable = UILabel()
    private let yearTextLable = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        embedView()
        setupLayout()
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        embedView()
        setupLayout()
        setupAppearance()
    }
}

extension CarCellTableView {
    private func embedView() {
        [pictureImageView,
         modelTextLable,
         producerTextLable,
         yearTextLable].forEach { view in
            contentView.addView(view)
        }
    }
    
    private func setupLayout() {
        pictureImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.layoutMarginsGuide.snp.top).offset(4)
            make.bottom.equalTo(contentView.layoutMarginsGuide.snp.bottom).offset(-4)
            make.leading.equalTo(contentView.layoutMarginsGuide.snp.leading).offset(-8)
            make.height.equalTo(54)
            make.width.equalTo(54)
        }
        
        modelTextLable.snp.makeConstraints { make in
            make.leading.equalTo(pictureImageView.snp_trailingMargin).offset(20)
            make.top.equalTo(contentView.layoutMarginsGuide.snp.top).offset(6)
        }
        
        
        producerTextLable.snp.makeConstraints { make in
            make.leading.equalTo(pictureImageView.snp_trailingMargin).offset(20)
            make.bottom.equalTo(contentView.layoutMarginsGuide.snp.bottom).offset(-6)
        }
        
        yearTextLable.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.layoutMarginsGuide.snp.trailing).offset(-8)
            make.top.equalTo(contentView.layoutMarginsGuide.snp.top).offset(10)
        }
    }
    
    private func setupAppearance() {
        self.backgroundColor = .clear
        contentView.backgroundColor = .inactivColor
        contentView.layer.cornerRadius = 15
        
        
        pictureImageView.backgroundColor = .activColor
        pictureImageView.layer.cornerRadius = 13
        pictureImageView.clipsToBounds = true 
        
        modelTextLable.text = "Hello wordl"
        modelTextLable.font = .systemFont(ofSize: 18, weight: .medium)
        modelTextLable.textColor = .white
        
        producerTextLable.text = "Hello wordl"
        producerTextLable.font = .systemFont(ofSize: 12, weight: .medium)
        producerTextLable.textColor = .white
        
        yearTextLable.text = "1999"
        yearTextLable.font = .systemFont(ofSize: 12, weight: .medium)
        yearTextLable.textColor = .white
    }
    
    func setupData(image: UIImage, textModel: String, textProducer: String, textYear: String) {
        pictureImageView.image = image
        modelTextLable.text = textModel
        producerTextLable.text = textProducer
        yearTextLable.text = textYear
    }
}
