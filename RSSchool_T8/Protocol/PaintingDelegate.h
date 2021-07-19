#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PaintingDelegate <NSObject>

- (void)isDrawing:(BOOL)check;

@end

NS_ASSUME_NONNULL_END
