#import <UIKit/UIKit.h>
#import "PaintingDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface StartViewController : UIViewController <PaintingDelegate>

@property (weak, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UIButton *drawButton;

@end

NS_ASSUME_NONNULL_END
