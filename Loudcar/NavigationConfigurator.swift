//
//  NavigationConfigurator.swift
//  Loudcar
//
//  Created by Karthik on 26/04/21.
//

import Swift
import UIKit

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController,
                                context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let navigationController = uiViewController.navigationController {
            self.configure(navigationController)
            print("Successfully obtained navigation controller")
        } else {
            print("Failed to obtain navigation controller")
        }
    }
}
