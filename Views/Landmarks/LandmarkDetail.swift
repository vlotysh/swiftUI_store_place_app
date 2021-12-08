//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Vlad Lotysh on 01.12.2021.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark

    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {
            $0.id == landmark.id
        })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y:-130)
                .padding(.bottom, -130)

            VStack (alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
            
                HStack {
                    Text(landmark.park)
                        .font(.headline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About\(landmark.name)")
                    .font(.title2)
                Text(landmark.description)

            }
            .padding()
        }
        .ignoresSafeArea()
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)

    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var modelData = ModelData()

    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
