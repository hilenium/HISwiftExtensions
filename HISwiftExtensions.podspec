Pod::Spec.new do |s|

  s.name                = "HISwiftExtensions"
  s.version             = "0.3.4"
  s.summary             = "This is a library of some useful Swift extensions developed while building the hilenium.com iOS app"
  s.description         = <<-DESC
    This is a library of some useful Swift extensions developed while building the [Hilenium] (http://hilenium.com) iOS Phone application.
   DESC
  s.license             = { :type => "MIT", :file => "LICENSE" }
  s.author              = { "Matthew Clarkson" => "mpclarkson@gmail.com" }
  s.social_media_url    = "http://twitter.com/matt_clarkson"
  s.platform            = :ios, "8.0"
  s.requires_arc        = true
  s.source              = { :git => "https://github.com/hilenium/HISwiftExtensions.git", :tag => s.version.to_s }
  s.homepage            = 'https://github.com/hilenium/HISwiftExtensions'
  s.source_files        = 'Pod/Classes/**/*.{swift}'

end

