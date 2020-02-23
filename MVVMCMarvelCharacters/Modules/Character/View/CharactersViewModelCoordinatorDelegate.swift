protocol CharactersViewModelCoordinatorDelegate: AnyObject {
    func didSelect(viewModel: CharactersVMP, character: Character)
    func didFinish(viewModel: CharactersVMP)
}
