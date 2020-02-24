protocol CharacterViewModelProtocol: BaseViewModelProtocol {
    var character: Character { get }
    var name: String? { get }
    var sections: [CharacterRepresentable] { get }
}
