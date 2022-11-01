//
//  previewExtension.swift
//  PlantWithJoy
//
//  Created by Jisu Jang on 2022/10/03.
//

import SwiftUI
import Foundation
import UIKit

#if DEBUG
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
            let viewController: UIViewController

            func makeUIViewController(context: Context) -> UIViewController {
                return viewController
            }

            func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            }
        }

        func toPreview() -> some View {
            Preview(viewController: self)
        }
}
#endif
