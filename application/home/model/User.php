<?php
namespace app\home\model;

use think\Model;

class User extends Model
{

    /**
     *   阿里云OSS 上传文件
     * @param type $fileName  待上传文件名 [或文件 base64, 或url]
     * @param type $savePath  => pics/l , pics/s ,
     * @param type $saveName  保存的文件名
     * @param type $filePath  待上传文件所在目录
     * @return type
     */
    public function aliSaveFile($fileName, $savePath, $saveName = '', $isContentSave = false, $isUrlSave = false, $filePath = TMP_PATH) {
        if ($saveName == '')
            $saveName = $fileName;

        require_once(ROOT_PATH . 'extend/Ali/sdk.class.php');
        $oss_sdk_service = new \ALIOSS();

        $object = $savePath . $saveName; // 保存的路径和文件名
        if ($isContentSave || $isUrlSave) {  // 通过内容上传
            $upload_file_options = array(
                'content' => $isUrlSave ? file_get_contents($fileName) : $fileName,
                'length' => strlen($fileName),
                \ALIOSS::OSS_HEADERS => array(
                    'Expires' => '2015-01-01 08:00:00',
                ),
            );
            $response = $oss_sdk_service->upload_file_by_content(ALI_BUCKET, $object, $upload_file_options);

        } else {  // 通过本地路径上传
            $file_path = $filePath . $fileName;  // 本地的文件路径名称
            $response = $oss_sdk_service->upload_file_by_file(ALI_BUCKET, $object, $file_path);
        }
        return $response;
    }


}