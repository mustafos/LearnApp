//
//  LocationDetailViewModel.swift
//  FinderApp
//
//  Created by Mustafa Bekirov on 29.05.2024.
//

import SwiftUI
import MapKit

final class LocationDetailViewModel: ObservableObject {
    
    @Published var alertItem: AlertItem?
    
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())]
    
    var location: DDGLocation
    
    init(location: DDGLocation) {
        self.location = location
    }
    
    func getDirectionstoLocation() -> Void {
        let placemark = MKPlacemark(coordinate: location.location.coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = location.name
        
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking])
    }
    
    func callLocation() -> Void {
        guard let url = URL(string: "tel://\(location.phoneNumber)") else {
            alertItem = AlertContext.invalidePhoneNumber
            return
        }
        
        UIApplication.shared.open(url)
    }
}
