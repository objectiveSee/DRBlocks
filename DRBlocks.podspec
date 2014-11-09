Pod::Spec.new do |s|
  s.name     = 'DRBlocks'
  s.version  = '0.0.1'
  s.platform = :ios
  s.ios.deployment_target = '5.0'
  s.license  = 'MIT'
  s.summary  = 'Manage multiple Objective-C blocks easier.'
  s.homepage = 'https://github.com/objectiveSee/DRBlocks'
  s.author   = { "Danny Ricciotti" => "dan.ricciotti@gmail.com" }

  s.source   = { :git => 'https://github.com/objectiveSee/DRBlocks.git', :commit => "44a9fac4b494c8a439eaf0547486a2da941447d4"}
  s.source_files = 'DRBlocks/DRBlocks.*'

  s.requires_arc = true
end
