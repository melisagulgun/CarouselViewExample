//
//  ContentView.swift
//  CarouselViewExample
//
//  Created by Melisa Gülgün on 28.07.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      VStack(content: {
            CarouselView(imageURLList: ["https://images.metmuseum.org/CRDImages/ep/original/DP346474.jpg", "https://images.metmuseum.org/CRDImages/ep/original/DT1567.jpg", "https://images.metmuseum.org/CRDImages/ep/original/DT1967.jpg", "https://images.metmuseum.org/CRDImages/dp/original/DP810344.jpg"], isPlaceholderActive: true, isAutoScrollActive: true)
              .padding(.horizontal, 8)
        })
    }
}

#Preview {
    ContentView()
}
