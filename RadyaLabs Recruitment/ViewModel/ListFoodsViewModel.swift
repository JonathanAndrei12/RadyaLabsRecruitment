//
//  ListFoodsViewModel.swift
//  RadyaLabs Recruitment
//
//  Created by Jonathan Andrei on 08/09/22.
//

import Foundation
import Alamofire

class ListFoodsViewModel: ObservableObject {
    let url: String = "https://playground-rest-api-vk3y7f3hta-et.a.run.app/foods"
    @Published var foodsArr: [Food] = []
    @Published var isError: Bool = false
    @Published var errMessage: String = ""
    
    func fetchAPICall() {
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) {[weak self] data, resp, err in
                if let error = err {
                    DispatchQueue.main.async {
                        self?.isError = true
                        self?.errMessage = error.localizedDescription
                    }
                } else {
                    if let data = data,
                        let foods = try? JSONDecoder().decode([Food].self, from: data) {
                            DispatchQueue.main.async {
                                self?.foodsArr = foods
                            }
                    } else {
                        DispatchQueue.main.async {
                            self?.isError = true
                            self?.errMessage = err?.localizedDescription ?? "Unexpected error, please restart your application or try again later."
                        }
                    }
                }
            }.resume()
        } else {
            print("URL not found")
        }
    }
}
