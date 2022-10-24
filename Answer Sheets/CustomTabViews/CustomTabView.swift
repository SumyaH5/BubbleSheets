//
//  CustomTabView.swift
//  Ahlan
//
//  Created by Sumo Hoque on 9/12/22.
//

import SwiftUI

var a = TabItemData(image: "checkmark.circle", selectedImage: "checkmark.circle.fill", title: "Take Test")
var b = TabItemData(image: "square.and.arrow.down.on.square", selectedImage: "square.and.arrow.down.on.square.fill", title: "Saved Tests")

struct CustomTabView<Content: View>: View {
    
    let tabs: [TabItemData]
    @Binding var selectedIndex: Int
    @ViewBuilder let content: (Int) -> Content
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedIndex) {
                ForEach(tabs.indices) { index in
                    content(index)
                        .tag(index)
                }
            }
            
            VStack {
                Spacer()
                TabBottomView(tabbarItems: tabs, selectedIndex: $selectedIndex)
            }
            .padding(.bottom, 8)
        }
    }
}
/*struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView<<#Content: View#>>, (tabs: [a, b, c, d], selectedIndex: <#Binding<Int>#>, content: <#(Int) -> _#>)
    }
}*/
