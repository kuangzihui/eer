
#import "MainViewController.h"

@implementation MainViewController

@synthesize list = _list;

- (void)viewDidLoad
{
    //    NSString *stringContent = @"我们者\uE415\uE056\uE057\uE414\uE405\uE106";
    //
    //    CGSize contentSize = [stringContent sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(MAXFLOAT, 14)];
    //
    //    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, contentSize.width, 30)];
    //    [self.view addSubview:lable];
    //    [lable setFont:[UIFont systemFontOfSize:14]];
    //    lable.backgroundColor = [UIColor redColor];
    //    //lable.textAlignment = NSTextAlignmentCenter;
    //
    //    lable.text =stringContent;
    
    
    UIScrollView *emjonScorll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-200, SCREEN_WIDTH, 200)];
    emjonScorll.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:emjonScorll];
    
    
    int maxRow = 3;
    int maxCol = 24;
    CGFloat jiange = SCREEN_WIDTH/3;
    
    NSArray *_faces = [Emoji allEmoji];
    
    CGFloat itemWidth = emjonScorll.frame.size.width / 8;
    CGFloat itemHeight = emjonScorll.frame.size.height / maxRow;
    
    for (int row = 0; row < maxRow; row++) {
        for (int col = 0; col < maxCol; col++) {
            int index = row * maxCol + col;
            if (index < [_faces count]) {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                [button setBackgroundColor:[UIColor clearColor]];
                [button setFrame:CGRectMake(col * itemWidth, row * itemHeight, itemWidth-2, itemHeight-2)];
                [button.titleLabel setFont:[UIFont fontWithName:@"AppleColorEmoji" size:26.0]];
                [button setTitle: [_faces objectAtIndex:(row * maxCol + col)] forState:UIControlStateNormal];
                button.tag = row * maxCol + col;
                [button addTarget:self action:@selector(selected:) forControlEvents:UIControlEventTouchUpInside];
                //[self addSubview:button];
                [emjonScorll addSubview:button];
                
                
            }
            else{
                break;
            }
        }
    }

    
	[super viewDidLoad];
}

- (void)viewDidUnload
{
	[super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)butonTapped:(id)sender
{
	NSLog(@"You tapped on: %@", sender);

	[self performSegueWithIdentifier:@"ModalSegue" sender:sender];
}

@end
