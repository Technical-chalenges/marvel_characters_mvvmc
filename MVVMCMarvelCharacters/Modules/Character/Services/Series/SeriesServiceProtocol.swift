protocol SeriesServiceProtocol {
    func fetchSeries(characterId: Int, offset: Int, limit: Int, _ completion: @escaping (Result<[Series], ServiceError>) -> Void)
}
