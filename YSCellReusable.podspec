#
# Be sure to run `pod lib lint YSCellReusable.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YSCellReusable'
  s.version          = '0.1.0'
  s.summary          = 'The library for tableview and collection cell registration.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  The library for tableview and collection cell registration.
                       DESC

  s.homepage         = 'https://github.com/peanutgao/YSCellReusable'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'peanutgao' => 'joseph0750@gmail.com' }
  s.source           = { :git => 'https://github.com/peanutgao/YSCellReusable.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.swift_version = '5.0'

  s.source_files = 'YSCellReusable/Classes/**/*'
  
  # s.resource_bundles = {
  #   'YSCellReusable' => ['YSCellReusable/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
