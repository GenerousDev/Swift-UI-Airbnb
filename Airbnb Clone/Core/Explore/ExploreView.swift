//
//  ExploreView.swift
//  Airbnb Clone
//
//  Created by Mac on 15/11/2024.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    
    var body: some View {
        NavigationStack{
            if showDestinationSearchView {
                
                DestinationSearch(show: $showDestinationSearchView)            } else {
                SearchAndFilterBar()
                    .onTapGesture {
                        withAnimation(.snappy){
                            showDestinationSearchView.toggle()
                        }
                    }
                    
                ScrollView{
                    LazyVStack(spacing:32) {
                        ForEach(0 ... 20 , id: \.self){
                            listing in NavigationLink(value: listing){
                                ListingItemView().frame(height: 400).clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                }.navigationDestination(for: Int.self){ 
                    listing in ListingDetailView().navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
