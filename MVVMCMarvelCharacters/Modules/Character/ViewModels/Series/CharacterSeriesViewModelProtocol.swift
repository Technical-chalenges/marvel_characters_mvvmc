protocol CharacterSeriesViewModelProtocol: CharacterRepresentable {
    var paginableViewDelegate: PaginableViewDelegate? { get set }
    var service: SeriesServiceProtocol? { get }
    var items: [Series] { get }
    
    func loadSeries()
}
