<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-1-31
 * Time: 下午1:49
 */
 
class Domain_Energy extends Domain_CheckLogin{
    public $model_energy; //用户模型
    public function __construct()
    {
        parent::__construct();
        $this->model_energy = new Model_Energy();
    }
    public function test($params){
        $insert = array(
            'user_id' => $params['user_id'],
            'energy_value' => $params['value'],
            'test_time' => $this->time,
            'test_date' => intval(date('Ymd',$this->time))
        );
        //写入测试数据
        $rs = $this->model_energy->insertTest($insert);

        //插入等级测试表(rank_test)中的数据
        $insert_rank = array(
            'user_id' => $params['user_id'],
            'last_value' => $params['value'],
            'all_value' => $params['value'],
            'test_time' => $this->time,
            'test_count' => 1
        );
        //更新等级测试表(rank_test)中的数据
        $update_rank = array(
            'last_value' => $params['value'],
            'all_value' => new NotORM_Literal("all_value + ".intval($params['value'])),
            'test_time' => $this->time,
            'test_count' => new NotORM_Literal("test_count + 1")
        );
        $this->model_energy->updateRank(array('user_id'=>$params['user_id']),$insert_rank,$update_rank);
        if(!$rs){ //写入失败
            $this->result['code'] = Common_Code::DATA_INSERT_ERROR;
            $this->result['msg'] = '数据写入失败';
            return $this->result;
        }

        //返回数据
        $insert['value'] = $insert['energy_value'];
        unset($insert['energy_value']);
        $this->result['data'] = $insert;
        return $this->result;
    }

    /**
     * 查看好友能量
     */
    public function lookFriendEnergy($params){
        $model_user = new Model_User();
        $friend_id = $model_user->getUserIdByMobile($params['mobile']);
        if(!$friend_id){ //该帐号不存在
            $this->result['code'] = Common_Code::DATA_NOT_EXIST;
            $this->result['msg'] = T('data_not_exist');
            return $this->result;
        }

        $model_energy = new Model_Rank();
        $energy = $model_energy->getEnergyValueById($friend_id);

        $this->result['data']['mobile'] = $params['mobile'];
        //用户有能量值
        if($energy){
            $this->result['data']['last_value'] = $energy['last_value'];
            $this->result['data']['all_value'] = $energy['all_value'];
            $this->result['data']['test_time'] = $energy['test_time'];
        } else { //无能量值为空
            $this->result['data']['last_value'] = "";
            $this->result['data']['all_value'] = "";
            $this->result['data']['test_time'] = "";
        }

        return $this->result;

    }

    /**
     * 查看多个好友能量
     */
    public function lookFriendsEnergy($params){
        $model_energy = new Model_Rank();
        $data = $model_energy->getEnergyValueByMobiles($params);
        $this->result['data']['list'] = $data;
        return $this->result;
    }

    /**
     * 能量值分享分享
     */
    public function share($params){
        $info= "我的能量是{$params['info']}-测试结果来自：能量时钟";
        $insert = array(
            'type' => Common_Conf::SHARE_TYPE_ENERGY,
            'user_id' => $params['user_id'],
            'info' => $params['info'],
            'create_time' => time()
        );
        $model_share = new Model_Share();
        $share_id = $model_share->insertShare($insert);
        $this->result['data']['share_id'] = $share_id;
        $this->result['data']['title'] = $info;
        $this->result['data']['info'] = $info;
        $this->result['data']['picture'] = "http://serviceapp.aibdai.com/h5/resource/images/logo.png";
        $this->result['data']['url'] = "http://serviceapp.aibdai.com/h5/share.php?id=".urlencode(base64_encode($share_id));
        return $this->result;
    }
}