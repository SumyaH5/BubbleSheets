
import SwiftUI
struct TbView: View {
    @State private var showWebView = false
    var body: some View {
        TabView
        {
            SwiftUIView()
                            .tabItem {
                                VStack {
                                    Image(systemName: "star.fill")
                                    Text("Featured")
                                }
                            }
                        
                        SavedView()
                            .tabItem {
                                VStack {
                                    Image(systemName: "list.bullet")
                                    Text("List")
                                }
                            }
                
            
        }
        
        
    }
    
    
    struct TbView_Previews: PreviewProvider {
        static var previews: some View {
            TbView()
        }
    }
}
