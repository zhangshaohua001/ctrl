<?php
/**
 * 请在下面放置任何您需要的应用配置
 */

return array(

    /**
     *
     *
     * 需要修改一下
     * 应用接口层的统一参数
     */

   'apiCommonRules' => array(
        'sign' => array('name' => 'sign', 'require' => true,'type'=>'string','min'=>32,'max'=>32,'note'=>'签名'),//签名
        'clienttype'=> array('name' => 'ct', 'require' => true,'type'=>'string','min'=>2,'max'=>50,'note'=>'客户端类型 例：ios'),//客户端类型
        'version'=>array('name'=>'v','require'=>true,'default'=>'1.0.0','note'=>'版本号'), //版本号
    ),

);
