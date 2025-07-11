//
//  ContentView.swift
//  Hack404News
//
//  Created by Taneem Ahmed on 20/6/25.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var netManger = NetworkManager()
    
    init() {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(red: 0.552, green: 0.847, blue: 1, alpha: 1) // Background color
            let customColor = UIColor(red: 0.06274509803921569, green: 0.1803921568627451, blue: 0.3137254901960784, alpha: 1.0)
            appearance.titleTextAttributes = [.foregroundColor: customColor]
        appearance.largeTitleTextAttributes = [.foregroundColor: customColor]
            
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
    
    var body: some View {
        ZStack{
            Color(red: 0.552, green: 0.847, blue: 1).edgesIgnoringSafeArea(.all)
        NavigationView{
            List(netManger.posts){ post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack{
                        Text(String(post.points)).bold()
                        Text(post.title)
                    }
                    .padding(.vertical, 8)
                    .foregroundColor(Color(red: 0.06274509803921569, green: 0.1803921568627451, blue: 0.3137254901960784))
                }
                .listRowBackground(Color(red: 0.552, green: 0.847, blue: 1))
            }
            .background(Color(red: 0.552, green: 0.847, blue: 1))
            .scrollContentBackground(.hidden)
            .listStyle(PlainListStyle())
            .navigationBarTitle("Hack404News")
        }
        .onAppear{
            self.netManger.fetchData()
        }
        }
    }
}

#Preview {
    ContentView()
}
