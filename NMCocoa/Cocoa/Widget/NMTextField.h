//
//  NMTextField.h
//  NMCocoa
//
//  Created by 南门 on 2018/10/23.
//  Copyright © 2018 南门. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, NMTFType) {
    NMTFType_Normal, // default
    NMTFType_Secure,
    NMTFType_Blank,
};

@interface NMTextField : UIView

@property(nonatomic)                   NMTFType                type;
@property(nullable, nonatomic, copy)   NSString               *text;
@property(nullable, nonatomic, copy)   NSAttributedString     *attributedText;
@property(nullable, nonatomic, strong) UIColor                *textColor;
@property(nullable, nonatomic, strong) UIFont                 *font;
@property(nonatomic)                   NSTextAlignment         textAlignment;
@property(nonatomic)                   UITextBorderStyle       borderStyle;
@property(nonatomic, copy)             NSDictionary<NSAttributedStringKey,id> *defaultTextAttributes;
@property(nullable, nonatomic, copy)   NSString               *placeholder;
@property(nullable, nonatomic, copy)   NSAttributedString     *attributedPlaceholder;
@property(nonatomic)                   BOOL                    clearsOnBeginEditing;
@property(nonatomic)                   BOOL                    adjustsFontSizeToFitWidth;
@property(nonatomic)                   CGFloat                 minimumFontSize;
@property(nullable, nonatomic, weak)   id<UITextFieldDelegate> delegate;
@property(nullable, nonatomic, strong) UIImage                *background;
@property(nullable, nonatomic, strong) UIImage                *disabledBackground;
@property(nonatomic, readonly)         BOOL isEditing;
@property(nonatomic)                   BOOL allowsEditingTextAttributes;
@property(nullable, nonatomic, copy)   NSDictionary<NSAttributedStringKey,id> *typingAttributes;

@property(nonatomic)        UITextFieldViewMode  clearButtonMode;
@property(nullable, nonatomic, strong) UIView   *leftView;
@property(nonatomic)        UITextFieldViewMode  leftViewMode;
@property(nullable, nonatomic, strong) UIView   *rightView;
@property(nonatomic)        UITextFieldViewMode  rightViewMode;

+ (instancetype)textFieldWithType:(NMTFType)type;

@end

NS_ASSUME_NONNULL_END
