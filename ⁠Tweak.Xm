#import <UIKit/UIKit.h>

@interface HAMA_menu1882 : UIView
@property (nonatomic, strong) UIVisualEffectView *glassCard;
@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) UIButton *telegramButton;
@property (nonatomic, strong) UIButton *startGameButton;
@end

@implementation Kurd4UModMenu

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupMenu];
    }
    return self;
}

- (void)setupMenu {
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    self.glassCard = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    self.glassCard.frame = CGRectMake(0, 0, 220, 260);
    self.glassCard.center = self.center;
    self.glassCard.layer.cornerRadius = 20;
    self.glassCard.clipsToBounds = YES;
    self.glassCard.layer.borderWidth = 1.0;
    self.glassCard.layer.borderColor = [UIColor colorWithWhite:1.0 alpha:0.2].CGColor;
    [self addSubview:self.glassCard];

    self.logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 20, 100, 100)];
    self.logoImageView.layer.cornerRadius = 50; 
    self.logoImageView.clipsToBounds = YES;
    self.logoImageView.layer.borderWidth = 1.5;
    self.logoImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [self downloadImageFromURL:@"https://i.ibb.co/pr5k4zJj/IMG-1858.jpg" toImageView:self.logoImageView];
    [self.glassCard.contentView addSubview:self.logoImageView];

    self.telegramButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.telegramButton.frame = CGRectMake(20, 140, 180, 45);
    [self.telegramButton setTitle:@"Telegram" forState:UIControlStateNormal];
    self.telegramButton.backgroundColor = [UIColor colorWithRed:0.0 green:0.5 blue:0.8 alpha:0.6];
    self.telegramButton.layer.cornerRadius = 12;
    [self.telegramButton addTarget:self action:@selector(openTelegram) forControlEvents:UIControlEventTouchUpInside];
    [self.glassCard.contentView addSubview:self.telegramButton];

    self.startGameButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.startGameButton.frame = CGRectMake(20, 195, 180, 45);
    [self.startGameButton setTitle:@"Start Game" forState:UIControlStateNormal];
    self.startGameButton.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.2 alpha:0.6];
    self.startGameButton.layer.cornerRadius = 12;
    [self.startGameButton addTarget:self action:@selector(startGame) forControlEvents:UIControlEventTouchUpInside];
    [self.glassCard.contentView addSubview:self.startGameButton];
}

- (void)openTelegram {
    NSURL *telegramURL = [NSURL URLWithString:@"https://t.me/GUTGA_T"];
    if ([[UIApplication sharedApplication] canOpenURL:telegramURL]) {
        [[UIApplication sharedApplication] openURL:telegramURL options:@{} completionHandler:nil];
    }
}

- (void)startGame {
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)downloadImageFromURL:(NSString *)urlString toImageView:(UIImageView *)imageView {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
        if (data) {
            dispatch_async(dispatch_get_main_queue(), ^{
                imageView.image = [UIImage imageWithData:data];
            });
        }
    });
}
@end

// ئەم بەشە وادەکات کاتێک یارییەکە دەکرێتەوە مینیۆکە ڕاستەوخۆ دەربکەوێت
%ctor {
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
            if (keyWindow) {
                Kurd4UModMenu *menu = [[HAMA_menu1882 alloc] initWithFrame:keyWindow.bounds];
                [keyWindow addSubview:menu];
            }
        });
    }];
}
