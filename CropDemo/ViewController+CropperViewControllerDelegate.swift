//
//  ViewController+CropperViewControllerDelegate.swift
//  CropDemo
//
//  Created by Subhash Kimani on 18/05/23.
//

import UIKit

/// CropperViewControllerDelegate method implementation
extension ViewController: CropperViewControllerDelegate {
    /// cropperDidConfirm is called when crop done click
    /// - Parameters:
    ///   - cropper: CropperViewController type
    ///   - state: CropperState optional type
    func cropperDidConfirm(_ cropper: CropperViewController, state: CropperState?) {
        // dismiss crop viewcontroller
        cropper.dismiss(animated: true)
        
        // crop image from original image
        if let state = state,
           let image = cropper.originalImage.cropped(withCropperState: state) {
            imgCropResult.image = image
            print(cropper.isCurrentlyInInitialState)
            print(image)
        }
    }
    
    /// cropperDidCancel is called when user cancle from crop viewcontroller
    /// - Parameter cropper: CropperViewController type
    func cropperDidCancel(_ cropper: CropperViewController) {
        // dismiss crop viewcontroller
        cropper.dismiss(animated: true)
    }
}
