protocol CharacterInfoVMP: CharacterRepresentable {
    var thumbnail: Image? { get }
    var name: String? { get }
    var description: String? { get }
    var totalComics: Int { get }
    var totalSeries: Int { get }
}
