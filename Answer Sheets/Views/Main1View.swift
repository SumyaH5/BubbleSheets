//
//  MainView.swift
//  Ahlan
//
//  Created by Sumo Hoque on 9/12/22.
//

import SwiftUI

enum TabType: Int, CaseIterable {
    case home = 0
    case myRec
    

    var tabItem: TabItemData {
        switch self {
        case .home:
            return  TabItemData(image: "checkmark.circle", selectedImage: "checkmark.circle.fill", title: "Take Test")
        case .myRec:
            return TabItemData(image: "square.and.arrow.down.on.square", selectedImage: "square.and.arrow.down.on.square.fill", title: "Saved Tests")
        }
    }
}
struct MainView: View {
    
    @State var selectedIndex: Int = 0
    
    var body: some View {
        
        
        
        CustomTabView(tabs: TabType.allCases.map({ $0.tabItem }), selectedIndex: $selectedIndex) { index in
            let type = TabType(rawValue: index) ?? .home
            getTabView(type: type)
        }
    }
    
    @ViewBuilder
    func getTabView(type: TabType) -> some View {
        switch type {
        case .home:
            SwiftUIView()
        case .myRec:
            SavedView()
        }
    }
}
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
