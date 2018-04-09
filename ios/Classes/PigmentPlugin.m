#import "PigmentPlugin.h"
#import <pigment/pigment-Swift.h>

@implementation PigmentPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPigmentPlugin registerWithRegistrar:registrar];
}
@end
