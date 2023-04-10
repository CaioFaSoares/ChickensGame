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
    
	@State var showCombatView: Bool = false
    
    var body: some View {
		if showCombatView {
			CombatView(player: (12,2), enemy: (8,2), delegate: self)
		} else {
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
				Button("Start match with default values") {
					showCombatView.toggle()
				}
			}
		}
    }
}

extension MainMenuView {
	func returnToMenuTogglingCombatView() -> Void {
		showCombatView = true
	}
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
