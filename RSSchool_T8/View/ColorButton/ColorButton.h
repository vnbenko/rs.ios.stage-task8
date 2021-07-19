#import <UIKit/UIKit.h>
#import "ColorDelegate.h"
#import "ColorViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ColorButton : UIButton

@property (weak, nonatomic) ColorViewController <ColorDelegate> *delegate;

- (instancetype)initWithFrame:(CGRect)frame andColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
