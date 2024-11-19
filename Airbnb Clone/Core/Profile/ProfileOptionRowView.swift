//
//  ProfileOptionRowView.swift
//  Airbnb Clone
//
//  Created by Mac on 18/11/2024.
//

import SwiftUI


struct ProfileOptionRowView: View {
    let imageName : String
    let title : String
    var body: some View {
        VStack {
            HStack{
                Image(systemName: imageName)
                Text(title).font(.subheadline)
                Spacer()
                Image(systemName: "chevron.right")
            }
            Divider()
        }
    }
}

#Preview {
    ProfileOptionRowView(imageName: "gear", title: "Settings")
}
