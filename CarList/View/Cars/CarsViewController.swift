

import UIKit
import SnapKit

final class CarsViewController: BaseController {
    
    var presenter: CarsPresenter?
    
    private let mainTextLable = UILabel()
    private let addCarButton = UIButton()
    private let carTableView = UITableView()
    private let noCarsTextLable = UILabel()
    private let noCarsSubtextLable = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.setupData()
    }
}

extension CarsViewController {
    override func embedViews() {
        super.embedViews()
        [mainTextLable,
         addCarButton,
         carTableView,
         noCarsTextLable,
         noCarsSubtextLable].forEach { view in
            self.view.addView(view)
        }
    }
    
    override func setupLayout() {
        super.setupLayout()
        mainTextLable.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(54)
            make.centerX.equalTo(view.center)
        }
        
        addCarButton.snp.makeConstraints { make in
            make.top.equalTo(mainTextLable.snp_bottomMargin).offset(50)
            make.height.equalTo(54)
            make.leading.equalTo(view.snp_leadingMargin).offset(16)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-16)
        }
        
        carTableView.snp.makeConstraints { make in
            make.top.equalTo(addCarButton.snp_bottomMargin).offset(30)
            make.leading.equalTo(view.snp_leadingMargin).offset(16)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-16)
            make.bottom.equalTo(view.snp.bottom).offset(0)
        }
        
        noCarsTextLable.snp.makeConstraints { make in
            make.top.equalTo(addCarButton.snp.bottom).offset(70)
            make.leading.equalTo(view.snp_leadingMargin).offset(16)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-16)
        }
        
        noCarsSubtextLable.snp.makeConstraints { make in
            make.top.equalTo(noCarsTextLable.snp.bottom).offset(10)
            make.leading.equalTo(view.snp_leadingMargin).offset(16)
            make.trailing.equalTo(view.snp_trailingMargin).offset(-16)
        }
        
        
    }
    
    override func setupAppearance() {
        super.setupAppearance()
        view.backgroundColor = .backgraundColor
        
        mainTextLable.text = R.String.mainTitle
        mainTextLable.font = .systemFont(ofSize: 30, weight: .semibold)
        mainTextLable.textColor = .white
        
        addCarButton.backgroundColor = .inactiv
        addCarButton.setTitle(R.String.mainButtonAdd, for: .normal)
        addCarButton.layer.cornerRadius = 24
        
        addCarButton.addTarget(self, action: #selector(addCarAction(_:)), for: .touchUpInside)
        
        carTableView.showsVerticalScrollIndicator = false
        carTableView.delegate = self
        carTableView.dataSource = self
        carTableView.backgroundColor = .clear
        carTableView.register(CarCellTableView.self)
        carTableView.rowHeight = UITableView.automaticDimension
        
        noCarsTextLable.text = "Your car list is empty"
        noCarsTextLable.font = .systemFont(ofSize: 18, weight: .medium)
        noCarsTextLable.textAlignment = .center
        noCarsTextLable.textColor = .white
        
        noCarsSubtextLable.text = "Please click on the 'Add car' button"
        noCarsSubtextLable.font = .systemFont(ofSize: 15, weight: .light)
        noCarsSubtextLable.textAlignment = .center
        noCarsSubtextLable.textColor = .white
    }
    
    private func showNoCarText() {
        if !(presenter?.cars.isEmpty)! {
            noCarsTextLable.isHidden = true
            noCarsSubtextLable.isHidden = true
        } else {
            noCarsTextLable.isHidden = false
            noCarsSubtextLable.isHidden = false
        }
    }
}

extension CarsViewController {
    @objc func addCarAction(_ sender: UIButton) {
        sender.tapAnimation()
        presenter?.openCreateCarController()
    }
}

//MARK: - UITableViewDelegate
extension CarsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let verticalPadding: CGFloat = 12
        
        let maskLayer = CALayer()
        maskLayer.cornerRadius = 18
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.tapAnimation()
        presenter?.openDetailsCarController(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            presenter?.deleteItem(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            showNoCarText()
        }
    }
}

//MARK: - UITableViewDataSource
extension CarsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.cars.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cars = presenter?.cars else { return UITableViewCell() }
        let cell: CarCellTableView = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.setupData(image: cars[indexPath.row].photo,
                       textModel: cars[indexPath.row].model,
                       textProducer: cars[indexPath.row].producer,
                       textYear: cars[indexPath.row].year)
        return cell
    }
}

extension CarsViewController: CarsViewProtocol {
    func reloadData() {
        carTableView.reloadData()
        showNoCarText()
    }
}


