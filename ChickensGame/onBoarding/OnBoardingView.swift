//
//  onBoardingView.swift
//  ChickensGame
//
//  Created by Lucas Barbosa de Oliveira on 26/04/23.
//

import Foundation
import SwiftUI


struct OnBoardingView: View {
    var body: some View {
        TabView {
            PageView().background(Color.red)

            PageView().background(Color.blue)
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct PageView: View {
    var body: some View {
        VStack {
            Text("a")
        }
    }
}
