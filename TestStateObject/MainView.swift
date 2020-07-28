//
//  ContentView.swift
//  TestStateObject
//
//  Created by Sergey on 28.07.2020.
//

import SwiftUI

struct MainView: View {
    @StateObject private var user = User()
    
    var body: some View {
        NavigationView {
            VStack {
                switch user.fillState {
                case .filled:
                    Text("Hello, \(user.name) \(user.surname)!").padding()
                case .notFilled:
                    Text("Hello, new user!").padding()
                }
                NavigationLink(
                    destination: NameEditorView(user: user),
                    label: {
                        Text("Edit my name").font(.footnote)
                    })
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
