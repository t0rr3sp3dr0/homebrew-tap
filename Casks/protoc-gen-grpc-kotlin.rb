module ::Cask
  module Artifact
    class Binary
      def install_phase(**options)
        if source.extname == ".jar"
          cask.staged_path.write_jar_script source,
                                            source.basename.sub_ext(".sh")

          @source = source.sub_ext(".sh")
        end

        super(**options)
      end
    end
  end
end

cask "protoc-gen-grpc-kotlin" do
  version "1.3.0"
  sha256 "0d7af46429dfaeba68da47789326fe38ee81942d1243de2f5290768e74af2840"

  url "https://repo1.maven.org/maven2/io/grpc/protoc-gen-grpc-kotlin/#{version}/protoc-gen-grpc-kotlin-#{version}-jdk8.jar",
      verified: "repo1.maven.org/maven2/io/grpc/protoc-gen-grpc-kotlin/#{version}/"
  name "GRPC Kotlin Compiler"
  desc "GRPC Kotlin protoc compiler plugin"
  homepage "https://github.com/grpc/grpc-kotlin/tree/master/compiler"

  livecheck do
    url "https://repo1.maven.org/maven2/io/grpc/protoc-gen-grpc-kotlin/maven-metadata.xml"
    regex(%r{<release>(\d+(?:\.\d+)*)</release>}i)
  end

  binary "protoc-gen-grpc-kotlin-#{version}-jdk8.jar",
         target: "protoc-gen-grpc-kotlin"
end
