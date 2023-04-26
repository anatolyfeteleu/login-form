//
//  UIView.swift
//  FormValidation
//
//  Created by Анатолий Фетелеу on 24.04.2023.
//

import UIKit
import SnapKit


class InputView: UIView {
    let labelText: String
    let hintLabelText: String
    let placeholderText: String
    let textFieldContextType: UITextContentType
    
    let label: UILabel = UILabel()
    let hintLabel: UILabel = UILabel()
    let textField: UITextField = UITextField()
    let vertStackView: UIStackView = UIStackView()
    
    init(placeholderText: String, labelText: String, hintLabelText: String,  textFieldContextType: UITextContentType) {
        self.placeholderText = placeholderText
        self.labelText = labelText
        self.hintLabelText = hintLabelText
        self.textFieldContextType = textFieldContextType
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        setupView()
        setupViews()
        setConstraints()
        stylization()
    }
    
    private func setupView() {
        addSubview(vertStackView)
        vertStackView.addArrangedSubview(label)
        vertStackView.addArrangedSubview(textField)
        vertStackView.addArrangedSubview(hintLabel)
    }
    
    private func setupViews() {
        setupTextField()
        setupLabel()
        setupHintLabel()
        setupVertStackView()
    }
    
    private func setConstraints() {
        setStackConstraints()
    }
    
    // MARK: - Set constraints
        
    private func setStackConstraints() {
        vertStackView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.trailing.equalTo(snp.trailingMargin)
            make.leading.equalTo(snp.leadingMargin)
        }
    }
    
    // MARK: - Stylization
    
    private func stylization() {
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
    }
    
    // MARK: - Setup views
    
    private func setupLabel() {
        label.text = labelText
    }
    
    private func setupHintLabel() {
        hintLabel.numberOfLines = 100
        hintLabel.textAlignment = .left
    }
    
    private func setupTextField() {
        switch textFieldContextType {
        case .emailAddress:
            textField.autocapitalizationType = .none
            textField.keyboardType = .emailAddress
        case .username:
            textField.autocapitalizationType = .sentences
            textField.keyboardType = .alphabet
        case _:
            textField.autocapitalizationType = .sentences
        }
        
        textField.placeholder = placeholderText
        textField.textContentType = textFieldContextType
    }
    
    private func setupVertStackView() {
        vertStackView.axis = .vertical
        vertStackView.spacing = 10
        vertStackView.alignment = .fill
    }
}
