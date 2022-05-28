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

  #### 1. `DB_HOST_NAME`: The host name of MssqlDatabase
  #### 2. `DB_PORT`: The port of MssqlDatabase
  #### 3. `DB_NAME`: Database name, type `Daisy`
  #### 4. `DB_USER`: Authenticated database user name
  #### 5. `DB_PASSWORD`: Authenticated database user password
  #### 6. `API_PORT`: Port that you want the api service to running on
  #### 7. `API_HOST`: Host that you want the api service to running on
  #### 8. `GRPC_HOST`: Host that you want the gRPC service to running on
  #### 9. `GRPC_PORT`: Port that you want the gRPC service to running on (5 digits)
  #### 10. `Protocol`: `http` or `https`
  
  ### Example of `appsettings.json` file
    {
        "DB_HOST_NAME": "localhost",
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
