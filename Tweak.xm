#import <UIKit/UIKit.h>

NSUserDefaults *preferences;

@interface SBDockView : UIView
@end

@interface SBFloatingDockView : UIView
@end

@interface SBFloatingDockPlatterView : UIView
@end

@interface _UIStatusBar : UIView
@end

@interface _UIStatusBarWifiSignalView : UIView
@end

@interface _UIStatusBarImageView : UIView
@end

@interface SBFolderTitleTextField : UIView
@end

@interface SBIconCloudLabelAccessoryView : UIView
@end

@interface SBIconBetaLabelAccessoryView : UIView
@end

@interface SBIconRecentlyUpdatedLabelAccessoryView : UIView
@end

@interface SBFolderControllerBackgroundView : UIView
@end

@interface SBIconBadgeView : UIView
@end

@interface SBDarkeningImageView : UIImageView
@property (nonatomic, retain) UIColor* tintColor;
@end

@interface SBIconListView : UIView
@end

@interface NCNotificationStructuredListViewController : UIViewController
@end

@interface SBFLockScreenDateView : UIView
@end

@interface SBControlCenterWindow : UIView
@end

@interface SBVolumeHUDViewController : UIViewController
@end

@interface NCNotificationShortLookView : UIView
@end

@interface _UIBatteryView : UIView
@property (assign,nonatomic) double bodyColorAlpha;
@property (assign,nonatomic) double pinColorAlpha;
@property (assign,nonatomic,readwrite) CGFloat chargePercent;
@property (assign,nonatomic) bool saverModeActive; //for later
@property(nonatomic, assign, readwrite) NSInteger chargingState;
-(void)setBodyColor:(UIColor *)arg1;
-(void)setPinColor:(UIColor *)arg1;
-(void)setFillColor:(UIColor *)arg1;
-(void)_updateBatteryFillColor;
@end


%hook SBIconListPageControl
-(void)setHidden:(BOOL)arg1 {
    if ([preferences boolForKey:@"isEnableHidePageDots"]) {
        %orig(YES);
    } else {
        %orig;
    }
}
%end

%hook SBIconListView
-(CGRect)frame {
	CGRect ret = %orig;
	CGFloat setIconTransparency = [preferences floatForKey:@"iconTransparency"];
	if (!(setIconTransparency >= 8)){
		setIconTransparency = 100;
	}
	self.alpha = setIconTransparency / 100;
	return ret;
}
%end

%hook _UIStatusBarWifiSignalView
-(CGRect)frame {
    if ([preferences boolForKey:@"isEnableHideWifiConnection"]) {
        CGRect ret = %orig;
        self.hidden = YES;
        return ret;
    } else {
	return %orig;
    }
}
%end

%hook SBFloatyFolderView
-(void)setBackgroundAlpha:(double)arg1{
	CGFloat setFolderBGTransparency = [preferences floatForKey:@"folderBackgroundTransparency"];
	if (!(setFolderBGTransparency >= 1)){
		setFolderBGTransparency = 100;
	}
	%orig(setFolderBGTransparency / 100);
}
%end

%hook SBIconView
-(void)setLabelHidden:(BOOL)arg1 {
    if ([preferences boolForKey:@"isEnableHideAppLabels"]) {
        %orig(YES);
    } else {
        %orig;
    }
}
%end

%hook _UIStatusBar
-(CGRect)frame {
    if ([preferences boolForKey:@"isEnableHideStatusBar"]) {
        CGRect ret = %orig;
        self.hidden = YES;
        return ret;
    } else {
	CGRect ret = %orig;
	CGFloat setStatusBarTransparency = [preferences floatForKey:@"statusBarTransparency"];
	if (!(setStatusBarTransparency >= 1)){
		setStatusBarTransparency = 100;
	}
	self.alpha = setStatusBarTransparency / 100;
	return ret;
    }
}
%end

%hook SBFolderTitleTextField
-(CGRect)frame {
    if ([preferences boolForKey:@"isEnableHideFolderTitle"]) {
        CGRect ret = %orig;
        self.hidden = YES;
        return ret;
    } else {
        return %orig;
    }
}
%end

%hook SBIconCloudLabelAccessoryView
-(CGRect)frame {
    if ([preferences boolForKey:@"isEnableHideOffloadIcon"]) {
        CGRect ret = %orig;
        self.hidden = YES;
        return ret;
    } else {
        return %orig;
    }
}
%end

%hook SBIconBetaLabelAccessoryView
-(CGRect)frame {
    if ([preferences boolForKey:@"isEnableHideTestflightAppDots"]) {
        CGRect ret = %orig;
        self.hidden = YES;
        return ret;
    } else {
        return %orig;
    }
}
%end

%hook SBFLockScreenDateView
-(CGRect)frame {
	CGRect ret = %orig;
	CGFloat setLockScreenDateTransparency = [preferences floatForKey:@"lockScreenDateTransparency"];
	if (!(setLockScreenDateTransparency >= 1)){
		setLockScreenDateTransparency = 100;
	}
	self.alpha = setLockScreenDateTransparency / 100;
	return ret;
}
%end

%hook SBControlCenterWindow
-(CGRect)frame {
	CGRect ret = %orig;
	CGFloat setControlCenterTransparency = [preferences floatForKey:@"controlCenterTransparency"];
	if (!(setControlCenterTransparency >= 1)){
		setControlCenterTransparency = 100;
	}
	self.alpha = setControlCenterTransparency / 100;
	return ret;
}
%end

%hook SBIconRecentlyUpdatedLabelAccessoryView
-(CGRect)frame {
    if ([preferences boolForKey:@"isEnableHideRecentlyUpdatedAppDots"]) {
        CGRect ret = %orig;
        self.hidden = YES;
        return ret;
    } else {
        return %orig;
    }
}
%end

%ctor {
  preferences = [[NSUserDefaults alloc] initWithSuiteName:@"com.zachary7829.springliciousprefs"];
}