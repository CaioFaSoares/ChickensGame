//
//  MainMenuView.swift
//  ChickensGame
//
//  Created by Caio Soares on 30/03/23.
//

import SwiftUI

struct MainMenuView: View {
    @State var shouldShowOnBoarding: Bool = true

	@State var coordinator: GameCoordinator = GameCoordinator()
	@State var showCombatView: Bool = false
    
    var body: some View {
		NavigationStack {
			VStack {
				Text("Olá, mundo.").font(.custom("PPMondwest-Bold", size: 16))
				Button("Start match with default values") {
					showCombatView.toggle()
				}
			}
			NavigationLink(destination: CombatView(coordinator: coordinator), isActive: $showCombatView) {}
		}
        .fullScreenCover(isPresented: $shouldShowOnBoarding, content: {
            OnBoardingView() 
        })
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
