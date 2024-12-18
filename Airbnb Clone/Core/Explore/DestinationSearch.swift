//
//  DestinationSearch.swift
//  Airbnb Clone
//
//  Created by Mac on 16/11/2024.
//

import SwiftUI

enum DestinationSearchOptions{
    case value
    case location
    case dates
    case guests
}

struct DestinationSearch: View {
    @Binding var show : Bool
    @State private var destination = ""
    @State private var selectedOption : DestinationSearchOptions = .dates
    @State private var startDate  = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
    
    var body: some View {
        VStack{
            HStack {
                Button{
                    withAnimation(.snappy){
                        show.toggle()
                    }
                }label: {
                    Image(systemName: "xmark.circle").imageScale(.large).foregroundColor(.black)
                }
                Spacer()
                if destination != "" {
                    Button("Clear"){
                        destination = ""
                    }
                    
                    .foregroundColor(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    
                }
            }
                    .padding()
            
            VStack(alignment: .leading){
                if selectedOption == .location {
                    Text("Where to").font(.title2).fontWeight(.semibold)
                    HStack{
                        Image(systemName: "magnifyingglass").imageScale(.small)
                        TextField("Search destinations", text: $destination)
                            .font(.subheadline)
                    }
                    .frame(height:44)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color(.systemGray4))
                    }
                }
                else{
                    CollapsedPickerView(title: "Where to", description: "i'm flexible")
                }
            }
            .modifier(CollapsableDestinationViewModifier())
            .frame(height: selectedOption == .location ? 140 : 64)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOption = .location
                }
            }
            
            VStack(alignment: .leading){
                if selectedOption == .dates {
                    Text("When is your trip? ").font(.title2).fontWeight(.semibold)
                    VStack{
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        Divider()
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                    }
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
                else{
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .modifier(CollapsableDestinationViewModifier())
            .frame(height: selectedOption == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOption = .dates
                }
            }
            
            
            VStack(alignment: .leading){
                if selectedOption == .guests {
                    Text("Who is coming? ").font(.title2).fontWeight(.semibold)
                    Stepper{
                        Text("\(numGuests) Adults")
                    } onIncrement: {
                        numGuests += 1
                    } onDecrement: {
                        guard numGuests > 0 else { return }
//                        if numGuests > 0 {
                            numGuests -= 1
//                        }
                    }
                        
                        .foregroundColor(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
                else{
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .modifier(CollapsableDestinationViewModifier())
            .frame(height: selectedOption == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOption = .guests
                }
    
            }
            
        }.padding()
        Spacer()
    }
}

#Preview {
    DestinationSearch(show: .constant(false))
}

struct CollapsableDestinationViewModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius:10)
    }
    
}
struct CollapsedPickerView: View {
    let title: String
    let description: String
    var body: some View {
        VStack{
            HStack{
                Text(title).foregroundColor(.gray)
                Spacer()
                Text(description)
            }.fontWeight(.semibold).font(.subheadline)
        }
    }
}
