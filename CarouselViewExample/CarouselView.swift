//
//  CarouselView.swift
//  CarouselViewExample
//
//  Created by Melisa Gülgün on 28.07.2024.
//

import Foundation
import SwiftUI
struct CarouselView: View {
    @State var imageURLList: [String]?
    @State var isPlaceholderActive: Bool = true
    @State var selectedIndex = 0
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .centerLastTextBaseline,content: {
                TabView (selection: $selectedIndex) {
                    if let imageList = imageURLList {
                        AsyncImage(url: URL(string: imageList.last ?? "")) { downloadedImage in
                            downloadedImage.resizable()
                                .scaledToFill()
                                .transition(.opacity)
                            
                        } placeholder: {
                            if isPlaceholderActive {
                                ProgressView()
                            }
                        }.tag(-1)
                        ForEach(imageList.indices, id: \.self) { index in
                            AsyncImage(url: URL(string: imageList[index])) { downloadedImage in
                                downloadedImage.resizable()
                                    .scaledToFill()
                                    .transition(.opacity)
                                    .tag(index)
                            } placeholder: {
                                if isPlaceholderActive {
                                    ProgressView()
                                }
                            }
                        }
                        AsyncImage(url: URL(string: imageList.first ?? "")) { downloadedImage in
                            downloadedImage.resizable()
                                .scaledToFill()
                                .transition(.opacity)
                            
                        } placeholder: {
                            if isPlaceholderActive {
                                ProgressView()
                            }
                        }.tag(imageURLList?.count ?? 0)
                    }
                }
                .frame(height: 300)
                .tabViewStyle(.page(indexDisplayMode: .never))
                .onChange(of: selectedIndex) { oldValue, newValue in
                    if newValue == imageURLList?.count {
                        selectedIndex = 0
                    } else if newValue == -1 {
                        selectedIndex = (imageURLList?.count ?? 0) - 1
                    }
                }
                CustomPageControl(pageCount: imageURLList?.count ?? 0, selectedIndex: $selectedIndex)
                    .padding(.bottom, 10)
            })
        }
    }
}

#Preview {
    CarouselView(imageURLList: ["https://images.metmuseum.org/CRDImages/ep/original/DP346474.jpg", "https://images.metmuseum.org/CRDImages/ep/original/DT1567.jpg", "https://images.metmuseum.org/CRDImages/ep/original/DT1967.jpg", "https://images.metmuseum.org/CRDImages/dp/original/DP810344.jpg"])
}
