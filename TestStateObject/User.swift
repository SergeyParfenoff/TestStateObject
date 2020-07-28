//
//  MyObject.swift
//  TestStateObject
//
//  Created by Sergey on 28.07.2020.
//

import Foundation

class User: ObservableObject {
    @Published var name: String { didSet { checkFillState() } }
    @Published var surname: String { didSet { checkFillState() } }
    @Published var fillState: FillState = .notFilled
    
    enum FillState {
        case filled
        case notFilled
    }
    
    private func checkFillState() {
        fillState = !(name == "" && surname == "") ? .filled : .notFilled
    }
    
    init(name: String? = nil, surname: String? = nil) {
        self.name = name ?? ""
        self.surname = surname ?? ""
        checkFillState()
    }
}
