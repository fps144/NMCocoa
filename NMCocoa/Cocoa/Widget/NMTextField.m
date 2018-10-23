//
//  NMTextField.m
//  NMCocoa
//
//  Created by 南门 on 2018/10/23.
//  Copyright © 2018 南门. All rights reserved.
//

#import "NMTextField.h"

@interface NMTextField()

@property(nonatomic, strong) UITextField *textField;

@end

@implementation NMTextField

#pragma mark - Initialize
+ (instancetype)textFieldWithType:(NMTFType)type {
    return [[NMTextField alloc] initWithFrame:CGRectZero type:type];
}

- (instancetype)init {
    return [self initWithFrame:CGRectZero type:NMTFType_Normal];
}

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame type:NMTFType_Normal];
}

- (instancetype)initWithFrame:(CGRect)frame type:(NMTFType)type {
    if (self = [super initWithFrame:frame]) {
        self.type = type;
    }
    return self;
}

#pragma mark - Layout

#pragma mark - Private
- (void)updateViews {
    
}

#pragma mark - Setter
- (void)setType:(NMTFType)type {
    if (_type != type) {
        _type = type;
        [self updateViews];
    }
}

- (void)setText:(NSString *)text {
    _text = text;
    self.textField.text = text;
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    _attributedText = attributedText;
    self.textField.attributedText = attributedText;
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    self.textField.textColor = textColor;
}

- (void)setFont:(UIFont *)font {
    _font = font;
    self.textField.font = font;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    _textAlignment = textAlignment;
    self.textField.textAlignment = textAlignment;
}

- (void)setBorderStyle:(UITextBorderStyle)borderStyle {
    _borderStyle = borderStyle;
    self.textField.borderStyle = borderStyle;
}

- (void)setDefaultTextAttributes:(NSDictionary<NSAttributedStringKey,id> *)defaultTextAttributes {
    _defaultTextAttributes = defaultTextAttributes.copy;
    self.textField.defaultTextAttributes = defaultTextAttributes.copy;
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    self.textField.placeholder = placeholder;
}

- (void)setAttributedPlaceholder:(NSAttributedString *)attributedPlaceholder {
    _attributedPlaceholder = attributedPlaceholder;
    self.textField.attributedPlaceholder = attributedPlaceholder;
}

- (void)setClearsOnBeginEditing:(BOOL)clearsOnBeginEditing {
    _clearsOnBeginEditing = clearsOnBeginEditing;
    self.textField.clearsOnBeginEditing = clearsOnBeginEditing;
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth {
    _adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
    self.textField.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
}

- (void)setMinimumFontSize:(CGFloat)minimumFontSize {
    _minimumFontSize = minimumFontSize;
    self.textField.minimumFontSize = minimumFontSize;
}

- (void)setDelegate:(id<UITextFieldDelegate>)delegate {
    _delegate = delegate;
    self.textField.delegate = delegate;
}

- (void)setBackground:(UIImage *)background {
    _background = background;
    self.textField.background = background;
}

- (void)setDisabledBackground:(UIImage *)disabledBackground {
    _disabledBackground = disabledBackground;
    self.textField.disabledBackground = disabledBackground;
}

- (void)setAllowsEditingTextAttributes:(BOOL)allowsEditingTextAttributes {
    _allowsEditingTextAttributes = allowsEditingTextAttributes;
    self.textField.allowsEditingTextAttributes = allowsEditingTextAttributes;
}

- (void)setTypingAttributes:(NSDictionary<NSAttributedStringKey,id> *)typingAttributes {
    _typingAttributes = typingAttributes.copy;
    self.textField.typingAttributes = typingAttributes.copy;
}

- (void)setClearButtonMode:(UITextFieldViewMode)clearButtonMode {
    _clearButtonMode = clearButtonMode;
    self.textField.clearButtonMode = clearButtonMode;
}

- (void)setLeftView:(UIView *)leftView {
    _leftView = leftView;
    self.textField.leftView = leftView;
}

- (void)setLeftViewMode:(UITextFieldViewMode)leftViewMode {
    _leftViewMode = leftViewMode;
    self.textField.leftViewMode = leftViewMode;
}

- (void)setRightView:(UIView *)rightView {
    _rightView = rightView;
    self.textField.rightView = rightView;
}

- (void)setRightViewMode:(UITextFieldViewMode)rightViewMode {
    _rightViewMode = rightViewMode;
    self.textField.rightViewMode = rightViewMode;
}

#pragma mark - Getter
- (BOOL)isEditing {
    return self.textField.isEditing;
}

@end
