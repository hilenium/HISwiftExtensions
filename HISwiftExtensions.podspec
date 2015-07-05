#
# Be sure to run `pod lib lint HISwiftExtensions.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "HISwiftExtensions"
  s.version          = "0.1.0"
  s.summary          = "This is a library of some useful Swift extensions developed while building the hilenium.com iOS app"
  s.description      = <<-DESC
                        This is a library of some useful Swift extensions developed while building the [Hilenium] (http://hilenium.com) iOS Phone application.
                       DESC
  s.homepage         = "https://github.com/hilenium/HISwiftExtensions"
  s.license          = 'MIT'
  s.author           = { "Matthew Clarkson" => "matt@hilenium.com" }
  s.source           = { :git => "https://github.com/hilenium/HISwiftExtensions.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/matt_clarkson'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'HISwiftExtensions' => ['Pod/Assets/*.png']
  }

end
