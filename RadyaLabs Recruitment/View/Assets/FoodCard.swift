//
//  FoodCard.swift
//  RadyaLabs Recruitment
//
//  Created by Jonathan Andrei on 08/09/22.
//

import SwiftUI

struct FoodCard: View {
    var food: Food
    
    var body: some View {
        NavigationLink(destination: FoodDetailsView(food: food)) {
            HStack {
                HStack {
                    AsyncImage(
                        url: URL(string: food.imageURL),
                        content: { image in
                            image
                                .resizable()
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    .frame(width: 75, height: 75)
                    .cornerRadius(10)

                    Text(food.name)
                        .foregroundColor(Color("TextColor"))
                        .font(.headline)
                        .padding(.leading, 5)
                        .frame(width: 150, alignment: .leading)
                        .multilineTextAlignment(.leading)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.gray)
                    .padding(.trailing, 10)
            }
            .padding(.all, 10)
            .frame(minWidth: 0,maxWidth: .infinity, alignment: .leading)
            .background(Color("FoodCardBackground"))
            .cornerRadius(10)
            .padding(.vertical, 3)
            .shadow(radius: 3)
        }
    }
}

struct FoodCard_Previews: PreviewProvider {
    static var previews: some View {
        FoodCard(food: Food(name: "", imageURL: "", desc: ""))
    }
}
