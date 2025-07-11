//
//  DetailView.swift
//  Hack404News
//
//  Created by Taneem Ahmed on 20/6/25.
//

import SwiftUI
struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView.init(urlString: url)
    }
}

#Preview {
    DetailView(url: "https://www.google.com")
}



