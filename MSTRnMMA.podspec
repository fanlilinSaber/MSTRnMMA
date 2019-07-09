Pod::Spec.new do |spec|
  spec.name = "MSTRnMMA"
  spec.version = "1.0.0"
  spec.summary = "MMA LOAD"
  spec.homepage = "http://git.oschina.net/i-focusing-app/MSTRnMMA"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "Fan Li Lin" => 'fanlilin@i-focusing.com' }
  spec.platform = :ios, "9.0"
  spec.requires_arc = true
  spec.source = { git: "https://git.oschina.net/i-focusing-app/MSTRnMMA.git", tag: spec.version, submodules: true }
  spec.source_files = "Sources/**/*.{h,m}"
  spec.resources = "Sources/*.bundle"
  spec.dependency "React"
end
