//
//  CustomPageControl.swift
//  CarouselViewExample
//
//  Created by Melisa Gülgün on 28.07.2024.
//

import Foundation
import SwiftUI

struct CustomPageControl: View {
    var pageCount: Int = 0
    var backgroundColor: Color = .white
    var backgroundOpacity: CGFloat = 1
    var strokeColor: Color = .white
    var selectedBackgroundColor: Color = .white
    var selectedBackgroundOpacity: CGFloat = 1
    var selectedStrokeColor: Color = .gray
    var dotSize: CGFloat = 6
    @Binding var selectedIndex: Int
    
    var body: some View {
        HStack(content: {
            ForEach(0..<pageCount, id: \.self) { page in
                let isCurrentIndex = page == selectedIndex
                Capsule()
                    .fill( isCurrentIndex ? selectedBackgroundColor : backgroundColor)
                    .stroke(isCurrentIndex ? selectedStrokeColor : strokeColor, lineWidth: 0.5)
                    .opacity(isCurrentIndex ? selectedBackgroundOpacity: backgroundOpacity)
                    .frame(width: isCurrentIndex ? dotSize * 3 : dotSize, height: isCurrentIndex ? dotSize * 1.5 : dotSize)
                    .padding(3)

            }
        })
        .clipped()
        .padding(.horizontal, 5)
        .frame(maxWidth: .infinity)
        .cornerRadius(10)
        .background(
            Color.gray.opacity(0.5)
                .frame(width: (CGFloat(pageCount) * dotSize * 3) + 16, height: dotSize * 2.5)
                .cornerRadius(5))
        
    }
}

#Preview {
    CustomPageControl(pageCount: 5, selectedIndex: .constant(2))
}
