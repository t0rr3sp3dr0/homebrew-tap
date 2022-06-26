cask "protoc-gen-grpc-java" do
  arch = Hardware::CPU.intel? ? "x86_64" : "aarch_64"

  version "1.47.0"
  sha256 "bfc05f91b8502888da995739290ce82f5269290f806f9c58a5bc986f814d9aa0"

  url "https://repo1.maven.org/maven2/io/grpc/protoc-gen-grpc-java/#{version}/protoc-gen-grpc-java-#{version}-osx-#{arch}.exe",
      verified: "repo1.maven.org/maven2/io/grpc/protoc-gen-grpc-java/#{version}/"
  name "Protoc Gen GRPC Java"
  desc "Protoc plugin for gRPC Java"
  homepage "https://github.com/grpc/grpc-java/tree/master/compiler"

  livecheck do
    url "https://repo1.maven.org/maven2/io/grpc/protoc-gen-grpc-java/maven-metadata.xml"
    regex(%r{<release>(\d+(?:\.\d+)*)</release>}i)
  end

  binary "protoc-gen-grpc-java-#{version}-osx-#{arch}.exe",
         target: "protoc-gen-grpc-java"
end
