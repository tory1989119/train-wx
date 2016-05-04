package com.train.wx.common.enums;

/**
 * 系统错误定义
 * @author wuxj
 *
 */
public enum BusErrorCode {

    sucessed("10000","成功"),
    sys_error("10001","系统错误"),
    get_voucher_error("10002","已经领取优惠券，无法再次领取");
    
    private String code;
    
    private String des;
    
    private BusErrorCode(String code,String des){
        this.code = code;
        this.des = des;
    }
    
    public String getCode(){
        return code;
    }
    
    public String getDes(){
        return des;
    }
}
