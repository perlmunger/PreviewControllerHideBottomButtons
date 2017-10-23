//
//  PreviewNavigationController.swift
//  PreviewControllerHideBottomButtons
//
//  Created by Ruvim Micsanschi on 9/2/16.
//  Copyright © 2016 com.example. All rights reserved.
//

import UIKit

class PreviewNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let controller = viewControllers.first {
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target:self, action:#selector(doneButtonTapped))
            controller.navigationItem.leftBarButtonItem = doneButton
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


extension PreviewNavigationController {
    
    @objc func doneButtonTapped() -> Void {
        dismiss(animated: true, completion: nil)
    }
}
