//
//  MainMenuView.swift
//  ChickensGame
//
//  Created by Caio Soares on 30/03/23.
//

import SwiftUI

struct MainMenuView: View {
	
	@State var coordinator: GameCoordinator = GameCoordinator()
	@State var showCombatView: Bool = false
    
    var body: some View {
		NavigationStack {
			VStack {
				Text("Olá, mundo.")
				Button("Start match with default values") {
					showCombatView.toggle()
				}
			}
			NavigationLink(destination: CombatView(coordinator: coordinator), isActive: $showCombatView) {}
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
