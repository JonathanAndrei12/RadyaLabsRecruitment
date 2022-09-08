//
//  Food.swift
//  RadyaLabs Recruitment
//
//  Created by Jonathan Andrei on 08/09/22.
//

/*
 JSON Data
 
 {"name":"Capcay",
 "image":"https://i.ibb.co/6yZmcck/capcay.jpg",
 "desc":"1 buah Dada ayam, suwir-suwir\n5 buah Bakso ikan , belah dua\n200 gram Udang,bersihkan & kupas\n5 lembar Daun kol,potong-potong\n5 helai Sawi caisim,potong-potong\n2 buah jagung muda\n2 batang wortel,iris tipis\n3 buah jagung muda, potong memanjang\nBrokoli secukupnya,potong-potong kecil\n2 buah Tomat,iris\n1 siung bawang putih\n1 buah bawang bombay,iris sesuai selera\nBumbu lainnya seperti garam, lada, gula dan saus tiram secukupnya"}
 
 */

import Foundation

struct Food: Codable, Identifiable {
    let id: UUID = UUID()
    let name: String
    let imageURL: String
    let desc: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case imageURL = "image"
        case desc = "desc"
    }
}
