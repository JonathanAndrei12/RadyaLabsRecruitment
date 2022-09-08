//
//  ListFoodsView.swift
//  RadyaLabs Recruitment
//
//  Created by Jonathan Andrei on 08/09/22.
//

import SwiftUI

struct ListFoodsView: View {
    @StateObject var listFoodsVM = ListFoodsViewModel()
    @StateObject var networkObs = NetworkObservers()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("ViewBackground")
                    .edgesIgnoringSafeArea(.all)
                
                if networkObs.connected {
                    ScrollView {
                        Text("Pick your favourite food!\nGet to know how to cook it!")
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .padding(.top, 10)
                        
                        VStack {
                            ForEach(listFoodsVM.foodsArr, id: \.id) { food in
                                FoodCard(food: food)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                } else {
                    VStack {
                        Image(systemName: "wifi.exclamationmark")
                            .resizable()
                            .frame(width: 100, height: 80)
                        
                        Text("No connection mate!\nPlease connect to the internet.")
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .padding(.top, 10)
                    }
                }
            }
            .navigationTitle("List Foods")
        }
        .onAppear {
            networkObs.checkConnection()
        }
        .onChange(of: networkObs.connected) { val in
            if val {
                listFoodsVM.fetchAPICall()
            }
        }
        .alert(isPresented: $listFoodsVM.isError) {
            Alert(
                title: Text("Error"),
                message: Text(listFoodsVM.errMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct ListFoodsView_Previews: PreviewProvider {
    static var previews: some View {
        ListFoodsView()
    }
}
