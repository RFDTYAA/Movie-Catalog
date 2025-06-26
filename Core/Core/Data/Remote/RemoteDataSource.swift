import Foundation
import Combine
import Alamofire

protocol RemoteDataSourceProtocol {
  func fetchPopular() -> AnyPublisher<[MovieResponse], Error>
  func fetchDetail(id: Int) -> AnyPublisher<MovieDetailResponse, Error>
}

class RemoteDataSource: RemoteDataSourceProtocol {
  private let api: TMDBAPIProtocol
  init(api: TMDBAPIProtocol) { self.api = api }
  
  func fetchPopular() -> AnyPublisher<[MovieResponse], Error> {
    return AF.request(api.popularURL())
      .publishDecodable(type: MovieListResponse.self)
      .value()
      .map(\.results)
      .mapError { $0 as Error }
      .eraseToAnyPublisher()
  }
  
  func fetchDetail(id: Int) -> AnyPublisher<MovieDetailResponse, Error> {
    return AF.request(api.detailURL(id: id)) 
      .publishDecodable(type: MovieDetailResponse.self)
      .value()
      .mapError { $0 as Error }
      .eraseToAnyPublisher()
  }
}
