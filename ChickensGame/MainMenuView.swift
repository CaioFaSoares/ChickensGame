//
//  MainMenuView.swift
//  ChickensGame
//
//  Created by Caio Soares on 30/03/23.
//

import SwiftUI

struct MainMenuView: View {
    
    @State var playerHP = String("")
    @State var playerDP = String("")
    
    @State var enemyHP = String("")
    @State var enemyDP = String("")
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Text("Olá, mundo.")
                HStack {
					Spacer()
                    TextField("HP do Player", text: $playerHP).keyboardType(.decimalPad)
                    TextField("DP do Player", text: $playerDP).keyboardType(.decimalPad)
					Spacer()
                }
                HStack {
					Spacer()
                    TextField("HP do Inimigo", text: $enemyHP).keyboardType(.decimalPad)
                    TextField("DP do Inimigo", text: $enemyDP).keyboardType(.decimalPad)
					Spacer()
                }
				Button("Start match with default values")
				{ path.append("DefaultChallenge") }.navigationDestination(for: String.self)
				{ view in
					if view == "DefaultChallenge" {
						CombatView(player: (12,2), enemy: (8,2))
					}
				}
            }
			.navigationBarBackButtonHidden(true)
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
