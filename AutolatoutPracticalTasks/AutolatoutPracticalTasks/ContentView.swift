//
//  ContentView.swift
//  AutolatoutPracticalTasks
//
//  Created by Kakhaberi Kiknadze on 20.03.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Task 1") {
                    Task1ViewController().asSwiftUIView()
                }
                NavigationLink("Task 2") {
                    Task2ViewController().asSwiftUIView()
                }
                NavigationLink("Task 3") {
                    Task3ViewController().asSwiftUIView()
                }
                NavigationLink("Task 4") {
                    Task4ViewController().asSwiftUIView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

extension UIViewController {
    func asSwiftUIView() -> some View {
        AsSwiftUIView {
            self
        }
        .ignoresSafeArea()
    }
}

struct AsSwiftUIView: UIViewControllerRepresentable {
    private let make: () -> UIViewController
    
    init(make: @escaping () -> UIViewController) {
        self.make = make
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        make()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
