#import <UIKit/UIKit.h>
#import "StartViewController.h"
#import "PaintingDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface PaintingView : UIView

@property (weak, nonatomic) StartViewController <PaintingDelegate> *delegate;
@property (strong, nonatomic) NSMutableArray <UIButton *> *colorPalette;
@property (assign, nonatomic) NSNumber *currentDrawing;
@property (assign, nonatomic) float progress;

- (void)changeStrokeEnd;


@end

NS_ASSUME_NONNULL_END
