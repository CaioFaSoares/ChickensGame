//
//  ActionButton.swift
//  ChickensGame
//
//  Created by Lucas Barbosa de Oliveira on 05/04/23.
//

import Foundation
import SwiftUI

struct ActionButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.brown)
//            Image("backgroundname")
            .frame(alignment: .center)
			.multilineTextAlignment(.center)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
    }
}
