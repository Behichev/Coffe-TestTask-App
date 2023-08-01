//
//  CaffeDetailedViewController.swift
//  Coffe Test App
//
//  Created by Ivan Behichev on 31.07.2023.
//

import UIKit
import MapKit

class CaffeDetailedViewController: UIViewController {
    
    @IBOutlet weak var adrTitle: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var caffePhotoImage: UIImageView!
    @IBOutlet weak var caffeNameLabel: UILabel!
    @IBOutlet weak var caffeAdressLabel: UILabel!
    @IBOutlet weak var scheduleView: UIView!
    @IBOutlet weak var closedIndicatorView: UIView!
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var phoneButtonView: UIView!
    @IBOutlet weak var instButtonView: UIView!
    @IBOutlet weak var tiktokButtonView: UIView!
    @IBOutlet weak var mapView: MKMapView!
    
    private var location: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        location = CLLocationCoordinate2D(latitude: 50.4501, longitude: 30.5234)
        
        if let location {
            let regionRadius: CLLocationDistance = 10000
            let region = MKCoordinateRegion(center: location, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            mapView.setRegion(region, animated: true)
        }
    }
    
    private func setupUI(){
        adrTitle.layer.cornerRadius = 8
        adrTitle.layer.borderWidth = 2
        adrTitle.layer.borderColor = UIColor.black.cgColor
        
        caffePhotoImage.layer.cornerRadius = 18
        scheduleView.layer.cornerRadius = 20
        scheduleView.layer.borderColor = UIColor.lightGray.cgColor
        scheduleView.layer.borderWidth = 1
        closedIndicatorView.layer.cornerRadius = closedIndicatorView.frame.size.height / 2
        locationView.layer.cornerRadius = 12
        
        mapView.layer.cornerRadius = 18
        
        phoneButtonView.layer.cornerRadius = phoneButtonView.frame.height / 2
        phoneButtonView.layer.borderWidth = 2
        phoneButtonView.layer.borderColor = UIColor(named: "borderPink")?.cgColor
        
        instButtonView.layer.cornerRadius = instButtonView.frame.height / 2
        instButtonView.layer.borderWidth = 2
        instButtonView.layer.borderColor = UIColor(named: "borderPink")?.cgColor
        
        tiktokButtonView.layer.cornerRadius = tiktokButtonView.frame.height / 2
        tiktokButtonView.layer.borderWidth = 2
        tiktokButtonView.layer.borderColor = UIColor(named: "borderPink")?.cgColor
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
