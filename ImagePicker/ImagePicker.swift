//
//  ImagePicker.swift
//  Landmarks
//
//  Created by Vlad Lotysh on 13.12.2021.
//

import PhotosUI
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            //handler for cancel button
            picker.dismiss(animated: true)
            
            guard let provider = results.first?.itemProvider else {return}
            
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) {image, _ in
                    self.parent.image = image as? UIImage
                }
            }
        }
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        // 1. make config for only image
        var config = PHPickerConfiguration()
        config.filter = .images
        // 2. apply config
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        //Not implimented
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
