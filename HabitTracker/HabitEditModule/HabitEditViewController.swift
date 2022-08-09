//
//  HabitEditViewController.swift
//  HabitTracker
//
//  Created by Artemiy Zuzin on 09.08.2022.
//

import UIKit
import SnapKit

protocol HabitEditViewControllerProtocol: AnyObject { }

final class HabitEditViewController: UIViewController, HabitEditViewControllerProtocol {

    private let viewModel: HabitEditViewModel
    
    init(viewModel: HabitEditViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let colorPickerViewController = UIColorPickerViewController()
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.showsVerticalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var nameTextField: UITextField = {
        let view = UITextField()
        
        view.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        view.backgroundColor = .clear
        view.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        view.addTarget(self, action: #selector(self.setHabitName), for: .editingDidEnd)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var colorButton: UIButton = {
        let view = UIButton()
        
        view.backgroundColor = .prettyBlue
        view.layer.cornerRadius = 15
        view.addTarget(self, action: #selector(self.colorButtonDidTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let view = UIDatePicker()
        
        view.datePickerMode = .time
        view.preferredDatePickerStyle = .inline
        view.addTarget(self, action: #selector(self.setHabitDate), for: .editingDidEnd)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var removeButton: UIButton = {
        let view = UIButton()
        
        view.setTitle("Удалить привычку", for: .normal)
        view.setTitleColor(.systemRed, for: .normal)
        view.isHidden = self.viewModel.mode == .edit ? false : true
        view.titleLabel?.textAlignment = .center
        view.addTarget(self, action: #selector(self.removeButtonDidTap), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.colorPickerViewController.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupViews()
    }
        
    private func setupViews() {
        self.title = self.viewModel.mode == .edit ? "Править" : "Создать"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Сохранить",
            style: .done,
            target: self,
            action: #selector(self.saveButtonDidTap)
        )
        
        self.nameTextField.text = self.viewModel.habit.name
        self.nameTextField.textColor = self.viewModel.habit.color
        self.colorPickerViewController.selectedColor = self.viewModel.habit.color
        self.colorButton.backgroundColor = self.viewModel.habit.color
        self.datePicker.date = self.viewModel.habit.date
        self.datePicker.tintColor = self.viewModel.habit.color
        
        let nameLabel = self.createTitleLable(text: "НАЗВАНИЕ")
        let colorLabel = self.createTitleLable(text: "ЦВЕТ")
        let timeLabel = self.createTitleLable(text: "ВРЕМЯ")
        let everyDayAtLabel = self.createTitleLable(text: "Каждый день в")
        
        everyDayAtLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        
        self.view.addSubview(self.scrollView)
        
        self.scrollView.addSubview(nameLabel)
        self.scrollView.addSubview(self.nameTextField)
        self.scrollView.addSubview(colorLabel)
        self.scrollView.addSubview(self.colorButton)
        self.scrollView.addSubview(timeLabel)
        self.scrollView.addSubview(everyDayAtLabel)
        self.scrollView.addSubview(self.datePicker)
        self.scrollView.addSubview(self.removeButton)
        
        self.scrollView.snp.makeConstraints { make in
            make.width.leading.trailing.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(20)
            make.width.equalTo(self.view.safeAreaLayoutGuide).inset(40)
        }
        
        self.nameTextField.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).inset(-7)
            make.height.equalTo(20)
        }
        
        colorLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(self.nameTextField.snp.bottom).inset(-15)
        }
        
        self.colorButton.snp.makeConstraints { make in
            make.leading.equalTo(colorLabel)
            make.height.width.equalTo(30)
            make.top.equalTo(colorLabel.snp.bottom).inset(-7)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(self.colorButton.snp.bottom).inset(-15)
        }
        
        everyDayAtLabel.snp.makeConstraints { make in
            make.leading.equalTo(timeLabel)
            make.top.equalTo(timeLabel.snp.bottom).inset(-7)
        }
        
        self.datePicker.snp.makeConstraints { make in
            make.leading.equalTo(everyDayAtLabel.snp.trailing).inset(-2)
            make.centerY.equalTo(everyDayAtLabel)
        }
        
        self.removeButton.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
    }
    
    private func createTitleLable(text: String) -> UILabel {
        let view = UILabel()
        
        view.text = text
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }
        
    @objc private func saveButtonDidTap() {
        if !(self.nameTextField.text ?? "").isEmpty {
            self.viewModel.habitSave()
            self.viewModel.goToHabits()
        } else {
            let alertController = UIAlertController(title: "Поле название пустое", message: "Поле названия не должно быть путым", preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
            
            self.present(alertController, animated: true)
        }
    }
    
    @objc private func removeButtonDidTap() {
        self.viewModel.removeHabit()
        self.viewModel.goToHabits()
    }
    
    @objc private func setHabitName() {
        self.viewModel.habit.name = self.nameTextField.text ?? ""
    }
    
    @objc private func colorButtonDidTap() {
        self.present(self.colorPickerViewController, animated: true)
    }
    
    @objc private func setHabitDate() {
        self.viewModel.habit.date = self.datePicker.date
    }

}

extension HabitEditViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        self.viewModel.habit.color = viewController.selectedColor
        self.colorButton.backgroundColor = viewController.selectedColor
        self.nameTextField.textColor = viewController.selectedColor
        self.datePicker.tintColor = viewController.selectedColor
    }
}
