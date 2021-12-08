//
//  MapView.swift
//  Landmarks
//
//  Created by Vlad Lotysh on 30.11.2021.
//

import SwiftUI
import MapKit

struct IdentifiablePlace: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    init(id: UUID = UUID(), lat: Double, long: Double) {
        self.id = id
        self.location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long)
    }
}

extension MKMapView {

    // delta is the zoom factor
    // 2 will zoom out x2
    // .5 will zoom in by x2

    func setZoomByDelta(delta: Double, animated: Bool) {
        var _region = region;
        var _span = region.span;
        _span.latitudeDelta *= delta;
        _span.longitudeDelta *= delta;
        _region.span = _span;

        setRegion(_region, animated: animated)
    }
}

struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D
    var place: IdentifiablePlace

    @State private var region = MKCoordinateRegion()

    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate;
        self.place = IdentifiablePlace(lat: coordinate.latitude, long: coordinate.longitude);

    }
    
    var body: some View {
        Map(coordinateRegion: $region,  annotationItems: [place])
        { place in
            MapPin(coordinate: place.location,
                   tint: Color.red)
        }
            .onAppear{
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 37.334_900, longitude: -122.009_020))
    }
}
