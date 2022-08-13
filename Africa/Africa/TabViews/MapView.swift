//
//  MapView.swift
//  Africa
//
//  Created by Artur Korol on 03.08.2022.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: - Properties
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(
            latitude: 6.600286,
            longitude: 16.4377599
        )
        var mapSpan = MKCoordinateSpan(
            latitudeDelta: 70.0,
            longitudeDelta: 70.0
        )
        var mapRegion = MKCoordinateRegion(
            center: mapCoordinates,
            span: mapSpan
        )
        return mapRegion
    }()
    
    let location: [NationalParkLocation] = Bundle.main.decode("locations")
    
    //MARK: - Body
    var body: some View {
        //        Map(coordinateRegion: $region)
        Map(coordinateRegion: $region,
            annotationItems: location) { item in
            //            MapMarker(coordinate: item.location,
            //                      tint: .accentColor)
            
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        }
            .overlay(
                HStack(alignment: .center, spacing: 12) {
                    Image("compass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48, alignment: .center)
                    
                    VStack(alignment: .leading, spacing: 3) {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Divider()
                        Text("Longitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                    }
                    Spacer()
                    VStack(alignment: .trailing, spacing: 3) {
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                        Divider()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                    }
                }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .background(
                        Color.black
                            .cornerRadius(8)
                            .opacity(0.6)
                    )
                    .padding()
                , alignment: .top
            )
    }
}

//MARK: - Preview

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
