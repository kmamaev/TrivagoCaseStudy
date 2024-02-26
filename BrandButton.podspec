Pod::Spec.new do |spec|
  spec.name         = "BrandButton"
  spec.version      = "1.0.0"
  spec.summary      = "Design System Framework with a BrandButton"
  spec.homepage     = "https://github.com/kmamaev/TrivagoCaseStudy"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Konstantin Mamaev" => "kostya.plhs@gmail.com" }
  spec.source       = { :git => "https://github.com/kmamaev/TrivagoCaseStudy.git", :tag => "#{spec.version}" }
  spec.platforms    = { :ios => "17.0" }
  spec.source_files = "TrivagoCaseStudy/**/*.{swift,objc}"
end
