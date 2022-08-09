//
//  HabitCollectionViewCell.swift
//  HabitTracker
//
//  Created by Artemiy Zuzin on 08.08.2022.
//

import UIKit
import SnapKit

final class HabitCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static let reusableIdentifier = String(describing: HabitCollectionViewCell.self)
    
    var habit: Habit? {
        didSet {
            guard let habit = self.habit else {
                return
            }
            
            self.titleLable.text = habit.name
            self.titleLable.textColor = habit.color
            self.timeLabel.text = habit.dateString
            self.countLabel.text = "Счётчик: \(habit.trackDates.count)"
            
            if habit.isAlreadyTakenToday {
                self.trackButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            } else {
                self.trackButton.setImage(UIImage(systemName: "circle"), for: .normal)
            }
            
            self.trackButton.tintColor = habit.color
        }
    }
    
    var trackButtonDidTapSelectAction: ((Habit) -> Void)?
    
    private let titleLable: UILabel = {
        let view = UILabel()
        
        view.numberOfLines = 0
        view.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let timeLabel: UILabel = {
        let view = UILabel()
        
        view.numberOfLines = 0
        view.textColor = .systemGray2
        view.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let countLabel: UILabel = {
        let view = UILabel()
        
        view.numberOfLines = 0
        view.textColor = .systemGray
        view.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var trackButton: UIButton = {
        let view = UIButton()
        
        view.addTarget(self, action: #selector(self.trackButtonDidTap(_:)), for: .touchUpInside)
        view.layer.cornerRadius = 19
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private func setupViews() {
        self.layer.cornerRadius = 8
        self.backgroundColor = .white
        
        self.addSubview(self.titleLable)
        self.addSubview(self.timeLabel)
        self.addSubview(self.countLabel)
        self.addSubview(self.trackButton)
        
        self.titleLable.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(20)
            make.trailing.equalTo(self.trackButton.snp.leading).inset(-40)
        }

        self.timeLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.titleLable)
            make.top.equalTo(self.titleLable.snp.bottom).inset(-4)
        }

        self.countLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.titleLable)
            make.top.equalTo(self.timeLabel.snp.bottom).inset(-30)
            make.bottom.equalToSuperview().inset(20)
        }

        self.trackButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.height.width.equalTo(38)
            make.centerY.equalToSuperview()
        }
        
        self.trackButton.imageView?.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    @objc private func trackButtonDidTap(_ sender: UIButton) {
        if !sender.isSelected, let habit = self.habit {
            self.trackButtonDidTapSelectAction?(habit)
        }
    }
    
}
