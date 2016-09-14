<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-1-26
 * Time: 下午3:48
 */
 
 class Api_Base extends PhalApi_Api{
     /**
      * 封装数据方法
      * @param array $data
      * @param int $code
      * @param string $msg
      * @return array
      */
     protected function showData($data=array(),$code=0,$msg='success'){
         $time = empty($_SERVER['REQUEST_TIME'])?time():$_SERVER['REQUEST_TIME'];
         return array('code'=>$code,'data'=>$data,'msg'=>$msg,'time'=>$time);
     }
 }