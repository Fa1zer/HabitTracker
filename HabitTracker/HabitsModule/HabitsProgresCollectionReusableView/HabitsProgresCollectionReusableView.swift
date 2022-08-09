//
//  HabitsProgresCollectionReusableView.swift
//  HabitTracker
//
//  Created by Artemiy Zuzin on 07.08.2022.
//

import UIKit
import SnapKit

final class HabitsProgresCollectionReusableView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static let reuseIdentifier = String(describing: HabitsProgresCollectionReusableView.self)
    
    var percent: Float = 0 {
        didSet {
            self.percentLabel.text = "\(Int(self.percent * 100))%"
            self.progressView.progress = self.percent
        }
    }
    
    private let titleLabel: UILabel = {
        let view = UILabel()
        
        view.text = "Всё получится!"
        view.numberOfLines = 0
        view.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        view.textColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let percentLabel: UILabel = {
        let view = UILabel()
        
        view.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        view.textColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let progressView: UIProgressView = {
        let view = UIProgressView(progressViewStyle: .bar)
        
        view.clipsToBounds = true
        view.layer.cornerRadius = 4
        view.layer.sublayers?[1].cornerRadius = 4
        view.backgroundColor = .prettyWhite
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private func setupViews() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(self.titleLabel)
        self.addSubview(self.percentLabel)
        self.addSubview(self.progressView)
        
        self.titleLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(10)
            make.trailing.equalTo(self.percentLabel.snp.leading).inset(-10)
        }
        
        self.percentLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalTo(self.titleLabel)
        }
        
        self.progressView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalTo(self.titleLabel.snp.bottom).inset(-15)
            make.bottom.equalToSuperview().inset(15)
            make.height.equalTo(7)
        }
    }
    
}
