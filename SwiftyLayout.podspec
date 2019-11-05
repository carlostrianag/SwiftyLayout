#
# Be sure to run `pod lib lint SwiftyLayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftyLayout'
  s.version          = '0.1.0'
  s.summary          = 'For all those AutoLayout lovers, these are constraints made easy.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  'SwiftyLayout is a sugar syntax set of statements that will make dealing with AutoLayout constraints a lot easier. Just give it a taste.'
                       DESC

  s.homepage         = 'https://github.com/carlostrianag/SwiftyLayout'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'carlostrianag' => 'trianag24@gmail.com' }
  s.source           = { :git => 'https://github.com/carlostrianag/SwiftyLayout.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  s.source_files = 'SwiftyLayout/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SwiftyLayout' => ['SwiftyLayout/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
