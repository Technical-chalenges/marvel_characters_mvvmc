protocol CharacterVMP: BaseVMP {
    var character: Character { get }
    var name: String? { get }
    var sections: [CharacterRepresentable] { get }
}
