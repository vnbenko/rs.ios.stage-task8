#import <UIKit/UIKit.h>
#import "ColorDelegate.h"
#import "AppendingViewController.h"
#import "PaintingView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ColorViewController : AppendingViewController <ColorDelegate>

@property (strong, nonatomic) PaintingView *mainPaintView;

@end

NS_ASSUME_NONNULL_END
