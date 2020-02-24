protocol CharacterSeriesVMP: CharacterRepresentable {
    var paginableViewDelegate: PaginableViewDelegate? { get set }
    var service: SeriesServiceP? { get }
    var items: [Series] { get }
    
    func loadSeries()
}
