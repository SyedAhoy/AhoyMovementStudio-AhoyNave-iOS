//
//  ViewController.swift
//  AhoyMap-Example
//
//  Created by Syed Ismail Ahamed on 14/05/2022.
//

import UIKit
import CoreLocation
import AhoyNave


class ViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {

        super.viewDidLoad()
        activityIndicator.startAnimating()
        NotificationCenter.default.addObserver(self, selector: #selector(sdkInitialised), name: Notification.Name("SDKInitialised"), object: nil)
    }

    @objc func sdkInitialised() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }

    @IBAction func navigateToDestinationTapped(_ sender: Any) {
        let destinationLocation = CLLocation(latitude: 25.327396542469668, longitude: 55.38771042802632)
        AhoyMapManager.shared().launchAhoyMaps(destinationLocation: destinationLocation)


    }
    
    @IBAction func showMapTapped(_ sender: Any) {
        if let detailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsVC") as? DetailsViewController {
            self.navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
    
}

