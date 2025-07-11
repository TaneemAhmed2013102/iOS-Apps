//
//  ContentView.swift
//  GoldenRetriever
//
//  Created by Taneem Ahmed on 19/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 0.77, green: 0.168, blue: 0.218).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Image("Taneem")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150.0, height: 150.0)
                    .clipShape(Circle())
                    .overlay(Circle().stroke( Color.white,lineWidth: 5))
                
                Text("Taneem Ahmed")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(.white)
                Text("iOS Developer")
                    .font(.system(size: 25))
                    .bold()
                    .foregroundColor(.white)
                Divider()
                InfoView(text: "+880 1777-005381", imageName: "phone.fill")
                InfoView(text: "taneem27ahmed@gmail.com", imageName: "envelope.fill")
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
