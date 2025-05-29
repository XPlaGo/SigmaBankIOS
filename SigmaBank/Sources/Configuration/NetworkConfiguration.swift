struct NetworkConfiguration {
    
    static let grpcServer = ClientConfig(
        host: "localhost",
        port: 8082)
    
    static let bdHost = ClientConfig(
        host: "http://localhost",
        port: 8080)

}
