protocol CharacterSeriesViewModelProtocol: BaseViewModelProtocol, CharacterRepresentable {
    var service: SeriesServiceProtocol? { get }
    var items: [Series] { get }
    
    func loadSeries()
}
