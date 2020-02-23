protocol CharacterVMP {
    var character: Character { get }
    var coordinatorDelegate: CharacterCoordinatorViewModelDelegate? { get }
    var name: String? { get }
    var sections: [CharacterRepresentable] { get }
    func didFinish()
}
