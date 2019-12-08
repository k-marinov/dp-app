class ServiceProvider { //ServiceProviding

    private var instances = [String: Service]()

    func register<SERVICE: Service>() -> SERVICE {
        let key: String = "\(SERVICE.self)"
        guard let service = instances[key] as? SERVICE else {
            return instance(key: key)
        }
        return service
    }

    private func instance<SERVICE: Service>(key: String) -> SERVICE {
        let service = SERVICE()
        instances[key] = service
        return service
    }

}
