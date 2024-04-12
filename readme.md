# [CropDemo]()

# Supported Features
- Image cropping with ratio
- Image circle crop
- Image rotating
- Image straightening
- Image flipping
- Select and lock aspect ratio 
- Save and restore state, reset/re-edit
- Ref: https://github.com/qchenqizhi/QCropper


## Step1:
- Add QCropper folder into your project target

## Step2:
- Open Crop ViewController

        func openCropView(image: UIImage) {
            // create crop viewcontroller object
            let cropViewController = CropperViewController(originalImage: image)
            // set delegate
            cropViewController.delegate = self
            // present crop viewcontroller
            self.present(cropViewController, animated: true)
        }
    
    
## Step3:
 - Implement CropperViewControllerDelegate methods in your viewcontorller
 
        extension ViewController: CropperViewControllerDelegate {
            func cropperDidConfirm(_ cropper: CropperViewController, state: CropperState?) {
            cropper.dismiss(animated: true)
                if let state = state,
                    let image = cropper.originalImage.cropped(withCropperState: state) {
                    imgCropResult.image = image
                    print(cropper.isCurrentlyInInitialState)
                    print(image)
                }
            }
    
            func cropperDidCancel(_ cropper: CropperViewController) {
                cropper.dismiss(animated: true)
            }
        }
    
## Step4 (Optional):
 - Need to change Crop view controller button tint color, you can change config as below before open crop view controller,
    
        QCropper.Config.tintColor = UIColor.blue

## Step5 (Optional):
 - If need to crop image as circle share, just pass isCircular value as true, e.g.
 
        func openCircleShapeCropView(image: UIImage) {
            let cropViewController = CropperViewController(originalImage: image, isCircular: true)
            cropViewController.delegate = self
            self.present(cropViewController, animated: true)
        }
 - Note: When you set image after crop, imageview should be circle shape

## Step6 (Optional):
 - There are mostly used 15 type of ratio, still need more ratio then you can add, just follow below step
    * Open CropperViewController.swift file from QCropper
    * Find verticalAspectRatios variable name
    * Add AspectRatio type object into verticalAspectRatios variable
    
    
#About Demo project
 - On click HCrop/VCrop, Crop viewcontroller will open with rotate and ratio options
 - On click Circle, Crop viewcontroller will open
 - Once click on done, your crop image will set in imageview 
 
    
#Happy Coding!! Thanks!
