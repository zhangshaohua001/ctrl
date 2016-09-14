<?php
/**
 * PhalApi接口列表 - 自动生成
 *
 * - 对Api_系列的接口，进行罗列
 * - 按service进行字典排序
 * - 支持多级目录扫描
 * 
 * <br>使用示例：<br>
```
 * <?php
 * class Api_Demo extends PhalApi_Api {
 *
 *      /**
 *       * 1.1 可在这里输入接口的服务名称
 *       * /
 *      public function index() {
 *          // todo ...    
 *      }
 * }
 *
```
 * @license     http://www.phalapi.net/license GPL 协议
 * @link        http://www.phalapi.net/
 * @author      xiaoxunzhao 2015-10-25
 * @modify      Aevit, dogstar <chanzonghuang@gmail.com> 2014-10-29
 */

define("D_S", DIRECTORY_SEPARATOR);
$root = dirname(__FILE__);

/**
 * 项目的文件夹名 - 如有需要，请更新此值
 */
$apiDirName = 'v1';
echo 1111111111111111111;die;
require_once implode(D_S, array($root, '..', 'init.php'));
DI()->loader->addDirs($apiDirName);
$files = listDir(implode(D_S, array($root, '..', '..', $apiDirName, 'Api')));
$allPhalApiApiMethods = get_class_methods('PhalApi_Api');

$allApiS = array();

foreach ($files as $value) {
    $value = realpath($value);
    $subValue = substr($value, strpos($value, D_S . 'Api' . D_S) + 1);
    //进行处理对于类似与Api/Auth/Api/Api.php 多层嵌套只取 Api/Api.php进行处理
    $arr       = explode(D_S, $subValue);
    $subValue  = implode(D_S, array_slice($arr, -2, 2));
    $apiServer = str_replace(array(D_S, '.php'), array('_', ''), $subValue);

    if (!class_exists($apiServer)) {
        continue;
    }

    $method = array_diff(get_class_methods($apiServer), $allPhalApiApiMethods);

    foreach ($method as $mValue) {
        $rMethod = new Reflectionmethod($apiServer, $mValue);
        if (!$rMethod->isPublic()) {
            continue;
        }

        $title = '//请检测函数注释';
        $desc = '//请使用@desc 注释';
        $docComment = $rMethod->getDocComment();
        if ($docComment !== false) {
            $docCommentArr = explode("\n", $docComment);
            $comment = trim($docCommentArr[1]);
            $title = trim(substr($comment, strpos($comment, '*') + 1));

            foreach ($docCommentArr as $comment) {
                $pos = stripos($comment, '@desc');
                if ($pos !== false) {
                    $desc = substr($comment, $pos + 5);
                }
            }
        }

        $service = substr($apiServer, 4) . '.' . ucfirst($mValue);
        $allApiS[$service] = array(
            'service' => $service,
            'title' => $title,
            'desc' => $desc,
        );
    }
}

//字典排列
ksort($allApiS);

