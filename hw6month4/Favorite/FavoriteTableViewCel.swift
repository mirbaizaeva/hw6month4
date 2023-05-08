//
//  FavoriteTableViewCel.swift
//  hw6month4
//
//  Created by Nurjamal Mirbaizaeva on 8/5/23.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher
class FavoriteTableViewCel: UITableViewCell {
    
    static var reuceID = String(describing: FavoriteTableViewCel.self)
    
    private lazy var productImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var productTitleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        view.textColor = .black
        view.numberOfLines = 2
        return view
    }()
    
    private lazy var productDescriptionLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    private lazy var productPriceLabel: UILabel = {
        let view = UILabel()
        view.textColor = .blue
        view.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return view
    }()
    
    lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.tintColor = .red
        return button
    }()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupTableUI()
        
    }
    func setupTableUI(){
        self.addSubview(productImageView)
        productImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
            make.right.equalToSuperview()
            make.width.equalTo(170)
            
        }
        self.addSubview(productTitleLabel)
        productTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.top).offset(13)
            make.right.equalTo(productImageView.snp.left)
            make.left.equalToSuperview().offset(13)
        }
        self.addSubview(productPriceLabel)
        productPriceLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(13)
            make.top.equalTo(productTitleLabel.snp.bottom).offset(13)
        }
        self.addSubview(deleteButton)
        deleteButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    func display(item:Product){
        productImageView.kf.setImage(with: URL(string: item.thumbnail))
        productPriceLabel.text = String(item.price)
        productTitleLabel.text = item.title
    }
}
