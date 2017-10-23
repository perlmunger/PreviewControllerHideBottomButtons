//
//  DemoController.swift
//  PreviewControllerHideBottomButtons
//
//  Created by Ruvim Micsanschi on 9/2/16.
//  Copyright © 2016 com.example. All rights reserved.
//

import UIKit
import QuickLook

class DemoController: UIViewController {

    fileprivate let itemsArray:[String] = ["image1", "image2", "image3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//MARK: - IBActions
extension DemoController {
    
    @IBAction func presentPreviewControllerTapped(_ sender: UIButton) {
        
        let previewController = QLPreviewController()
        previewController.dataSource = self
        
        let previewNavigationController = PreviewNavigationController(navigationBarClass:nil, toolbarClass: PreviewControllerToolbar.self)
        previewNavigationController.pushViewController(previewController, animated: false)
        present(previewNavigationController, animated:true, completion: nil)
    }
}



//MARK: - QLPreviewControllerDataSource
extension DemoController : QLPreviewControllerDataSource {
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return itemsArray.count
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        
        guard let filePath = Bundle.main.path(forResource: itemsArray[index], ofType:"jpg") else {
            return URL(fileURLWithPath: "bob") as QLPreviewItem
        }
        
        let url = URL(fileURLWithPath: filePath)
        return url as QLPreviewItem
    }
}
