//
//  ContentView.swift
//  Loudcar
//
//  Created by Karthik on 26/04/21.
//

import SwiftUI

struct HomeView: View {
    @State var isBluetoothOn = false
    @State var previewText = "PREVIEW"
    @State var pickerIndex = 0
    @State var speedValue = 0.0
    @State var brightnessValue = 0.0
    @State var isReverseTextToggled = false
    @State var isBorderToggled = false
    @State var isFlashToggled = false
    @State var directionSelectionIndex = 0
    @State var bottomNavSelectedItemIndex = 0
    
    let fontsArray = ["Default", "San Serif", "Poppins", "Arial", "Avenir"]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack {
                    HStack {
                        Toggle(isOn: $isBluetoothOn, label: {
                            Text("Bluetooth")
                        })
                        .frame(maxWidth: 135)
                        .padding(EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12))
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.black, lineWidth: 2)
                        )
                        .padding(.leading)
                        Spacer()
                        Button(action: {}, label: {
                            Text("Find device")
                                .fontWeight(.medium)
                        }).padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                        .background(Color(hex: "#7552A0"))
                        .foregroundColor(.white)
                        .cornerRadius(4)
                        .padding(.trailing)
                    }
                    .padding(.top, 24)
                    
                    ZStack {
                        Text(previewText)
                            .font(Font.custom("AdvancedDotDigital-7", size: 32, relativeTo: .title))
                            .foregroundColor(Color(hex: "#BDAA4A"))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(8)
                    .padding()
                    
                    HStack {
                        Text("FONT FAMILY").fontWeight(.semibold).padding(.leading).foregroundColor(.white)
                        Picker(selection: $pickerIndex, label: Text(fontsArray[pickerIndex]).padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)).frame(maxWidth: .infinity, alignment: .leading).background(Color.white).foregroundColor(.black).cornerRadius(8).padding(8)) {
                            Text("Default").tag(1)
                            Text("San Serif").tag(2)
                            Text("Poppins").tag(3)
                            Text("Avenir").tag(4)
                            Text("Arial").tag(5)
                        }.pickerStyle(MenuPickerStyle())
                        
                        Image(systemName: "chevron.down")
                            .padding(12)
                            .background(Color.white)
                            .clipShape(Circle())
                            .padding(.trailing, 12)
                    }
                    .background(Color(hex: "#7552A0"))
                    .cornerRadius(8)
                    .padding(EdgeInsets(top: -8, leading: 16, bottom: 16, trailing: 16))
                    
                    VStack(alignment: .leading) {
                        Text("SPEED").padding(.top, 8).padding(.leading, 16)
                        HStack {
                            Image(systemName: "chevron.left").padding()
                            Slider(value: $speedValue, in: 1...8, onEditingChanged: {_ in
                                
                            })
                            Image(systemName: "chevron.right").padding()
                        }
                    }.overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color(hex: "#7552A0"), lineWidth: 2)
                    ).padding(.leading)
                    .padding(.trailing)
                    
                    VStack(alignment: .leading) {
                        Text("BRIGHTNESS").padding(.top, 8).padding(.leading, 16)
                        HStack {
                            Image(systemName: "chevron.left").padding()
                            Slider(value: $brightnessValue, in: 1...8, onEditingChanged: {_ in
                                
                            })
                            Image(systemName: "chevron.right").padding()
                        }
                    }.overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color(hex: "#7552A0"), lineWidth: 2)
                    ).padding(.leading)
                    .padding(.trailing)
                    .padding(.top, 8)
                    
                    HStack {
                        Text("REVERSE TEXT").padding(.leading)
                        Spacer()
                        Toggle("", isOn: $isReverseTextToggled).padding(8)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color(hex: "#7552A0"), lineWidth: 2)
                    ).padding(.leading)
                    .padding(.trailing)
                    .padding(.top, 8)
                    
                    HStack {
                        Text("BORDER").padding(.leading)
                        Spacer()
                        Toggle("", isOn: $isBorderToggled).padding(8)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color(hex: "#7552A0"), lineWidth: 2)
                    ).padding(.leading)
                    .padding(.trailing)
                    .padding(.top, 8)
                    
                    HStack {
                        Text("FLASH").padding(.leading)
                        Spacer()
                        Toggle("", isOn: $isFlashToggled).padding(8)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color(hex: "#7552A0"), lineWidth: 2)
                    ).padding(.leading)
                    .padding(.trailing)
                    .padding(.top, 8)
                    
                    HStack {
                        Text("DIRECTION").padding(.leading)
                        Spacer()
                        Image(systemName: "chevron.left")
                            .padding(8)
                            .background(self.getBackgroundColorForDirectionArrow(arrowIndex: 0))
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .padding(.top, 8)
                            .padding(.bottom, 8)
                        
                        Image(systemName: "chevron.right")
                            .padding(8)
                            .background(self.getBackgroundColorForDirectionArrow(arrowIndex: 1))
                            .foregroundColor(.white)
                            .clipShape(Circle())
                        
                        Image(systemName: "chevron.up")
                            .padding(9)
                            .background(self.getBackgroundColorForDirectionArrow(arrowIndex: 2))
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .padding(.leading, -2)
                            .padding(.trailing, -2)
                        
                        Image(systemName: "chevron.down")
                            .padding(9)
                            .background(self.getBackgroundColorForDirectionArrow(arrowIndex: 3))
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .padding(.leading, -2)
                            .padding(.trailing, -2)
                            .padding(.trailing)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color(hex: "#7552A0"), lineWidth: 2)
                    ).padding(.leading)
                    .padding(.trailing)
                    .padding(.top, 8)
                    
                    Button(action: {}, label: {
                        Text("Send").fontWeight(.semibold)
                    }).padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24)).background(Color(hex: "#7552A0")).foregroundColor(.white).cornerRadius(24).padding().padding(.bottom, 72)
                }
                
            }.frame(maxHeight: .infinity, alignment: .top)
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                    HStack {
                        Image("loudcar-logo").resizable().frame(width: 32, height: 32)
                        Text("Loudcar").font(.headline).foregroundColor(Color(hex: "#7552A0"))
                    }
                }
            }
            
            HStack {
                Button(action: {}, label: {
                    Image("home").renderingMode(.template).resizable().frame(width: 24, height: 24).foregroundColor(self.getForegroundColorForNavItem(itemIndex: 0)).padding()
                })
                
                Button(action: {}, label: {
                    Image("microphone").renderingMode(.template).resizable().frame(width: 24, height: 24).foregroundColor(self.getForegroundColorForNavItem(itemIndex: 1)).padding()
                })
                
                Button(action: {}, label: {
                    Image("settings").renderingMode(.template).resizable().frame(width: 24, height: 24).foregroundColor(self.getForegroundColorForNavItem(itemIndex: 2)).padding()
                })
            }.background(Color(hex: "F2F2F2")).cornerRadius(32).padding(.bottom, 24)
        }
        .onAppear {
            UINavigationBar.appearance().barTintColor = UIColor.white
        }
    }
    
    func getBackgroundColorForDirectionArrow(arrowIndex: Int) -> Color {
        if (arrowIndex == directionSelectionIndex) {
            return Color(hex: "#7552A0")
        } else {
            return Color.gray
        }
    }
    
    func getForegroundColorForNavItem(itemIndex: Int) -> Color {
        if (itemIndex == bottomNavSelectedItemIndex) {
            return Color(hex: "#7552A0")
        } else {
            return Color.gray
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
