//
//  SearchAndFilterBar.swift
//  Airbnb Clone
//
//  Created by Mac on 15/11/2024.
//

import SwiftUI

struct SearchAndFilterBar: View {
    var body: some View {
        HStack(spacing: 15){
            Image(systemName: "magnifyingglass")
//                .resizable().scaledToFit().frame(height: 25)
            VStack(alignment: .leading , spacing: 2){
                Text("Where to?").font(.footnote).fontWeight(.semibold)
                Text("Anywhere . Anyweek .Add guests").font(.caption2).foregroundStyle(.gray)
            }
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "slider.horizontal.3").foregroundColor(.black)
            })
           
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay{
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: .black.opacity(0.4), radius:2)
        }.padding()
    }
}

#Preview {
    SearchAndFilterBar()
}
