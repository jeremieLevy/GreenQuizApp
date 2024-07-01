//
//  CustomTabView.swift
//  GreenQuiz
//
//  Created by Apprenant 106 on 27/06/2024.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var tabSelection: Int
    @Namespace private var animationNamespace
    
    let tabBarItems: [(image: String, title: String)] = [
        ("leaf", "Jardin"),
        ("doc.questionmark", "Quiz"),
        ("text.book.closed", "Recueil")
    ]
    
    var body: some View {
        ZStack{
            HStack {
                    Circle()
                        .frame(height: 65)
                        .foregroundStyle(Color(.secondarySystemBackground))
                        .shadow(radius: 2)
                        .padding(.horizontal, 25)
            
                    
                    Circle()
                            .frame(height: 65)
                            .foregroundStyle(Color(.secondarySystemBackground))
                            .shadow(radius: 2)
                        .padding(.horizontal, 25)
                
                    
                    
                    Circle()
                            .frame(height: 65)
                            .foregroundStyle(Color(.secondarySystemBackground))
                            .shadow(radius: 2)
                        .padding(.horizontal, 25)
                
                
            }
            
            HStack{
                ForEach(0..<3) { index in
                    Button {
                        tabSelection = index + 1
                    } label :{
                        VStack(spacing: 4){
                            Spacer()
                            
                            Image(systemName: tabBarItems[index].image).font(.system(size: 20))
                            
                            Text(tabBarItems[index].title).font(.system(size: 13))
                            
                            if index + 1 == tabSelection{
                                Capsule()
                                    .frame(height: 4)
                                    .foregroundStyle(.greeny)
                                    .matchedGeometryEffect(id: "SelecedTabId", in: animationNamespace)
                                    .offset(y:2)
                            } else {
                                Capsule()
                                    .frame(height: 4)
                                    .foregroundStyle(.clear)
                                    .offset(y:2)
                            }
                        }
                        .foregroundColor(index + 1 == tabSelection ? .greeny : .gray)
                    }
                }
                .frame(height: 65)
                .clipShape(Circle())
            }
            .padding(.horizontal)
        }
    }
    
    struct CustomTabView_Previews : PreviewProvider {
        static var previews: some View{
            CustomTabView(tabSelection: .constant(1))
                .previewLayout(.sizeThatFits)
                .padding(.vertical)
        }
    }
}

#Preview {
    CustomTabView(tabSelection: .constant(1))
}
