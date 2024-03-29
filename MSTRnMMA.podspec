Pod::Spec.new do |spec|
  spec.name = "MSTRnMMA"
  spec.version = "1.0.8"
  spec.summary = "MMA LOAD"
  spec.homepage = "https://github.com/fanlilinSaber/MSTRnMMA"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "Fan Li Lin" => 'fanlilin@i-focusing.com' }
  spec.platform = :ios, "9.0"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/fanlilinSaber/MSTRnMMA.git", tag: spec.version, submodules: true }
  spec.public_header_files = "Sources/MSTRnMMA.h"
  spec.source_files = "Sources/MSTRnMMA.h"
  spec.resources = "Sources/*.bundle"
  
  spec.subspec "Commmand" do |ss|
    ss.source_files = "Sources/Commmand/**/*"
  end
  
  spec.subspec "UI" do |ss|
    ss.source_files = "Sources/UI/**/*"
  end
  
  spec.subspec "Manager" do |ss|
    ss.source_files = "Sources/Manager/**/*"
  end
  
  spec.dependency "React"
end
