//
//  MapsViewController.swift
//  LayoutTests
//
//  Created by Ahmed Naguib on 04/12/2023.
//

import UIKit
import MapKit

class MapsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnMap(_ sender: Any) {
        showDirectionsAlert()
    }
    
    @objc func showDirectionsAlert() {
        let alertController = UIAlertController(title: "Get directions from", message: nil, preferredStyle: .actionSheet)

            // Add buttons to the alert
            alertController.addAction(UIAlertAction(title: "Maps", style: .default) { _ in
                // Handle Maps button action
                self.openAppleMaps()
            })

            alertController.addAction(UIAlertAction(title: "Google Maps", style: .default) { _ in
                // Handle Google Maps button action
                self.openGoogleMaps()
            })

            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

            // Present the alert
            present(alertController, animated: true, completion: nil)
        }

        

        func openGoogleMaps() {
            // Your code to open Google Maps
            print("Opening Google Maps")
        }
    
     func openAppleMaps() {
            let latitude = 30.0444 // Replace with the desired latitude
            let longitude = 31.2357 // Replace with the desired longitude
            let locationName = "San Francisco" // Replace with the location name

            let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: nil)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = locationName

            let launchOptions: [String : Any] = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
            mapItem.openInMaps(launchOptions: launchOptions)
        }
}
