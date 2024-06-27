//
//  VideoGalleryView.swift
//  StudentMentalHealthApp
//
//  Created by Aryan Pradhan on 27/06/2024.
//

import SwiftUI
import WebKit

struct StudyVideoGalleryView: View {
    @ObservedObject var viewModel: StudyVideoGalleryViewModel
    
    var body: some View {
        TabView {
            ForEach(viewModel.videoURLs, id: \.self) { videoURL in
                VideoWebView(url: URL(string: videoURL)!)
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.25)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

struct VideoWebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
