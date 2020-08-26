//
//  iRNumberBoardLeftKeysView.swift
//  iRime
//
//  Created by 王宇 on 2017/3/2.
//  Copyright © 2017年 jimmy54. All rights reserved.
//



import UIKit

protocol iRNumberBoardLeftKeysViewProtocol:NSObjectProtocol {
    func iRNumberBoardLeftKeysViewPassText(_ text:String) -> Void
}

class iRNumberBoardLeftKeysBtn: UIButton {
    
    var viewBottomLine:UIView?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let backColor = UIColor.init(red: 204.0/255.0, green: 210.0/255.0, blue: 217.0/255.0, alpha: 1.0)
        self.titleLabel?.font = UIFont(descriptor: UIFontDescriptor.preferredFontDescriptor(withTextStyle: UIFont.TextStyle.body), size: NSObject.getFitFontForNumberBoard())
        self.backgroundColor = backColor;
        self.setTitleColor(UIColor.black, for: UIControl.State())
        self.setBackgroundImage(UIImage.imageWithColor(UIColor.lightGray), for: .highlighted)
        self.createSubVeiws()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func createSubVeiws() -> Void {
        //1.下部分割线
        viewBottomLine = UIView.init(frame: CGRect.null)
        self .addSubview(viewBottomLine!)
        //--属性设置
        viewBottomLine?.backgroundColor = UIColor.init(red: 170.0/255.0, green: 170.0/255.0, blue: 170.0/255.0, alpha: 1.0)
        //--约束布局
        viewBottomLine?.mas_makeConstraints({ (maker:MASConstraintMaker!) in
            maker.left.equalTo()(self)
            maker.bottom.equalTo()(self)
            maker.right.equalTo()(self);
            maker.height.mas_equalTo()(0.5)
        })
    }
}


class iRNumberBoardLeftKeysView: UIView {

    var btnOne:iRNumberBoardLeftKeysBtn? = nil
    var btnTwo:iRNumberBoardLeftKeysBtn? = nil
    var btnThree:iRNumberBoardLeftKeysBtn? = nil
    var btnFour:iRNumberBoardLeftKeysBtn? = nil
    var btnFive:iRNumberBoardLeftKeysBtn? = nil
    weak var delegateToCallBack:iRNumberBoardLeftKeysViewProtocol? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createSubVeiws()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func createSubVeiws() -> Void {
        //想了半天,还是傻瓜式创建吧,这个也不会有太大的变动
        //1.第一个btn item
        btnOne = iRNumberBoardLeftKeysBtn.init(frame: CGRect.null)
        self.addSubview(btnOne!)
        //--属性设置
        btnOne?.addTarget(self, action:#selector(iRNumberBoardLeftKeysView.btnAction(_:)) , for: .touchUpInside)
        btnOne?.setTitle("+", for: UIControl.State())
        //--约束布局
        btnOne?.mas_makeConstraints({ (maker:MASConstraintMaker!) in
            maker.left.equalTo()(self)
            maker.top.equalTo()(self)
            maker.right.equalTo()(self)
            maker.height.equalTo()(self.mas_height)?.multipliedBy()(1.0/5.0)
        })
        //2.第二个btn item 减号
        btnTwo = iRNumberBoardLeftKeysBtn.init(frame: CGRect.null)
        self.addSubview(btnTwo!)
        //--属性设置
        btnTwo?.addTarget(self, action:#selector(iRNumberBoardLeftKeysView.btnAction(_:)) , for: .touchUpInside)
        btnTwo?.setTitle("-", for: UIControl.State())
        //--约束布局
        btnTwo?.mas_makeConstraints({ (maker:MASConstraintMaker!) in
            maker.left.equalTo()(self)
            maker.top.equalTo()(self.btnOne!.mas_bottom)
            maker.right.equalTo()(self)
            maker.height.equalTo()(self.mas_height)?.multipliedBy()(1.0/5.0)
        })
        //3.第三个btn item 除号
        btnThree = iRNumberBoardLeftKeysBtn.init(frame: CGRect.null)
        self.addSubview(btnThree!)
        //--属性设置
        btnThree?.addTarget(self, action:#selector(iRNumberBoardLeftKeysView.btnAction(_:)) , for: .touchUpInside)
        btnThree?.setTitle("/", for: UIControl.State())
        //--约束布局
        btnThree?.mas_makeConstraints({ (maker:MASConstraintMaker!) in
            maker.left.equalTo()(self)
            maker.top.equalTo()(self.btnTwo!.mas_bottom)
            maker.right.equalTo()(self)
            maker.height.equalTo()(self.mas_height)?.multipliedBy()(1.0/5.0)
        })
        //4.第四个btn item 乘号
        btnFour = iRNumberBoardLeftKeysBtn.init(frame: CGRect.null)
        self.addSubview(btnFour!)
        //--属性设置
        btnFour?.addTarget(self, action:#selector(iRNumberBoardLeftKeysView.btnAction(_:)) , for: .touchUpInside)
        btnFour?.setTitle("*", for: UIControl.State())
        //--约束布局
        btnFour?.mas_makeConstraints({ (maker:MASConstraintMaker!) in
            maker.left.equalTo()(self)
            maker.top.equalTo()(self.btnThree!.mas_bottom)
            maker.right.equalTo()(self)
            maker.height.equalTo()(self.mas_height)?.multipliedBy()(1.0/5.0)
        })
        //5.第五个btn item 冒号
        btnFive = iRNumberBoardLeftKeysBtn.init(frame:CGRect.null)
        self.addSubview(btnFive!)
        //--属性设置
        btnFive?.addTarget(self, action:#selector(iRNumberBoardLeftKeysView.btnAction(_:)) , for: .touchUpInside)
        btnFive?.setTitle(":", for: UIControl.State())
        //--约束布局
        btnFive?.mas_makeConstraints({ (maker:MASConstraintMaker!) in
            maker.left.equalTo()(self)
            maker.right.equalTo()(self)
            maker.top.equalTo()(self.btnFour!.mas_bottom)
            maker.height.equalTo()(self.mas_height)?.multipliedBy()(1.0/5.0)
        })
    }
    
    
    @objc func btnAction(_ btn:iRNumberBoardLeftKeysBtn) -> Void {
        if (self.delegateToCallBack != nil) {
            self.delegateToCallBack?.iRNumberBoardLeftKeysViewPassText((btn.titleLabel?.text)!)
        }
    }
}













































