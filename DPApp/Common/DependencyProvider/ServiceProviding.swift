protocol ServiceProviding {

    func register<SERVICE: Service>(provider: DependencyProviding) -> SERVICE

}
