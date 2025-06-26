import Combine
import Foundation

class MovieRepositoryImpl: MovieRepository {
  private let remote: RemoteDataSourceProtocol
  private let local: LocalDataSourceProtocol

  init(remote: RemoteDataSourceProtocol, local: LocalDataSourceProtocol) {
    self.remote = remote; self.local = local
  }

  func fetchPopularMovies() -> AnyPublisher<[Movie], Error> {
    remote.fetchPopular()
      .map { $0.map(ModelMapper.map(response:)) }
      .eraseToAnyPublisher()
  }

  func fetchMovieDetail(id: Int) -> AnyPublisher<Movie, Error> {
    remote.fetchDetail(id: id)
      .map(ModelMapper.map(detail:))
      .eraseToAnyPublisher()
  }

  func getFavoriteMovies() -> AnyPublisher<[Movie], Error> {
    local.getFavorites()
      .map { $0.map(ModelMapper.map(entity:)) }
      .eraseToAnyPublisher()
  }

  func addToFavorite(movie: Movie) { local.addFavorite(movie) }
  func removeFromFavorite(id: Int) { local.removeFavorite(id: id) }
}
