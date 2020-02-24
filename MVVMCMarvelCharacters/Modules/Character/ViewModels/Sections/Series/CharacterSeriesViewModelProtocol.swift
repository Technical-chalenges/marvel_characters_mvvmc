protocol CharacterSeriesViewModelProtocol: BaseViewModelProtocol, CharacterSectionProtocol {
    var service: CharacterSeriesServiceProtocol? { get }
    var items: [Series] { get }
    
    func loadSeries()
}
