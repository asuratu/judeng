<?php
namespace app\home\controller;
use think\Request;
use think\Db;
class Chat extends Common
{

    /**
     * @Title: getToken
     * @Description: TODO 环信token
     */
    public function getToken(){
        //获取环信token
        import('Easemob', EXTEND_PATH);
        $options['client_id'] = config('client_id');
        $options['client_secret'] = config('client_secret');
        $options['org_name'] = config('org_name');
        $options['app_name'] = config('app_name');

        $h=new \Easemob($options);
        return $h->getToken();
    }


    /**
     * @Title: getChatDoc
     * @Description: TODO 定时导出聊天记录
     */
    public function getChatDoc(){
        import('Easemob', EXTEND_PATH);
        $options['client_id'] = config('client_id');
        $options['client_secret'] = config('client_secret');
        $options['org_name'] = config('org_name');
        $options['app_name'] = config('app_name');
        $h=new \Easemob($options);
        $timestamp = time();
        //时间戳转成2018052510(2017年5月25日上午10点的聊天记录)
//		$timeStr = intval(date('YmdH', $timestamp))-2;
        $timeStr = '2018052015';
        $result = $h->getHourRecord($timeStr);
        if (isset($result['error'])) {
            if ($result['error'] == 'storage_object_not_found') {
                //此时间段没记录产生

            } else {
                //失败

            }
        } else {
            //成功
            //将文件下载到本地
            foreach ($result['data'] as $key=>$value) {
                $url = $value['url'];
                $file = file_get_contents($url);
                $save_dir = 'resource/chatFile';
                $filename = $timeStr . $key . '.gz';
                $res = getFile($url, $save_dir, $filename,1);
                if (is_array($res)) {
                    unzip_gz($res['save_path']);
                }
                $file_path = '/'.$save_dir.'/'.$timeStr . $key;

                $map['add_data'] = $timeStr;
                $map['is_success'] = 1;
                $map['file_url'] = $file_path;
                db('chat_log')->insert($map);
//                $file_path = '/'.$save_dir.'/'.$timeStr . $key;
//                if(file_exists($file_path)){
//                    $fp = fopen($file_path,"r");
//                    $str ="";
//                    while(!feof($fp)){
//                        $str .= fgets($fp);//逐行读取。如果fgets不写length参数，默认是读取1k。
//                    }
//                    $str = str_replace("\r\n","<br />",$str);
//                    var_dump($str);die;
//                }
            }
            var_dump(2);die;
        }
    }
}