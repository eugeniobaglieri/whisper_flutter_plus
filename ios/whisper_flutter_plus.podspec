#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint whisper_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'whisper_flutter_plus'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter FFI plugin project.'
  s.description      = <<-DESC
A new Flutter FFI plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = {
    :file => '../LICENSE'
  }
  s.author           = {
    'Your Company' => 'email@example.com'
  }

  # This will ensure the source files in Classes/ are included in the native
  # builds of apps using this FFI plugin. Podspec does not support relative
  # paths, so Classes contains a forwarder C file that relatively imports
  # `../src/*` so that the C sources can be shared among all target platforms.
  s.dependency 'Flutter'
  s.source           = {
    :path => '.'
  }
  s.source_files = [
    'Classes/*.cpp',
    'Classes/json/*.{cpp,c,m}',
    'Classes/whisper.cpp/ggml.{h,c}',
    'Classes/whisper.cpp/whisper.{h,cpp}',
    'Classes/whisper.cpp/ggml-alloc.{h,c}',
    'Classes/whisper.cpp/ggml-backend.{h,c}',
    'Classes/whisper.cpp/ggml-quants.{h,c}',
    'Classes/whisper.cpp/coreml/*.{h,m,mm}'
  ]
  s.platform = :ios, '12.0'
  s.ios.deployment_target  = '12.0'
  #s.requires_arc = false
  s.frameworks = 'Accelerate', 'CoreML'
  s.exclude_files = 'Classes/whisper.cpp/ggml-cuda/common.cuh'
  s.compiler_flags= '-O3', '-DNDEBUG', '-DGGML_USE_ACCELERATE', '-DWHISPER_USE_COREML', '-DWHISPER_COREML_ALLOW_FALLBACK'
  
  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386'
  }
  s.swift_version = '5.0'
end
