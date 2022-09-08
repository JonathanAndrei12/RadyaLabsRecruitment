//
//  RadyaLabs_RecruitmentApp.swift
//  RadyaLabs Recruitment
//
//  Created by Jonathan Andrei on 07/09/22.
//

import SwiftUI

@main
struct RadyaLabs_RecruitmentApp: App {
    init() {
        let appearance =  UINavigationBarAppearance()
        appearance.shadowColor = .clear
        appearance.backgroundColor = UIColor(named: "NavBarBackground")
//        appearance.titleTextAttributes = [.foregroundColor : UIColor.white]
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            ListFoodsView()
        }
    }
}
