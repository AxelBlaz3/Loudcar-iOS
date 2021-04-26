//
//  SettingsView.swift
//  Loudcar
//
//  Created by Karthik on 26/04/21.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            NavigationLink(
                destination: Text("Destination"),
                label: {
                    Button(action: {}, label: {
                        HStack {
                            Text("Find Devices").fontWeight(.semibold)
                            Spacer()
                            Image(systemName: "chevron.right")
                        }.padding()
                    })
                })
            
            NavigationLink(
                destination: Text("Destination"),
                label: {
                    Button(action: {}, label: {
                        HStack {
                            Text("Text Animation").fontWeight(.semibold)
                            Spacer()
                            Image(systemName: "chevron.right")
                        }.padding()
                    })
                })
            
            NavigationLink(
                destination: Text("Destination"),
                label: {
                    Button(action: {}, label: {
                        HStack {
                            Text("Font Style").fontWeight(.semibold)
                            Spacer()
                            Image(systemName: "chevron.right")
                        }.padding()
                    })
                })
            
            NavigationLink(
                destination: Text("Destination"),
                label: {
                    Button(action: {}, label: {
                        HStack {
                            Text("Effects").fontWeight(.semibold)
                            Spacer()
                            Image(systemName: "chevron.right")
                        }.padding()
                    })
                })
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Reset All")
                    .fontWeight(.medium)
            }).padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(24)
            .padding(.top)
        }
        .navigationBarTitle("Settings")
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
