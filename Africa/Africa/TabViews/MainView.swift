//
//  MainView.swift
//  Africa
//
//  Created by Artur Korol on 03.08.2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    TabBarItemView(image: "square.grid.2x2", title: "Browse")
                }
            
            VideoListView()
                .tabItem {
                    TabBarItemView(image: "play.rectangle", title: "Watch")
                }
            
            MapView()
                .tabItem {
                    TabBarItemView(image: "map", title: "Locations")
                }
            
            GalleryView()
                .tabItem {
                    TabBarItemView(image: "photo", title: "Gallary")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
