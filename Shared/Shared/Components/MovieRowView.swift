import SwiftUI
import Core

public struct MovieRowView: View {
    let movie: Movie
    let isFavorite: Bool
    var showFavoriteButton: Bool = true
    var onToggleFavorite: () -> Void

    // Initializer juga harus public
        public init(movie: Movie, isFavorite: Bool, showFavoriteButton: Bool = true, onToggleFavorite: @escaping () -> Void) {
            self.movie = movie
            self.isFavorite = isFavorite
            self.showFavoriteButton = showFavoriteButton
            self.onToggleFavorite = onToggleFavorite
        }
    
    public var body: some View {
        HStack(spacing: 16) {
          
            AsyncImage(
                url: URL(string: Constants.imageBaseURL + (movie.posterPath ?? "")),
                transaction: Transaction(animation: .easeInOut(duration: 0.3))
            ) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                } else if phase.error != nil {
                    Image("placeholder_poster")
                        .resizable()
                        .scaledToFill()
                        .background(Color.theme.secondaryText.opacity(0.3))
                } else {
                    Image("placeholder_poster")
                        .resizable()
                        .scaledToFill()
                        .background(Color.theme.secondaryText.opacity(0.3))
                }
            }
            .frame(width: 80, height: 120)
            .cornerRadius(12)
     
            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.primaryText)
                    .lineLimit(2)
                
                if let rating = movie.rating, rating > 0 {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.theme.accent)
                        Text(String(format: "%.1f", rating))
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(Color.theme.secondaryText)
                    }
                }

                Text(movie.overview ?? "No overview available.")
                    .font(.caption)
                    .lineLimit(3)
                    .foregroundColor(Color.theme.secondaryText)
            }

            Spacer()

            if showFavoriteButton {
                Button(action: onToggleFavorite) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(isFavorite ? .red : .gray)
                        .font(.title2)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(12)
        .background(Color.theme.surface)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 4)
    }
}
