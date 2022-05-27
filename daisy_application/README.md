# Daisy application
  Include Mobile (Android, iOS) and Web
  
# 1. Prerequisites
  It recommend to run this Flutter project on VsCode for easier to setup Environment variables.
  If you have any trouble when setup Flutter with VsCode, please ask TienDang to get a tutorial of Flutter on Udemy
# 2. Local Development Workflow
  ### How to run:
  1. Create `launch.json` on Visual Studio Code by clicking on `Run and Debug` tab, click on create `launch.json` file if not exist.
  2. Edit the launch.json file as below to add environment variables.
  3. Run the project with the profile we already defined in `launch.json`.
  ### Other commands:
  1. `flutter analyze`: Run linter to detect error, required to run this command before you make the pull request.
  2. `flutter pub run build_runner build`: Code auto generation for `Retrofit` library.
  
  ### Example `launch.json file`
    {
      "version": "0.2.0",
      "configurations": [
          {
              "name": "daisy_application (debug mode)",
              "request": "launch",
              "type": "dart",
              "program": "lib/pages/main.dart",
              "flutterMode": "debug",
              "args": [
                  "--dart-define=API_HOST=10.0.2.2", // 10.0.2.2 android emulator, localhost for web development
                  "--dart-define=API_PORT=2433",
                  "--dart-define=PROTOCOL=http",
                  "--dart-define=GRPC_HOST=10.0.2.2",
                  "--dart-define=GRPC_PORT=50052",
                  "--dart-define=ENVIRONMENT=dev"
              ],
          }
      ]
    }
    
# 3. Environment Variables
  ### 1. API_HOST: The host of Restful Api service to connect, for local development: 
   - Use `10.0.2.2` when run on Android Emulator
   - Use `localhost` when run on Web brower
  ### 2. API_PORT: The port of Restful Api service
  ### 3. PROTOCOL: 
   - `http` or `https`, it is `http` by default
  ### 4. GRPC_HOST: The host of gRPC service 
   - Use `10.0.2.2` when run on Android Emulator
   - Use `localhost` when run on Web brower
  ### 5.GRPC_PORT: The port of gRPC service
  
