<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-1-31
 * Time: 下午12:10
 */

class Common_Request extends PhalApi_Request {

    public function genData($data) {
        if (!isset($data) || !is_array($data)) {
            return $_POST; //改成只接收POST
        }

//        $postData = isset($data['data']) ? base64_decode($data['data']) : array();
    }
}