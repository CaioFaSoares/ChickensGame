//
//  Utility.swift
//  ChickensGame
//
//  Created by Caio Soares on 03/04/23.
//

import Foundation

func waitSomeAmountOfMiliseconds(_ seconds: Double, _ functionToBeRun: ()) {
	DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
		print("test")
		functionToBeRun
	}
}
