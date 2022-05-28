# Core Services
  Contains domain logic, Api, gRpc connections, Read-write into Db

# 1. Prerequisites
  Using `Dotnet` version `5`
  Only run this project on terminal.
  
# 2. Local Development Workflow
  - Create folder `Shared` on `daisy-core-services` folder and put `appsettings.json` file (see below) into `Shared` folder
  ### 1. Launch Restful Api service:
  - Right click on `Api` project choose `Debug` -> `Run`
  ### 2. Launch gRPC service:
  - Right click on `Grpc` project choose `Debug` -> `Run`
  
  #### Expected result: both Api and Grpc are running on two window terminal.
  <img width="1434" alt="Pasted Graphic 1" src="https://user-images.githubusercontent.com/27767477/170809761-fe662e5f-9e25-493f-a48b-1ccaa740c6ae.png">

# 3. Environment Variables:

### Example of `appsettings.json` file
  {
      "DB_HOST_NAME": "agent.kobiton",
      "DB_PORT": "1533",
      "DB_NAME": "Daisy",
      "DB_USER": "SA",
      "DB_PASSWORD": "Password123",
      "API_PORT": 2433,
      "API_HOST": "localhost",
      "GRPC_HOST": "localhost",
      "GRPC_PORT": 50052,
      "PROTOCOL": "http",
      "LogLevel": "Warning",
      "AllowedHosts": "*"
  }

