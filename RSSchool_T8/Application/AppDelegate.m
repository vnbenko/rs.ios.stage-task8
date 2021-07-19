#import "AppDelegate.h"
#import "StartViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    UIViewController *startVC = [StartViewController new];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:startVC];
    [self.window setRootViewController:navVC];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
