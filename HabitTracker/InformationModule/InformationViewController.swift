//
//  InformationViewController.swift
//  HabitTracker
//
//  Created by Artemiy Zuzin on 07.08.2022.
//

import UIKit
import SnapKit

final class InformationViewController: UIViewController {

    private let viewModel: InformationViewModel
    
    init(viewModel: InformationViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.showsVerticalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let titleLabel: UILabel = {
        let view = UILabel()
        
        view.text = "Привычка за 21 день"
        view.numberOfLines = 0
        view.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let textLabel: UILabel = {
        let view = UILabel()
        
        view.text = text
        view.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupViews()
    }
    
    private func setupViews() {
        self.title = "Информация"
        
        self.view.addSubview(self.scrollView)
        
        self.scrollView.addSubview(self.titleLabel)
        self.scrollView.addSubview(self.textLabel)
        
        self.scrollView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        self.titleLabel.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview().inset(15)
        }
        
        self.textLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(15)
            make.top.equalTo(self.titleLabel.snp.bottom).inset(-15)
            make.width.equalToSuperview().inset(15)
        }
    }
    
}
