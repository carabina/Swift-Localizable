Pod::Spec.new do |s|
  s.name         = "Swift-Localizable"
  s.version      = "0.0.1"
  s.summary      = "Localize strings and Storyboard objects in different languages"
  s.homepage     = "https://github.com/CityTaxi/Swift-Localizable"
  s.license      = 'MIT'
  s.author       = "CityTaxi"
  s.source       = { :git => "https://github.com/CityTaxi/Swift-Localizable.git", :tag => "0.0.1" }
  s.platform     = :ios, '8.0'
  s.source_files = 'Swift-Localizable'
  s.frameworks   = 'UIKit'
  s.requires_arc = true
end