//
//  KTVRecordVolumeView.h
//  ktv
//
//  Created by XiaokaiZhan on 15/11/5.
//
//

#import <UIKit/UIKit.h>

#define RECORD_HUMAN_VOLUME_MIN   -27
#define RECORD_HUMAN_VOLUME_MAX   3
#define RECORD_MUSIC_VOLUME_MIN   -30
#define RECORD_MUSIC_VOLUME_MAX   0

@protocol KTVRecordVolumeViewDelegate <NSObject>

@optional
- (void)volumeViewHumanVolumeDidChanged:(NSInteger)humanVolume;
- (void)volumeViewAccompanyVolumeDidChanged:(NSInteger)accompanyVolume;

@end

@interface KTVRecordVolumeView : UIView

/**
 *  生成录音页面音量调节View的静态函数
 *
 *  @param humanVolume     初始人声音量（-24 ~ 6)
 *  @param accompanyVolume 初始伴奏音量（-24 ~ 6)
 *
 *  @return 录音页面音量调节View
 */
+ (KTVRecordVolumeView *)viewWithHumanVolume:(NSInteger)humanVolume
                             accompanyVolume:(NSInteger)accompanyVolume;

@property (nonatomic, weak) id<KTVRecordVolumeViewDelegate> delegate;

- (void)setHumanSliderMinValue:(float)minValue maxValue:(float)maxValue;
- (void)setMusicSliderMinValue:(float)minValue maxValue:(float)maxValue;
- (void)setWithHumanVolume:(NSInteger)humanVolume accompanyVolume:(NSInteger)accompanyVolume ;

@end
