<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-1-31
 * Time: 下午3:02
 */
 
class Api_Rank extends Api_Base{
    public function getRules(){
        return array(
            '*' => array(
                'user_id' => array('name' => 'user_id','type' => 'int' ,'require' => true , 'desc' => '用户id'),
                'login_token' => array('name' => 'login_token' ,'type'=>'string','require'=>true,'desc'=>'登录唯一验证标识')
            ),
            'test' => array(
                'count' => array('name' => 'count' ,'type' => 'int' , 'min' => 3 , 'max' => 20 , 'default' => 10 ,'desc' => '排名数量' )
            ),
            'all' => array(
                'count' => array('name' => 'count' ,'type' => 'int' , 'min' => 3 , 'max' => 20 , 'default' => 10 ,'desc' => '排名数量' )
            ),
        );
    }

    /**
     * 获取单次能量测试排名
     * @desc 用户最后测试能量值的排名
     * @return int code 操作码，0表示成功，其他表示失败
     * @return array data.list 排名信息
     * @return string data.list.user_id 用户id
     * @return string data.list.last_value 上次测试能量值
     * @return string data.list.all_value 总能量值
     * @return string data.list.test_time 最后测试时间
     * @return string data.list.test_count 测试总次数
     * @return array data.rank 用户个人排名信息
     * @return string data.rank.user_id 用户id
     * @return string data.rank.last_value 用户上次测试能量值
     * @return string data.rank.all_value 用户总能量值
     * @return string data.rank.test_time 用户最后测试时间
     * @return string data.rank.test_count 用户测试总次数
     * @return int data.rank.rank 用户总排名
     * @return string msg 提示信息
     * @return int time 请求时间
     */
    public function test(){
        $domain = new Domain_Rank();
        $params = array('user_id'=>$this->user_id,'count'=>$this->count);
        $rs = $domain->test($params);
        return $rs;
    }

    /**
     * 获取总能量排名
     * @desc 用户总能量值的排名
     * @return int code 操作码，0表示成功，其他表示失败
     * @return array data.list 排名信息
     * @return string data.list.user_id 用户id
     * @return string data.list.last_value 上次测试能量值
     * @return string data.list.all_value 总能量值
     * @return string data.list.test_time 最后测试时间
     * @return string data.list.test_count 测试总次数
     * @return array data.rank 用户个人排名信息
     * @return string data.rank.user_id 用户id
     * @return string data.rank.last_value 用户上次测试能量值
     * @return string data.rank.all_value 用户总能量值
     * @return string data.rank.test_time 用户最后测试时间
     * @return string data.rank.test_count 用户测试总次数
     * @return int data.rank.rank 用户总排名
     * @return string msg 提示信息
     * @return int time 请求时间
     */
    public function all(){
        $domain = new Domain_Rank();
        $params = array('user_id'=>$this->user_id,'count'=>$this->count);
        $rs = $domain->all($params);
        return $rs;
    }
}