<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-2-2
 * Time: 上午10:32
 */
 
$conn = mysqli_connect("127.0.0.1","root","123456","aibdai_clock");
mysqli_query($conn,"set names utf8");
$user_id = isset($_REQUEST['user_id']) ? $_REQUEST['user_id'] : 1;
$sql = "select login_session from `aibdai_user` where id = {$user_id}";
$query = mysqli_query($conn,$sql);
$info = mysqli_fetch_assoc($query);
$login_token = $info['login_session'];

echo "<p>当前用户id为{$user_id}</p>";
echo "<p>user_id = {$user_id}</p>";
echo '<p>此时login_token为</p>';
if($login_token){
    echo '<p>'.$login_token.'</p>';
    echo '<p><input value="'.$login_token.'"/>双击全选复制</p>';
} else {
    echo '<p>当前用户未登录，无login_token</p>';
}
echo <<<EXT
<form action="login_token.php" method="get">
    <p>你想查询的user_id为：<input type="text" name="user_id"/></p>
    <p><input type="submit" value="查询"> &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"/></p>
</form>
EXT;

