//
//  FoodDetailsView.swift
//  RadyaLabs Recruitment
//
//  Created by Jonathan Andrei on 09/09/22.
//

import SwiftUI

struct FoodDetailsView: View {
    var food: Food
    
    var body: some View {
        ZStack {
            Color("ViewBackground")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
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
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/4)
                    .shadow(radius: 5)
                    
                    Text(food.name)
                        .font(.title)
                        .fontWeight(.semibold)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .padding(.trailing, UIScreen.main.bounds.width * 1 / 4)
                    
                    VStack(alignment: .leading) {
                        Text("Ingredients")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.bottom, 5)
                        
                        Text(food.desc)
                    }
                    .padding(.all)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .background(Color("FoodCardBackground"))
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.top, 0)
                    .padding(.bottom)
                    .padding(.horizontal)
                }
            }
        }
        .navigationBarTitle("\(food.name) Details", displayMode: .inline)
    }
}

struct FoodDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetailsView(food: Food(name: "Mie Goreng Seafood", imageURL: "https://i.ibb.co/YDS22tX/mie-goreng-seafood.jpg", desc: "1 bungkus mie telur basah\n1 dada ayam, rebus dan suwir\n10 buah udang kupas\n1 butir telur\n5 lembar daun caisim\n2 lembar daun kol\nSegenggam kecambah atau tauge\n2 siung bawang putih\n2 sdm kecap manis\n1 sdm saus tiram\nGaram secukupnya\n2 sdm minyak goreng"))
    }
}
