//
//  WishlistsView.swift
//  Airbnb Clone
//
//  Created by Mac on 19/11/2024.
//

import SwiftUI

struct WishlistsView: View {
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading,spacing: 32) {
                VStack(alignment: .leading,spacing: 4){
                   
                    Text("Login to view your wishlist").font(.headline)
                    Text("You can create, view or edit wishlist once you are logged in").font(.footnote)
                    
                    Button{
                        
                    }label: {
                        Text("Log In")
                            .frame(width: 360, height: 50)
                            .foregroundStyle(.white)
                            .background(.pink)
                            .font(.subheadline)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                Spacer()
            }.padding()
            .navigationTitle("Wishlists")
        }
    }
}

#Preview {
    WishlistsView()
}
