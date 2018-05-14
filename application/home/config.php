<?php
//配置文件
return [
    'view_replace_str'  =>  [
        '__PUBLIC__'=>__ROOT__.'/public',
        '__CSS__' => __ROOT__.'/public/home/css',
        '__JS__' => __ROOT__.'/public/home/js',
        '__IMG__' => __ROOT__.'/public/home/images',
        '--PUBLIC--' => __ROOT__.'/public',
    ],
    'key'=>'b946bc0dbbde213e504bc1c32616a769',
    'body'=>'【朗企科技】您的验证码：%s。如非本人操作，请忽略。',
    'outtime'=>300,//请求超时时间 300s

    //环信配置参数
    'client_id'=>'YXA6W_h-IFAUEeiIo4-HJ71spA',
    'client_secret'=>'YXA6gGJZnrPrMqhseWBRlYQLX8i2DDQ',
    'org_name'=>'1141180504253647',
    'app_name'=>'xiaojudeng',

    //接口域名
//    'url'=>'http://39.105.19.169:88',
    'url'=>'http://localhost:7037',

    //药房相关参数
    'lessCount'=>0,//药品库存预留量, 下单量大于该值无法下单
];
