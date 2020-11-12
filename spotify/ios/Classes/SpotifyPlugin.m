#import "SpotifyPlugin.h"
#if __has_include(<spotify/spotify-Swift.h>)
#import <spotify/spotify-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "spotify-Swift.h"
#endif

@implementation SpotifyPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSpotifyPlugin registerWithRegistrar:registrar];
}
@end
