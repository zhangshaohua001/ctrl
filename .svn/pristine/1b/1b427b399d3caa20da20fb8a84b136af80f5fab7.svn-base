<?php
/**
 * Created by PhpStorm.
 * User: 田片
 * Email: tianpian0805@gmail.com
 * Date: 16-2-25
 * Time: 下午3:13
 */

$root = __DIR__.'/../Data/ban/';
$filename = isset($_GET['file']) ? $_GET['file'] : '';
$file = $root.'txt/'.$filename.'.txt';
if(file_exists($file)){
    if($data = file_get_contents($file)){
        $words_array = explode("|",$data);
        $resTrie = trie_filter_new(); //create an empty trie tree
        foreach ($words_array as $k => $v) {
            trie_filter_store($resTrie, $v);
        }
        if(trie_filter_save($resTrie, $root . "/tree/{$filename}.tree")){
            exit('<h1>success</h1>');
        } else {
            exit('<h1>error</h1>');
        }
    } else {
        exit('<h1>文件为空</h1>');
    }
} else {
    exit('<h1>文件不存在</h1>');
}