//
//  MainViewController.swift
//  FormValidation
//
//  Created by Анатолий Фетелеу on 16.04.2023.
//

import UIKit
import RxCocoa
import RxSwift


class MainViewController: UIViewController {
    private let mainView = MainView()
    private let viewModel = MainViewModel()
    private let disposeBag = DisposeBag()
    
    // MARK: Lifecycle-
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupBindings()
        configureButtonActions()        
    }
    
    // MARK: - Lifecycle
    
    private func setup() {
        title = "Form validation sample"
    }
    
    private func setupBindings() {
        mainView.loginInput.textField.rx.text.bind(to: viewModel.loginRelay).disposed(by: disposeBag)
        mainView.emailInput.textField.rx.text.bind(to: viewModel.emailRelay).disposed(by: disposeBag)
        viewModel.isFormValid.bind(to: mainView.submitButton.rx.isEnabled).disposed(by: disposeBag)
        mainView.loginInput.textField.rx
            .controlEvent([.editingDidEnd])
            .asObservable()
            .map { [weak self] in
                guard let self else { return "" }
                return (
                    self.viewModel.loginIsValidRelay.value
                    ? ""
                    : LocalizedStrings.incorrectLogin
                )
            }
            .map {
                NSAttributedString(
                    string: $0,
                    attributes: [.font: Fonts.hintFont, .foregroundColor: Colors.hintColor]
                )
            }
            .bind(to: mainView.loginInput.hintLabel.rx.attributedText)
            .disposed(by: disposeBag)

        mainView.emailInput.textField.rx
            .controlEvent([.editingDidEnd])
            .asObservable()
            .map { [weak self] in
                guard let self else { return "" }
                return (
                    self.viewModel.emailIsValidRelay.value
                    ? ""
                    : LocalizedStrings.incorrectEmail
                )
            }
            .map {
                NSAttributedString(
                    string: $0,
                    attributes: [.font: Fonts.hintFont, .foregroundColor: Colors.hintColor]
                )
            }
            .bind(to: mainView.emailInput.hintLabel.rx.attributedText)
            .disposed(by: disposeBag)
    }
}

extension MainViewController {
    private func configureButtonActions() {
        mainView.submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
    }
    
    @objc func submitButtonTapped() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.mainView.stateLabel.text = LocalizedStrings.succeeded
            debugPrint("the button was pressed")
        }
    }
}

