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
        ("leaf", "Home"),
        ("doc.questionmark", "Quiz"),
        ("text.book.closed", "Recueil")
    ]
    
    var body: some View {
        ZStack{
            HStack {
                Circle()
                    .frame(height: 80)
                    .foregroundStyle(Color(.secondarySystemBackground))
                    .shadow(radius: 2)
                    .padding(.horizontal, 18)
                
                Circle()
                    .frame(height: 80)
                    .foregroundStyle(Color(.secondarySystemBackground))
                    .shadow(radius: 2)
                    .padding(.horizontal, 18)
            
                
                Circle()
                    .frame(height: 80)
                    .foregroundStyle(Color(.secondarySystemBackground))
                    .shadow(radius: 2)
                    .padding(.horizontal, 18)
            }
            
            HStack{
                ForEach(0..<3) { index in
                    Button {
                        tabSelection = index + 1
                    } label :{
                        VStack(spacing: 8){
                            Spacer()
                            
                            Image(systemName: tabBarItems[index].image)
                            
                            Text(tabBarItems[index].title)
                            
                            if index + 1 == tabSelection{
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundStyle(.blue)
                                    .matchedGeometryEffect(id: "SelecedTabId", in: animationNamespace)
                                    .offset(y:3)
                            } else {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundStyle(.clear)
                                    .offset(y:3)
                            }
                        }
                        .foregroundColor(index + 1 == tabSelection ? .blue : .gray)
                    }
                }
                .frame(height: 80)
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
