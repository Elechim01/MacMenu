//
//  MenuView.swift
//  MacMenu
//
//  Created by Michele Manniello on 13/06/21.
//

import SwiftUI

struct MenuView: View {
//    For slide Animation...
    @Namespace var animation
//    Current Tab...
    @State var currentTab = "Uploads"
    var body: some View {
        VStack{
            HStack{
                TabButton(titile: "Help", currentTab: $currentTab, animation: animation)
                TabButton(titile: "Uploads", currentTab: $currentTab, animation: animation)
            }
            .padding(.horizontal)
            .padding(.top)
            Divider()
                .padding(.top,4)
            
                Image("box")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            HStack{
                Text("Export your artboards.....")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Button(action: {}, label: {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.primary)
                })
            }
            
            Spacer(minLength: 15)
            Divider()
                .padding(.bottom,2)
//            bottom View...
            HStack{
                Image("pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 25, height: 25)
                    .clipShape(Circle())
                Text("Cammell")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                Spacer(minLength: 0)
                Button(action: {}, label: {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(.primary)
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
//        Max menu Size...
//        your Own size...
        .frame(width: 250, height: 300)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
struct TabButton : View {
    var titile : String
    @Binding var currentTab : String
    var animation : Namespace.ID
    var body: some View{
        Button(action: {
            withAnimation {
                currentTab = titile
            }
        }, label: {
            Text(titile)
                .font(.callout)
                .fontWeight(.bold)
//                For Dark Mode Adoption...
                .foregroundColor(currentTab == titile ? .white : .primary)
                .padding(.vertical,4)
                .frame(maxWidth: .infinity)
                .background(
                    ZStack{
                        if currentTab == titile{
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.blue)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }else{
//                            Primay border...
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.primary,lineWidth: 0.6)
                        }
                    }
                )
                .contentShape(RoundedRectangle(cornerRadius: 4))
        })
        .buttonStyle(PlainButtonStyle())
    }
}
