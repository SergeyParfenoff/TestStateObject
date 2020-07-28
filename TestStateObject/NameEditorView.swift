//
//  NameEditorView.swift
//  TestStateObject
//
//  Created by Sergey on 28.07.2020.
//

import SwiftUI

struct NameEditorView: View {
    @ObservedObject var user: User
    @State private var userName: String
    @State private var userSurname: String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            Section(header: Text("I am")) {
                TextField("Name", text: $userName).padding()
                TextField("Last name", text: $userSurname).padding()
            }
            Button("sure!") {
                user.name = userName
                user.surname = userSurname
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    init(user: User) {
        self.user = user
        _userName = State(initialValue: user.name)
        _userSurname = State(initialValue: user.surname)
    }
}

struct NameEditorView_Previews: PreviewProvider {
    static var previews: some View {
        NameEditorView(user: User(name: "Ivan", surname: "Ivanoff"))
    }
}
