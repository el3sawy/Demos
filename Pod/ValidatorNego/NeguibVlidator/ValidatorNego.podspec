
Pod::Spec.new do |spec|

  spec.name         = "ValidatorNego"
  spec.version      = "1.0.0"
  spec.summary      = "This framework to make validation for any from you need like login or register"
  
  spec.description  = "Good framework to make you code is faster and easily and save effort for validation "

  spec.homepage     = "https://github.com/el3sawy/ValidatorNego"
   

  spec.license      = "MIT"

  spec.author             = { "el3sawy" => "ahmedmaelesawy@gmail.com" }
  

  spec.platform     = :ios, "14.0"

  spec.source       = { :git => "https://github.com/el3sawy/ValidatorNego.git", :tag => spec.version.to_s }



  spec.source_files  = "NeguibVlidator/**/*.{swift}"
  spec.swift_versions = "5.0"
end
