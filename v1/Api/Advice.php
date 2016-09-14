<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-2-3
 * Time: 上午11:58
 */

class Api_Advice extends Api_Base{
    public function getRules(){
        return array(
            '*' => array(
                'user_id' => array('name' => 'user_id','type' => 'int' ,'require' => true , 'desc' => '用户id'),
                'login_token' => array('name' => 'login_token' ,'type'=>'string','require'=>true,'desc'=>'登录唯一验证标识')
            ),
            'submit' => array(
                'msg' => array('name'=>'msg','type'=>'string','require'=>true,'desc'=>'意见内容')
            ),
        );
    }

    /**
     * 意见反馈
     * @desc 用户给系统反馈意见
     * @return int data.advice_id 插入意见的id
     */
    public function submit(){
        $domain = new Domain_Advice();
//        $params = array("user_id"=>$this->user_id,"msg"=>Common_Func::banWordsForbid($this->msg,"msg"));
        $params = array("user_id"=>$this->user_id,"msg"=>$this->msg);
        $rs = $domain->submit($params);
        return $rs;
    }
}