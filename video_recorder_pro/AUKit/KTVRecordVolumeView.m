//
//  KTVRecordVolumeView.m
//  ktv
//
//  Created by YinXuebin on 15/11/5.
//
//

#import "KTVRecordVolumeView.h"

@interface KTVRecordVolumeView()

@property (weak, nonatomic) IBOutlet UISlider *humanVolumeSlider;
@property (weak, nonatomic) IBOutlet UISlider *accompanyVolumeSlider;

@property (weak, nonatomic) IBOutlet UIView *accompanyVolumeArea;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *humanVolumeAreaTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *humanVolumeAreaHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *accompanyVolumeAreaTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *accompanyVolumeAreaHeightConstraint;


@property (nonatomic, assign) NSInteger pitchLevel;

@end


@implementation KTVRecordVolumeView

#pragma mark - initialize

+ (KTVRecordVolumeView *)viewWithHumanVolume:(NSInteger)humanVolume
                             accompanyVolume:(NSInteger)accompanyVolume {
    UINib *nib = [UINib nibWithNibName:@"KTVRecordVolumeView" bundle:[NSBundle mainBundle]];
    KTVRecordVolumeView *view = [[nib instantiateWithOwner:nil options:nil] firstObject];
    return view;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    //人声
    [self.humanVolumeSlider setMinimumTrackImage:[[UIImage imageNamed:@"EasyLiveRecordCompleteVolumeMin"] resizableImageWithCapInsets:UIEdgeInsetsZero] forState:UIControlStateNormal];
    [self.humanVolumeSlider setMaximumTrackImage:[[UIImage imageNamed:@"EasyLiveRecordCompleteVolumeMax"] resizableImageWithCapInsets:UIEdgeInsetsZero] forState:UIControlStateNormal];
    [self.humanVolumeSlider setThumbImage:[UIImage imageNamed:@"EasyLiveRecordCompleteVolumeThumb"] forState:UIControlStateNormal];
    [self.humanVolumeSlider setMinimumValue:RECORD_HUMAN_VOLUME_MIN];
    [self.humanVolumeSlider setMaximumValue:RECORD_HUMAN_VOLUME_MAX];
    
    //伴奏
    [self.accompanyVolumeSlider setMinimumTrackImage:[[UIImage imageNamed:@"EasyLiveRecordCompleteVolumeMin"] resizableImageWithCapInsets:UIEdgeInsetsZero] forState:UIControlStateNormal];
    [self.accompanyVolumeSlider setMaximumTrackImage:[[UIImage imageNamed:@"EasyLiveRecordCompleteVolumeMax"] resizableImageWithCapInsets:UIEdgeInsetsZero] forState:UIControlStateNormal];
    [self.accompanyVolumeSlider setThumbImage:[UIImage imageNamed:@"EasyLiveRecordCompleteVolumeThumb"] forState:UIControlStateNormal];
    [self.accompanyVolumeSlider setMinimumValue:RECORD_MUSIC_VOLUME_MIN];
    [self.accompanyVolumeSlider setMaximumValue:RECORD_MUSIC_VOLUME_MAX];
    
}

- (void)setWithHumanVolume:(NSInteger)humanVolume accompanyVolume:(NSInteger)accompanyVolume {
    [self.humanVolumeSlider setValue:humanVolume animated:NO];
    [self.accompanyVolumeSlider setValue:accompanyVolume animated:NO];
    
}

- (void)setHumanSliderMinValue:(float)minValue maxValue:(float)maxValue
{
    [self.humanVolumeSlider setMinimumValue:minValue];
    [self.humanVolumeSlider setMaximumValue:maxValue];
}

- (void)setMusicSliderMinValue:(float)minValue maxValue:(float)maxValue
{
    [self.accompanyVolumeSlider setMinimumValue:minValue];
    [self.accompanyVolumeSlider setMaximumValue:maxValue];
}

#pragma mark - Human Volume Processor
- (IBAction)humanVolumeSliderDidChangeValue:(id)sender {
    if ([self.delegate respondsToSelector:@selector(volumeViewHumanVolumeDidChanged:)]) {
        [self.delegate volumeViewHumanVolumeDidChanged:self.humanVolumeSlider.value];
    }
}

#pragma mark - Accompany Volume Processor
- (IBAction)accompanyVolumeSliderDidChangeValue:(id)sender {
    if ([self.delegate respondsToSelector:@selector(volumeViewAccompanyVolumeDidChanged:)]) {
        [self.delegate volumeViewAccompanyVolumeDidChanged:self.accompanyVolumeSlider.value];
    }
}

@end
