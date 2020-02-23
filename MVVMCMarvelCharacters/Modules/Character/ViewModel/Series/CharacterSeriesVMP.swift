protocol CharacterSeriesVMP: CharacterRepresentable {
    var viewDelegate: PaginableViewDelegate? { get set }
    var service: SeriesServiceP? { get }
    var items: [Series] { get }
    
    func loadSeries()
}
