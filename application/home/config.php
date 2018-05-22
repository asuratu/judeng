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

    //医生的绑定的科室数量上限
    'maxDepartNum'=>6,

    //oss配置
    "OSS_ACCESS_ID" => 'LTAIKPbNauq8fLsY',
    "OSS_ACCESS_KEY"=> 'J6AUfej2SGrPwmvtHl3tpkyFQLOwdR',
    "OSS_ENDPOINT"  => 'oss-cn-shanghai.aliyuncs.com',
    "OSS_TEST_BUCKET" => 'xiaojd1',
    "OSS_WEB_SITE" =>'http://xiaojd1.oss-cn-shanghai.aliyuncs.com',    //上面4个就不用介绍了，这个OSS_WEB_SITE是oss的bucket创建后的外网访问地址，如需二级域名，可以指向二级域名，具体可以参考阿里云控制台里面的oss

    //oss文件上传配置
    'oss_maxSize'=>1048576,    //1M
    'oss_exts'   =>array(// 设置附件上传类型
        'image/jpg',
        'image/gif',
        'image/png',
        'image/jpeg',
        'application/octet-stream',//阿里云好像都是通过二进制上传，似乎上面4个后缀设置起到什么用？
    ),
];
