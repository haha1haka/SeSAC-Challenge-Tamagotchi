//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/07/24.
//

import Foundation

struct TamagotchiObjet {
    
    var name: String
    var image: [String]
    var description: String
    var identificationNumber: Int

    
//    var level: Int {
//        let measures = Int((rice / 5) + (water / 2))
//        if measures <= 1{
//            return 1
//        } else if measures > 1 && measures < 10 {
//            return measures / 10
//        } else {
//            return 10
//        }
//
//    }
}

struct TamagotchiInfo {
    
    static var tamagotchiObjects: [TamagotchiObjet] = [
        
        TamagotchiObjet(name: "1 다마고치",
                   image: ["1-1", "1-2","1-3","1-4","1-5","1-6","1-7","1-8","1-9"],
                   description: "저는 선인장 다마고치 입니다. 키는 2cm 몸무게는 150g이에요 성격은 소심하지만 마음은 따뜻해요. 열심히 잘 먹고 잘 클 자신은 있답니다. 반가워요 주인님!!!",
                   identificationNumber: 0),
        
        TamagotchiObjet(name: "2 다마고치",
                   image: ["2-1", "2-1", "2-2","2-3","2-4","2-5","2-6","2-7","2-8","2-9","2-9"],
                   description: "저는 선인장 다마고치 입니다. 키는 2cm 몸무게는 150g이에요 성격은 소심하지만 마음은 따뜻해요. 열심히 잘 먹고 잘 클 자신은 있답니다. 반가워요 주인님!!!",
                   identificationNumber: 1),
        
        TamagotchiObjet(name: "3 다마고치",
                   image: ["3-1", "3-1", "3-2","3-3","3-4","3-5","3-6","3-7","3-8","3-9","3-9"],
                   description: "저는 선인장 다마고치 입니다. 키는 2cm 몸무게는 150g이에요 성격은 소심하지만 마음은 따뜻해요. 열심히 잘 먹고 잘 클 자신은 있답니다. 반가워요 주인님!!!",
                   identificationNumber: 2),
        
        TamagotchiObjet(name: "따끔따끔 다마고치",
                   image: ["noImage"],
                   description: "저는 선인장 다마고치 입니다. 키는 2cm 몸무게는 150g이에요 성격은 소심하지만 마음은 따뜻해요. 열심히 잘 먹고 잘 클 자신은 있답니다. 반가워요 주인님!!!",
                   identificationNumber: 3)
        
    ]
    
}
