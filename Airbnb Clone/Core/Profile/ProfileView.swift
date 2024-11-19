//
//  ProfileView.swift
//  Airbnb Clone
//
//  Created by Mac on 18/11/2024.
//

import SwiftUI

struct Setting: Hashable {
    let icon: String
    let title: String
}

struct ProfileView: View{
    
    var settings = [
             ("gear", "Settings","Data"),
             ("bell", "Accessibility","Data"),
             ("house", "Learn about housing","Data"),
             ("heart", "Get help","Data"),
             ("person",  "Terms of Service","Data"),
             ("bell", "Privacy Policy","Data"),
             ("house", "Open source licences","Data"),
         ]
    
    var body: some View {
        VStack {
            VStack(alignment: .leading,spacing: 32){
                VStack(alignment: .leading, spacing: 8) {
                    Text("Profile").fontWeight(.semibold).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                Text("Login to start planning your next trip.")
                
                Button{
                    
                }label: {
                    Text("Log In")
                        .frame(width: 360, height: 50)
                        .foregroundStyle(.white)
                        .background(.pink)
                        .font(.subheadline)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                HStack{
                    Text("Don't have an account?")
                    Button{
                        
                    }label: {
                        Text("Sign up").underline().foregroundStyle(.black)
                    }
                }.font(.caption)
            }.padding()
            VStack(spacing:24){
                ForEach(settings , id: \.1){ setting in
                    ProfileOptionRowView(imageName: setting.0, title: setting.1)
                }
                
            }.padding()
             
        }
    }
}

#Preview {
    ProfileView()
}
