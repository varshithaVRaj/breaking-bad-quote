//
//  QuoteView.swift
//  BreakingBadApp
//
//  Created by Varshitha VRaj on 31/08/25.
//

import SwiftUI

struct QuoteView: View{
    
    var vm = ViewModel()
    var show: String
    
    var body: some View{
        
        ZStack{
            
            GeometryReader { geo in
                ZStack {
                    Image(String(
                        show.lowercased().replacingOccurrences(of: " ", with: "")
                    ))
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height)
                    .clipped()
                    .ignoresSafeArea()
                    
                    VStack {
                        if let q = vm.quote {
                            Text("\"\(q.quote)\"")
                                .multilineTextAlignment(.center)
                                .padding()
                                .background(.ultraThinMaterial) // or Color.black.opacity(0.5)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                .padding(.horizontal, 20)
                        }
                        
                        if let imageString = vm.charcter?.images.first,
                           let imageURL = URL(string: imageString) {
                            if let imageURL = vm.charcter?.images[0] {
                                
                                if let imageURL = URL(string: imageURL)  {
                                    AsyncImage(url: imageURL) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                        case .success(let image):
                                            
                                            ZStack(alignment: .bottom){
                                                
                                                image
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: geo.size.width/1.1, height: geo.size.height / 1.8)
                                                    .clipShape(RoundedRectangle(cornerRadius: 20))
               
                                                Text("Hello")
                                                    .frame(maxWidth: geo.size.width/1.2)
                                        .padding()
                                        .background(.ultraThinMaterial)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                                       
                                                      
                                            }
                                         
                                        case .failure:
                                            Image(systemName: "person.fill.questionmark")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 200, height: 300)
                                                .foregroundColor(.gray)
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                   
                                }
                            }
                        }
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    
    QuoteView(show: "Breaking Bad")
        .preferredColorScheme(.dark)
    
}
