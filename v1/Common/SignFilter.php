<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-1-26
 * Time: 下午1:59
 */

class Common_SignFilter implements PhalApi_Filter{
    public function check(){
        $sign = strtolower(DI()->request->get('sign'));
        $service = strtolower(DI()->request->get('service'));
        $api_secret = strtolower(DI()->config->get('sys.api_secret'));
        $version = strtolower(DI()->request->get('v'));
        $clientType = strtolower(DI()->request->get('ct'));
        $tmpArr = array($api_secret, $service, $version,$clientType);
        asort($tmpArr, SORT_STRING);
        $tmpStr = implode( $tmpArr );
        $tmpStr = md5( $tmpStr );
        if ($tmpStr != $sign) {
            throw new PhalApi_Exception_BadRequest(T('sign_wrong'), Common_Code::SIGN_WRONG);
        }
    }
}