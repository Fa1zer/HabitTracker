//
//  HabitDetailViewController.swift
//  HabitTracker
//
//  Created by Artemiy Zuzin on 08.08.2022.
//

import UIKit
import SnapKit

final class HabitDetailViewController: UIViewController {

    private let viewModel: HabitDetailViewModel
    
    init(viewModel: HabitDetailViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        
        view.backgroundColor = .prettyWhite
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupViews()
    }
    
    private func setupViews() {
        self.title = self.viewModel.habit.name
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Править",
            style: .plain,
            target: self,
            action: #selector(self.editButtonDidTap)
        )
        
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.top.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    @objc private func editButtonDidTap() {
        self.viewModel.goToEdit()
    }
    
}

extension HabitDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.dates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var configuration = cell.defaultContentConfiguration()
        
        configuration.text = self.viewModel.trackDateString(forIndex: indexPath.row)
        configuration.textProperties.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        
        cell.contentConfiguration = configuration
        
        if self.viewModel.habit(
            self.viewModel.habit,
            isTrackedIn: self.viewModel.dates[indexPath.row]
        ) {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "АКТИВНОСТЬ"
    }
    
}

extension HabitDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
