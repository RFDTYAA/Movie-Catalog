import Foundation

public struct Movie: Identifiable {
    public let id: Int
    public let title: String
    public let posterPath: String?
    public let overview: String?
    public let releaseDate: String?
    public let rating: Double?

    // Initializer juga harus public
    public init(id: Int, title: String, posterPath: String?, overview: String?, releaseDate: String?, rating: Double?) {
        self.id = id
        self.title = title
        self.posterPath = posterPath
        self.overview = overview
        self.releaseDate = releaseDate
        self.rating = rating
    }
}
