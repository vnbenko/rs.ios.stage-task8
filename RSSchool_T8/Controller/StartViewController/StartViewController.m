#import "StartViewController.h"
#import "UIButton+Highlighted.h"
#import "PaintingView.h"
#import "ColorViewController.h"
#import "RSSchool_T8-Swift.h"


@interface StartViewController ()

@property (strong, nonatomic) ColorViewController *colorVC;
@property (strong, nonatomic) PaintingView *myPaintingView;
@property (strong, nonatomic) TimerViewController *timerVC;
@property (strong, nonatomic) PaintingViewController *paintingVC;

@property (strong, nonatomic) UIButton *paletteButton;
@property (strong, nonatomic) UIButton *timerButton;
@property (strong, nonatomic) UIButton *shareButton;

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setTintColor:[UIColor colorNamed:@"Light Green Sea"]];
    self.paintingVC = [PaintingViewController new];
    self.colorVC = [ColorViewController new];
    self.timerVC = [TimerViewController new];
    [self setup];
}

- (void)setup {
    [self configureNavigationBar];
    [self configureButtons];
    
    self.myPaintingView = [[PaintingView alloc] initWithFrame:CGRectMake(38, 104, 300, 300)];
    self.colorVC.mainPaintView = self.myPaintingView;
    self.timerVC.mainPaintView = self.myPaintingView;
    self.paintingVC.mainPaintView = self.myPaintingView;
    self.paintingVC.delegate = self;
    self.myPaintingView.delegate = self;
    [self.view addSubview:self.myPaintingView];
    
}

- (void)configureNavigationBar {
    self.navigationItem.title = @"Artist";
    [self.navigationController.navigationBar setTitleTextAttributes:@{
        NSFontAttributeName:[UIFont fontWithName:@"Montserrat-Regular" size:17.0f]
    }];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Drawings"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(accessDrawings:)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{
        NSFontAttributeName:[UIFont fontWithName:@"Montserrat-Regular" size:17.0f] }
                                                          forState:UIControlStateNormal];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{
        NSFontAttributeName:[UIFont fontWithName:@"Montserrat-Regular" size:17.0f] }
                                                          forState:UIControlStateHighlighted];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorNamed:@"Light Green Sea"];
}

- (void)configureButtons {
    self.paletteButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 452, 163, 32)];
    self.drawButton = [[UIButton alloc] initWithFrame:CGRectMake(243, 452, 91, 32)];
    self.timerButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 504, 151, 32)];
    self.shareButton = [[UIButton alloc] initWithFrame:CGRectMake(239, 504, 95, 32)];
    
    [self.paletteButton setDefault];
    [self.timerButton setDefault];
    [self.drawButton setDisabled];
    [self.shareButton setDisabled];
    
    [self.paletteButton.layer setCornerRadius:10];
    [self.drawButton.layer setCornerRadius:10];
    [self.timerButton.layer setCornerRadius:10];
    [self.shareButton.layer setCornerRadius:10];
    
    [self.paletteButton setTitle:@"Open Palette" forState:UIControlStateNormal];
    [self.drawButton setTitle:@"Draw" forState:UIControlStateNormal];
    [self.timerButton setTitle:@"Timer" forState:UIControlStateNormal];
    [self.shareButton setTitle:@"Share" forState:UIControlStateNormal];
    
    [self.paletteButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Medium" size:18.0f]];
    [self.drawButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Medium" size:18.0f]];
    [self.timerButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Medium" size:18.0f]];
    [self.shareButton.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Medium" size:18.0f]];
    
    [self.paletteButton setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
    [self.drawButton setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
    [self.timerButton setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
    [self.shareButton setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
    
    [self.paletteButton addTarget:self action:@selector(openPalette:) forControlEvents:UIControlEventTouchUpInside];
    [self.drawButton addTarget:self action:@selector(drawPainting:) forControlEvents:UIControlEventTouchUpInside];
    [self.timerButton addTarget:self action:@selector(openTimer:) forControlEvents:UIControlEventTouchUpInside];
    [self.shareButton addTarget:self action:@selector(sharePainting:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.paletteButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [self.drawButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [self.timerButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [self.shareButton addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:self.paletteButton];
    [self.view addSubview:self.drawButton];
    [self.view addSubview:self.timerButton];
    [self.view addSubview:self.shareButton];
}

- (void)addContentController:(UIViewController *)content {
    [self addChildViewController:content];
    [self.view addSubview:content.view];
    content.view.frame = self.colorVC.view.frame;
    [content didMoveToParentViewController:self];
}

- (void)accessDrawings:(id)sender {
    [self.navigationController pushViewController:self.paintingVC animated:YES];
}

- (void)openPalette:(UIButton *)sender {
    [self addContentController:self.colorVC];
    [sender setDefault];
}

- (void)drawPainting:(UIButton *)sender {
    [sender setDefault];
    [self.myPaintingView setNeedsDisplay];
}

- (void)changeToResetButton:(BOOL)check {
    if (check) {
        [self.drawButton setTitle:@"Reset" forState:UIControlStateNormal];
        [self.drawButton addTarget:self action:@selector(resetDrawing) forControlEvents:UIControlEventTouchUpInside];
    } else {
        [self.drawButton setTitle:@"Draw" forState:UIControlStateNormal];
        [self.drawButton removeTarget:self action:@selector(resetDrawing) forControlEvents:UIControlEventTouchUpInside];
        [self.drawButton addTarget:self action:@selector(drawPainting:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)openTimer:(UIButton *)sender {
    [self addContentController:self.timerVC];
    [sender setDefault];
}

- (void)sharePainting:(UIButton *)sender {
    [sender setDefault];
    [self share:sender];
}

- (void)touchDown:(UIButton *)sender {
    [sender setHighlighted];
}

- (void)share:(UIButton *)sender {
    CGRect rect = [self.myPaintingView bounds];
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.myPaintingView.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSArray *activityItems = @[img];
    UIActivityViewController *activityViewControntroller = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activityViewControntroller.excludedActivityTypes = @[];
    activityViewControntroller.popoverPresentationController.sourceView = self.view;
    activityViewControntroller.popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height/4, 0, 0);
    [self presentViewController:activityViewControntroller animated:YES completion:nil];
}

- (void)isDrawing:(BOOL)check {
    float timeIntervalForProgress = 1.0/60.0;
    NSTimer *timerForProgress = [NSTimer scheduledTimerWithTimeInterval:timeIntervalForProgress
                                                                 target:self.myPaintingView
                                                               selector:@selector(changeStrokeEnd)
                                                               userInfo:nil
                                                                repeats:true];
    if (check) {
        [self.paletteButton setDisabled];
        [self changeToResetButton:YES];
        [self.timerButton setDisabled];
        [self.shareButton setDefault];
        [self.navigationController.navigationBar setUserInteractionEnabled:NO];
        self.navigationController.navigationBar.alpha = 0.5;
    } else {
        [timerForProgress invalidate];
        [self.paletteButton setDefault];
        [self changeToResetButton:NO];
        [self.timerButton setDefault];
        [self.navigationController.navigationBar setUserInteractionEnabled:YES];
        self.navigationController.navigationBar.alpha = 1;
    }
}

- (void)resetDrawing {
    self.myPaintingView.currentDrawing = @0;
    [self.paintingVC setAllButtonsDefault];
    [self isDrawing:NO];
    [self.shareButton setDisabled];
    [self.drawButton setDisabled];
}

@end
