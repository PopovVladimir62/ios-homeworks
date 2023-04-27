//
//  Post.swift
//  Navigation
//
//  Created by Владимир on 06.04.2023.
//

import UIKit

struct Post {
    
    var author: String //  никнейм автора публикации
    var description: String //  текст публикации
    var image: String // имя картинки из каталога Assets.xcassets
    var likes: Int //  количество лайков
    var views: Int // - количество просмотров
}

extension Post {
    static func makeArray() -> [Post] {
        [
            Post(author: "AUTONEWS",
                 description: "«Это лучшая Lada в истории». Реакция иностранцев на новинку АвтоВАЗа",
                 image: "1",
                 likes: 356,
                 views: 2934),
            Post(author: "AUTONEWS",
                 description: "В России они запрещены. Самые роскошные премьеры автосалона в Шанхае",
                 image: "2",
                 likes: 221,
                 views: 1032),
            Post(author: "AUTONEWS",
                 description: "Главные премьеры автосалона в Шанхае. Они должны появиться в России",
                 image: "3",
                 likes: 408,
                 views: 2509),
            Post(author: "AUTONEWS",
                 description: "Запрет продавать автомобили и лишение прав. Главные вопросы про неявку",
                 image: "4",
                 likes: 0,
                 views: 14_250_000)
        ]
    }
}