function listDir($dir) {
    $dir .= substr($dir, -1) == D_S ? '' : D_S;
    $dirInfo = array();
    foreach(glob($dir.'*') as $v) {
        if (is_dir($v)) {
            $dirInfo = array_merge($dirInfo, listDir($v));
        } else {
            $dirInfo[] = $v; 
        }
    }
    return $dirInfo;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title><?php echo $apiDirName; ?> - 接口列表</title>
    <link rel="stylesheet" href="/bootstrap.min.css">
</head>
<body>
<br />
<div class="container">
<div class="jumbotron">
    <div class="page-header">
        <h1>接口列表</h1>
    </div>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>#</th><th>接口服务</th><th>接口名称</th><th>更多说明</th><th>测试</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td colspan="2" style="color: red">login_token查询链接</td>
            <td><a href="/login_token.php" target="_blank">http://192.168.1.190/login_token.php</a></td>
        </tr>
        <?php
        $num = 1;
        $uri = str_ireplace('list.php', 'checkApiParams.php', $_SERVER['REQUEST_URI']);
        $test = str_ireplace('list.php', '', $_SERVER['REQUEST_URI']);
        $user_id = DI()->request->get("user_id");
        $user_id = $user_id ? $user_id : 1;
        $login_session = DI()->notorm->user->select('login_session')->where("id",$user_id)->fetch();
        $login_token = $login_session['login_session'];
        $api_secret = strtolower(DI()->config->get('sys.api_secret'));

        foreach ($allApiS as $key => $item) {
            $tmpArr = array(strtolower($item['service']),$api_secret,'web','1.0');
            asort($tmpArr, SORT_STRING);
            $tmpStr = implode($tmpArr);
            $sign = md5($tmpStr);
            $link = $uri . '?service=' . $item['service'];
            $link_test = "{$test}?service={$item['service']}&sign={$sign}&ct=web&v=1.0&user_id={$user_id}&login_token={$login_token}";
            $NO = $num++;
            echo "<tr><td>{$NO}</td><td><a href=\"$link\" target='_blank'>{$item['service']}</a></td><td>{$item['title']}</td><td>{$item['desc']}</td><td><a href='{$link_test}' target='_blank'>测试</a> </td></tr>";
        }
        ?>
        </tbody>
    </table>

    <div role="alert" class="alert alert-warning">
        <h4>使用文档</h4>
        <table class="table table-hover table-bordered ">
            <tbody>
            <tr><td>接口地址：</td><td>
                    生产环境：http://clock.api.aibdai.com/v1/
                    <br>
                    测试环境 host：192.168.1.190/v1
                    <br>
                    请求方式：POST
                </td></tr>
            <tr>
                <td>请求参数</td>
                <td>service sign ct v</td>
            </tr>
            <tr>
                <td>sign生成规则</td>
                <td><dl><dt>请求参数：上面四个参数不区分大小写，全部会被转化为小写</dt>
                        <dd>服务service：例如访问User.login服务则值为user.login<br>
                            盐值：为私钥，找Api开发者要，例如aibdai<br>
                            版本号v：例如1.0<br>
                            客户端类型ct：例如ios
                        </dd>
                        <dt>按字母顺序正序排序</dt>
                        <dd>例如请求参数原顺序为 default.index，aibdai，1.0，ios<br>
                            排顺后<br>
                            1.0,aibdai,default.index,ios
                        </dd>
                        <dt>md5加密，变小写</dt>
                        <dd>0390eebb77f737f47e4281b692761cac</dd>
                    </dl>
                </td>
            </tr>
            <tr>
                <td>完整请求示例</td>
                <td>http://192.168.1.190/v1/?service=Default.Index&sign=0390eebb77f737f47e4281b692761cac&v=1.0&ct=ios</td>
            </tr>
            <tr>
                <td>签名测试</td>
                <td>
                    测试链接：<a href="/sign.php?service=User.Login&ct=web&v=1.0" target="_blank">http://192.168.1.190/sign.php?service=User.Login&ct=web&v=1.0</a><br>
                    请将service ct v参数换成自己的，该链接会提示签名生成步骤，最终会生成正确的签名，盐值请找API开发者要<br>
                    <strong class="text-info">请在App内部生成签名时将字符串全部转化为小写</strong>
                </td>
            </tr>
            </tbody>
        </table>
        <h4>H5页面参考</h4>
        <table class="table table-hover table-bordered ">
            <tbody>
            <tr>
                <td>用户协议</td>
                <td><a href="http://serviceapp.aibdai.com/h5/ag.html" target="_blank">http://serviceapp.aibdai.com/h5/ag.html</a></td>
            </tr>
            <tr>
                <td>活动详情案例1</td>
                <td><a href="http://serviceapp.aibdai.com/h5/Event1details1.html" target="_blank">http://serviceapp.aibdai.com/h5/Event1details1.html</a></td>
            </tr>
            <tr>
                <td>活动详情案例2</td>
                <td><a href="http://serviceapp.aibdai.com/h5/Event1details2.html" target="_blank">http://serviceapp.aibdai.com/h5/Event1details2.html</a></td>
            </tr>
            <tr>
                <td>心理测试题1</td>
                <td><a href="http://serviceapp.aibdai.com/h5/Test1details1.html" target="_blank">http://serviceapp.aibdai.com/h5/Test1details1.html</a></td>
            </tr>
            <tr>
                <td>心理测试题2</td>
                <td><a href="http://serviceapp.aibdai.com/h5/Test1details2.html" target="_blank">http://serviceapp.aibdai.com/h5/Test1details2.html</a></td>
            </tr>
	        <tr>
                <td>Android下载链接</td>
                <td><a href="http://serviceapp.aibdai.com/d/EnergyClock_beta.apk" target="_blank">http://serviceapp.aibdai.com/d/EnergyClock_beta.apk</a></td>
            </tr>
            <tr>
                <td>App下载页面</td>
                <td><a href="http://serviceapp.aibdai.com/energyclock/" target="_blank">http://serviceapp.aibdai.com/energyclock/</a></td>
            </tr>
            <tr>
                <td>微信分享页</td>
                <td><a href="http://serviceapp.aibdai.com/h5/wx.html" target="_blank">http://serviceapp.aibdai.com/h5/wx.html</a></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</div>

</body>
</html>
