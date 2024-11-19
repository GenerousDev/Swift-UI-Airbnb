//
//  ListingView.swift
//  Airbnb Clone
//
//  Created by Mac on 15/11/2024.
//

import SwiftUI

struct ListingItemView: View {
    var body: some View {
        VStack(spacing: 8){
            ListingImageCarouselView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            //            Listing details
            HStack(alignment: .top){
                VStack(alignment: .leading){
                    //                 Details
                    Text("Maimi,FLorida").fontWeight(.bold).foregroundStyle(.black)
                    Text("12 Miles Away").foregroundStyle(.gray)
                    Text("Nov 3 - Dec 5").foregroundStyle(.gray)
                    HStack{
                        Text("$567").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text("night")
                    }.foregroundStyle(.black)
                }
                Spacer()
                //                rating
                HStack{
                    Image(systemName: "star.fill")
                    Text("4.86")
                }.foregroundStyle(.black)
            }.font(.footnote)
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ListingItemView()
}
