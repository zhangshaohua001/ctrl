<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-2-1
 * Time: 下午12:57
 */
 
class Model_Clock extends PhalApi_Model_NotORM{
    protected function getTableName($id)
    {
        return 'clock';
    }

    /**
     * 添加闹钟
     */
    public function insertClock($params){
        $insert = DI()->notorm->clock;
        $insert->insert($params);
        $insert_id = $insert->insert_id();
        return $insert_id;
    }

    /**
     * 根据闹钟id获取闹钟信息
     */
    public function getInfoById($id,$user_id){
        return DI()->notorm->clock->where("isdelete = 0 AND id = ? AND user_id = ?",$id,$user_id)->select("id,info,remark,pre_complete_time,remind_time,is_complete,complete_time,status,create_time")->fetch();
    }

    /**
     * 根据用户id获取闹钟信息
     */
    public function getInfoByUserId($params){
        return DI()->notorm->clock->where("isdelete = 0 AND user_id = ?",$params['user_id'])->select("id,info,remark,pre_complete_time,remind_time,is_complete,complete_time,status,create_time")->order("id desc")->limit(($params['page']-1)*$params['count'],$params['count'])->fetchAll();
    }

    /**
     * 根据用户id获取未完成闹钟信息
     */
    public function getInfoNoCompleteByUserId($params){
        return DI()->notorm->clock->where("isdelete = 0 AND user_id = ? AND is_complete = 0",$params['user_id'])->select("id,info,remark,pre_complete_time,remind_time,is_complete,complete_time,status,create_time")->order("id desc")->limit(($params['page']-1)*$params['count'],$params['count'])->fetchAll();
    }

    /**
     * 根据闹钟id删除闹钟
     */
    public function deleteById($id,$user_id){
        return DI()->notorm->clock->where("id in ({$id}) AND user_id = ?",$user_id)->update(array('isdelete'=>1));
    }

    /**
     * 更新闹钟
     */
    public function updateById($id,$user_id,$params){
        return DI()->notorm->clock->where("isdelete = 0 AND id = ? AND user_id = ?",$id,$user_id)->update($params);
    }

    /**
     * 完成
     */
    public function complete($id,$user_id,$complete_time){
        $update = array(
            "is_complete" => 1,
            'complete_time' => $complete_time
        );
        return DI()->notorm->clock->where("isdelete = 0 AND id in ({$id}) AND user_id = ?",$user_id)->update($update);
    }

    /**
     * 检查闹钟内容是否设置相同
     */
    public function checkSameCtn($params,$user_id){
        $params = array_merge($params,array(
            'isdelete' => 0,
            'user_id' => $user_id
        ));
        return DI()->notorm->clock->where($params)->count("*");
    }

    /**
     * 根据闹钟id获取闹钟信息
     */
    public function getShareInfoById($id,$user_id){
        return DI()->notorm->clock->where("id = ? AND user_id = ? AND isdelete = 0",$id,$user_id)->select("info,create_time")->fetch();
    }
}