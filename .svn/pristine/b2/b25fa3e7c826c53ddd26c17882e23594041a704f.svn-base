<?php
/**
 * Created by PhpStorm.
 * User: George
 * Date: 15/4/15
 * Time: 上午11:24
 */
abstract class Domain_Base{

    /**
     * @var 系统时间戳
     */
    public $time;

    /**
     * 默认返回值
     */

    public $result = array();

    public function __construct()
    {
        $this->time = empty($_SERVER['REQUEST_TIME'])?time():$_SERVER['REQUEST_TIME'];
        $this->result = array('code' => 0,'data' => array() , 'msg' => 'success', 'time'=>$this->time);
    }
//    /**
//     * 从代理取数据
//     * @param $params
//     * @param $cacheKey
//     * @param int $cacheTime
//     * @param bool $isDataCache
//     * @return mixed
//     */
//    public function getProxyData($params,$cacheKey,$cacheTime = 300,$isDataCache=true){
//        $ary = Common_Func::GetCachekey($cacheKey,$params);
//        $query=new Model_BaseModelQuery();
//        $query->isDataCache = $isDataCache;
//        $query->class = $ary['class'];
//        $query->method = $ary['method'];
//        $query->params = $params;
//        $query->id = $ary['key'];
//        $query->cacheTime = $cacheTime;
//        $modelProxy=new ModelProxy_Base();
//        return $modelProxy->getData($query);
//
//    }
//
//    /**
//     * 删除proxy cache
//     * @param $params
//     * @param $cacheKey
//     */
//    public function delProxyDataCache($params,$cacheKey){
//        $ary =  Common_Func::GetCachekey($cacheKey,$params);
//        $key = $ary['key'];
//        DI()->cache->delete($key);
//    }
}