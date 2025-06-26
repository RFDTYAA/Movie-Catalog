import Foundation

struct MovieListResponse: Codable {
    let results: [MovieResponse]
}

struct MovieResponse: Codable {
    let id: Int
    let title: String
    let poster_path: String?
    let overview: String?
    let release_date: String?
    let vote_average: Double?
}

struct MovieDetailResponse: Codable {
    let id: Int
    let title: String
    let poster_path: String?
    let overview: String?
    let release_date: String?
    let vote_average: Double?
    let genres: [Genre]

    struct Genre: Codable {
        let id: Int
        let name: String
    }
}
