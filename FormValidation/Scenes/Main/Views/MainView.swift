//
//  MainView.swift
//  FormValidation
//
//  Created by Анатолий Фетелеу on 16.04.2023.
//

import UIKit
import SnapKit


class MainView: UIView {
    let stateLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        return view
    }()
  
    let vertStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 15
        return view
    }()
        
    let loginInput = InputView(
        placeholderText: LocalizedStrings.loginInputPlaceholder,
        labelText: LocalizedStrings.loginInputLabelText,
        hintLabelText: "",
        textFieldContextType: .username
    )
    
    let emailInput = InputView(
        placeholderText: LocalizedStrings.emailInputPlaceholder,
        labelText: LocalizedStrings.emailInputLabelText,
        hintLabelText: "",
        textFieldContextType: .emailAddress
    )
    
    var submitButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle(LocalizedStrings.submitButtonTitle, for: .normal)
        view.setTitleColor(.systemGray4, for: .disabled)
        view.setTitleColor(.black, for: .normal)
        view.isEnabled = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        setupViews()
        setViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .white
    }
    
    // MARK: - Setup views
    
    private func setupViews() {
        addSubview(vertStackView)
        vertStackView.addArrangedSubview(stateLabel)
        vertStackView.addArrangedSubview(loginInput)
        vertStackView.addArrangedSubview(emailInput)
        vertStackView.addArrangedSubview(submitButton)
        
        vertStackView.setCustomSpacing(75, after: stateLabel)
    }
    
    private func setViewConstraints() {
        setLoginConstraints()
        setEmailConstraints()
        setVstackConstraints()
        setStateLabelConstraints()
    }

    // MARK: - Setting constraints
    
    private func setLoginConstraints() {}
    
    private func setEmailConstraints() {}
    
    private func setStateLabelConstraints() {}
    
    private func setVstackConstraints() {
        vertStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
    }
}
