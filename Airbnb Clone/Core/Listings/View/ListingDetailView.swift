//
//  ListingDetailView.swift
//  Airbnb Clone
//
//  Created by Mac on 16/11/2024.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    @State private var isPortrait: Bool = UIDevice.current.orientation.isPortrait
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView{
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView()
                    .frame(height: 320)
                Button{
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background(Circle().fill(.white).frame(width: 32, height: 32))
                        .padding(32)
                }
            }
            
            VStack(alignment: .leading, spacing: 8){
                Text("Single Bed in beautiful cottage in rural settings")
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(maxWidth: isPortrait ? 350 : .infinity, alignment: .leading)
                    .onAppear {
                        self.isPortrait = UIDevice.current.orientation.isPortrait
                    }
                    .onRotate { newOrientation in
                        self.isPortrait = newOrientation.isPortrait
                    }
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: "star.fill")
                        Text("4.86")
                        Text(" - ")
                        Text("28 reviews").underline().fontWeight(.semibold)
                    }.font(.caption)
                        .foregroundStyle(.black)
                    Text("Maimi Florida").font(.caption)
                    
                }
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            //            Host Info view
            HStack{
                VStack(alignment:.leading, spacing: 4){
                    Text("Entire villa hosted by john smith")
                        .font(.headline)
                        .frame(maxWidth: isPortrait ? 250 : .infinity, alignment: .leading)
                        .onAppear {
                            self.isPortrait = UIDevice.current.orientation.isPortrait
                        }
                        .onRotate { newOrientation in
                            self.isPortrait = newOrientation.isPortrait
                        }
                    HStack(spacing : 2 ){
                        Text("4 guests - ")
                        Text("4 bedroom - ")
                        Text("4 beds - ")
                        Text("3 baths")
                    }.font(.caption)
                }
                Spacer()
                Image("male")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
            .padding()
            
            Divider()
            
            //            Listing features
            VStack(alignment: .leading, spacing: 16){
                ForEach(0 ..< 2){ feature in
                    HStack(spacing: 12 ){
                        Image(systemName: "medal")
                        VStack(alignment: .leading){
                            Text("Superhost")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("Superhost are experience, highly rated hosts who are committed to providing great stars for guests")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                }
            }.padding()
            
            Divider()
            
            VStack( alignment: .leading ){
                Text("Where you will sleep").font(.headline)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing:16){
                        ForEach( 0 ..< 5){ bedroom in
                            VStack{
                                Image(systemName: "bed.double")
                                Text("Bedroom \(bedroom)")
                            }.frame(width: 132, height: 100)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                                        .foregroundStyle(.gray)
                                }
                        }
                    }
                }.scrollTargetBehavior(.paging)
            }.padding()
            
            //            Bedrooms View
            Divider()
            
            VStack( alignment: .leading, spacing: 16){
                Text("What this place offers").font(.headline)
                ForEach(0 ..< 4){ feature in
                    HStack(spacing : 30){
                        Image(systemName: "wifi").frame(width: 32)
                        Text("Wifi \(feature)").font(.footnote)
                        Spacer()
                    }                }
            }.padding()
            
            Divider()
            
            VStack(alignment:.leading, spacing:16){
                Text("Where you will be")
                Map().frame(height:200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }.padding()
        }.toolbar(.hidden,for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 60)
        .overlay(alignment: .bottom){
            VStack {
                Divider()
                    .padding(.bottom)
                HStack{
                    VStack(alignment: .leading){
                        Text("$500")
                            .font(.subheadline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text("Total before taxes")
                            .font(.footnote)
                        Text("Oct 15 - 20")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    Spacer()
                    Button{
                        
                    }label: {
                        Text("Reserve").foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }.padding(.horizontal, 32)
            }
            .background(.white)
        }
    }
}

#Preview {
    ListingDetailView()
}

extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            action(UIDevice.current.orientation)
        }
    }
}
