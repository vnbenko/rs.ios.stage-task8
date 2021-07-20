#import "ColorViewController.h"
#import "ColorButton.h"
#import "UIButton+Highlighted.h"

@interface ColorViewController ()

@end

@implementation ColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupColor];
}

- (void)setupColor {
    ColorButton *red = [[ColorButton alloc] initWithFrame:CGRectMake(17, 92, 40, 40) andColor:[UIColor colorNamed:@"rsRed"]];
    red.delegate = self;
    
    ColorButton *blue = [[ColorButton alloc] initWithFrame:CGRectMake(77, 92, 40, 40) andColor:[UIColor colorNamed:@"rsBlue"]];
    blue.delegate = self;
    
    ColorButton *green = [[ColorButton alloc] initWithFrame:CGRectMake(137, 92, 40, 40) andColor:[UIColor colorNamed:@"rsGreen"]];
    green.delegate = self;
    
    ColorButton *grey = [[ColorButton alloc] initWithFrame:CGRectMake(197, 92, 40, 40) andColor:[UIColor colorNamed:@"rsGray"]];
    grey.delegate = self;
    
    ColorButton *purple = [[ColorButton alloc] initWithFrame:CGRectMake(257, 92, 40, 40) andColor:[UIColor colorNamed:@"rsPurple"]];
    purple.delegate = self;
    
    ColorButton *orange = [[ColorButton alloc] initWithFrame:CGRectMake(317, 92, 40, 40) andColor:[UIColor colorNamed:@"rsOrange"]];
    orange.delegate = self;
    
    ColorButton *yellow = [[ColorButton alloc] initWithFrame:CGRectMake(17, 152, 40, 40) andColor:[UIColor colorNamed:@"rsYellow"]];
    yellow.delegate = self;
    
    ColorButton *lightBlue = [[ColorButton alloc] initWithFrame:CGRectMake(77, 152, 40, 40) andColor:[UIColor colorNamed:@"rsLightBlue"]];
    lightBlue.delegate = self;
    
    ColorButton *pink = [[ColorButton alloc] initWithFrame:CGRectMake(137, 152, 40, 40) andColor:[UIColor colorNamed:@"rsPink"]];
    pink.delegate = self;
    
    ColorButton *black = [[ColorButton alloc] initWithFrame:CGRectMake(197, 152, 40, 40) andColor:[UIColor colorNamed:@"sortOfRsBlack"]];
    black.delegate = self;
    
    ColorButton *darkGreen = [[ColorButton alloc] initWithFrame:CGRectMake(257, 152, 40, 40) andColor:[UIColor colorNamed:@"rsDarkGreen"]];
    darkGreen.delegate = self;
    
    ColorButton *brown = [[ColorButton alloc] initWithFrame:CGRectMake(317, 152, 40, 40) andColor:[UIColor colorNamed:@"rsBrown"]];
    brown.delegate = self;
    
    [self.view addSubview:red];
    [self.view addSubview:blue];
    [self.view addSubview:green];
    [self.view addSubview:grey];
    [self.view addSubview:purple];
    [self.view addSubview:orange];
    [self.view addSubview:yellow];
    [self.view addSubview:lightBlue];
    [self.view addSubview:pink];
    [self.view addSubview:black];
    [self.view addSubview:darkGreen];
    [self.view addSubview:brown];
}

- (void)saveColorArray:(UIButton *)sender {
    if ([self.mainPaintView.colorPalette containsObject:sender]) {
        [UIView animateWithDuration:0.3 animations:^{
            [sender setDefaultColor:sender.backgroundColor];
            [self.view setBackgroundColor:[UIColor whiteColor]];
        }];
        [self.mainPaintView.colorPalette removeObject:sender];
        [self.view setBackgroundColor:[UIColor whiteColor]];
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            [sender setHighlightedColorButton];
        }];
        [self.mainPaintView.colorPalette addObject:sender];
        if (self.mainPaintView.colorPalette.count == 4) {
            [self.mainPaintView.colorPalette.firstObject setDefaultColor:self.mainPaintView.colorPalette.firstObject.backgroundColor];
            [self.mainPaintView.colorPalette removeObject:self.mainPaintView.colorPalette.firstObject];
        }
        [UIView animateWithDuration:0.3 animations:^{
            self.view.backgroundColor = sender.backgroundColor;
        }];
    }
}


@end
