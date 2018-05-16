<?php

namespace Service;

if (!defined('IN_PX'))
    exit;

use Tools\Auxi;

class UPFileOldImpl {

    const VERSION = '1.1.1';

    private function __Service() {

    }

//    private function __ImportResource($value = 'Vendors/Ali/sdk.class.php') {
//
//    }

    private function __Value($cfg, $setting) {

    }

    private $annexFolder = 'uploads'; //附件存放点，默认为：uploads
    private $upFileFolder = 'pics'; //附件存放点，默认为：pics
    private $normalFolder = 'n'; //普通大小的图片
    private $smallFolder = 's'; //缩略图存放路径，注：必须是放在 $annexFolder下的子目录，默认为：smallimg
    private $largeFolder = 'l'; //水印图片存放处 marking
    //上传的类型，默认为：jpg JPG,文件类型可以在此添加和修改
    private $aryPicExtName = null;
    private $aryFileExtName = null;
    private $aryUploadPath = null;
    private $uploadType = 'img';
    private $upPath = '';
    private $upFileMax = 51200; //上传大小限制，单位是“KB”，默认为：2m
    private $fontType; //字体
    private $largeWaterImg = 'largeLogo.png';
    private $normalWaterImg = 'logo.png';
    private $noneErr = true;
    private $siteName = '';

    public function __construct(& $setting, & $cfg) {
        require_once ROOT_PATH . 'Vendors/Ali/sdk.class.php';

        $this->annexFolder = ROOT_PATH . UPLOAD_FOLDER . DIRECTORY_SEPARATOR;
        $this->fontType = $this->annexFolder . 'arial.ttf';
        $this->aryPicExtName = & $setting['aryPicExtName'];
        $this->aryFileExtName = & $setting['aryFileExtName'];
        $this->aryUploadPath = & $setting['aryUploadPath'];
        $this->siteName = & $cfg['site_name'];
    }

    public function setFolder($folder = null) {
        if (!is_null($folder)) {
            $this->_createFolder('img', $folder);
        }
        return $this;
    }

    private function _createFolder($uploadType = 'img', $folder = null) {
        if ($this->aryUploadPath) {
            if (strcasecmp('img', $uploadType) == 0) {
                $this->upPath = explode('/'
                    , trim(is_null($folder) ? $this->aryUploadPath[0] : $folder
                        , '/'));
                $this->uploadType = 0; //图片
            } else {
                $this->upPath = explode('/', trim($this->aryUploadPath[1], '/'));
                $this->uploadType = 1;
            }
        } else {
            $this->upPath = $this->upFileFolder;
        }
        $this->upFileFolder = $this->annexFolder;
        foreach ($this->upPath as $_v) {
            $this->upFileFolder .= $_v . DIRECTORY_SEPARATOR;
            if (!is_dir($this->upFileFolder)) {
                @mkdir($this->upFileFolder, 0777);
                @chmod($this->upFileFolder, 0777);
            }
        }

        if (!is_dir(TMP_PATH)) {
            @mkdir(TMP_PATH, 0777);
            @chmod(TMP_PATH, 0777);
        }

        if ($this->uploadType == 0 && strlen($this->smallFolder) == 1) {//图片
            $this->smallFolder = $this->upFileFolder . $this->smallFolder . DIRECTORY_SEPARATOR;
            $this->largeFolder = $this->upFileFolder . $this->largeFolder . DIRECTORY_SEPARATOR;
            $this->normalFolder = $this->upFileFolder . $this->normalFolder . DIRECTORY_SEPARATOR;
            if (!is_dir($this->smallFolder))
                @mkdir($this->smallFolder, 0777);
            @chmod($this->smallFolder, 0777);
            if (!is_dir($this->largeFolder))
                @mkdir($this->largeFolder, 0777);
            @chmod($this->largeFolder, 0777);
            if (CREATE_NORMAL_IMG && !is_dir($this->normalFolder))
                @mkdir($this->normalFolder, 0777);
            @chmod($this->normalFolder, 0777);
        }
    }


    /**
     * 定制上传后裁剪
     * TODO: php5.5.18中使用 move_uploaded_file 后无法进行裁剪
     * 需要充分测试
     * @param type $inputName
     * @param type $width
     * @param type $height
     * @return string
     */
    public function bmupload($inputName, $width = 800, $height = 800) {
        if ($_FILES[$inputName]['size'] <= 0) {
            $this->noneErr = false;
            return '请选择您要上传的文件！';
        }
        if ((round($_FILES[$inputName]['size'] / 1024)) > $this->upFileMax) {
            $this->noneErr = false;
            return '文件不允许超过 ' . $this->upFileMax . ' k';
        }
        $_fileExt = strrchr(strtolower($_FILES[$inputName]['name']), '.');
        if ($this->aryPicExtName && $this->aryFileExtName) {
            if (!in_array($_fileExt, $this->aryPicExtName) && $this->uploadType == 0) {
                $this->noneErr = false;
                return '请选择允许的图片格式上传';
            }
            if (!in_array($_fileExt, $this->aryFileExtName) && $this->uploadType == 1) {
                $this->noneErr = false;
                return '请选择允许的文件格式上传';
            }
        }
        $_tempFileName = date('Ymd,h,i,s') . \Tools\Auxi::randomNum() . $_fileExt;
        if (is_file($this->normalFolder . $_tempFileName)) {
            $this->noneErr = false;
            return '此文件已存在，请重新上传';
        }

        if ($this->noneErr) {
//            $this->_createFolder('img');
//
//            $_newFile = TMP_PATH . $_tempFileName;
//            $_srcPath = $_FILES[$inputName]['tmp_name'];
//            list($_srcW, $_srcH, $_type) = getimagesize($_srcPath);
//
//            if ($_srcW < $width && $_srcH < $height) {
//                move_uploaded_file($_srcPath, $_newFile);
//            } else {
//                $_width = ($width > $_srcW) ? $_srcW : $width;
//                $_height = ($height > $_srcH) ? $_srcH : $height;
//                if ($_srcW * $_width > $_srcH * $_height) {
//                    $_height = round($_srcH * $_width / $_srcW);
//                } else {
//                    $_width = round($_srcW * $_height / $_srcH);
//                }
//                switch ($_type) {
//                    case 1:
//                        $_imgHandle = imagecreatefromgif($_srcPath);
//                        break;
//                    case 2:
//                        $_imgHandle = imagecreatefromjpeg($_srcPath);
//                        break;
//                    case 3:
//                        $_imgHandle = imagecreatefrompng($_srcPath);
//                        imagesavealpha($_imgHandle, true); //保持透明
//                        break;
//                    default:
//                        $this->noneErr = false;
//                        return '未知图片格式';
//                        break;
//                }
////                $_imgHandle = imagecreatefromjpeg($_srcPath);
//                $_tempImg = imagecreatetruecolor($_width, $_height);
//                imagealphablending($_tempImg, false);
//                imagesavealpha($_tempImg, true);
//                imagecopyresampled($_tempImg, $_imgHandle, 0, 0, 0, 0, $_width, $_height, $_srcW, $_srcH);
//                imagejpeg($_tempImg, $_newFile, 90);
//                @chmod($_newFile, 0777);
//                imagedestroy($_imgHandle);
//                imagedestroy($_tempImg);
//                if (is_file($_srcPath)) {
//                    @chmod($_srcPath, 0777);
//                    @unlink($_srcPath);
//                }
//            }
            $this->aliSaveFile($_FILES[$inputName]['tmp_name'], 'tmp/', $_tempFileName, '', '', '');
            return $_tempFileName;
        }
    }

    /**
     * 上传图片并获取上传之后的图片或文件名
     * @param type $inputName
     * @param type $importMode
     * @param type $uploadType
     * @param type $this->aryUploadPath
     * @return string
     */
    public function upload($inputName, $importMode = 'fileNameSysWrite', $uploadType = 'img', $needMark = false) {
        if ($_FILES[$inputName]['size'] <= 0) {
            $this->noneErr = false;
            return '请选择您要上传的文件！';
        }
        if ((round($_FILES[$inputName]['size'] / 1024)) > $this->upFileMax) {
            $this->noneErr = false;
            return '文件不允许超过 ' . $this->upFileMax . ' k';
        }
        $_fileExt = strrchr(strtolower($_FILES[$inputName]['name']), '.');
        $this->_createFolder($uploadType);
        if ($this->aryPicExtName && $this->aryFileExtName) {
            if (!in_array($_fileExt, $this->aryPicExtName) && $this->uploadType == 0) {
                $this->noneErr = false;
                return '请选择允许的图片格式上传';
            }
            if (!in_array($_fileExt, $this->aryFileExtName) && $this->uploadType == 1) {
                $this->noneErr = false;
                return '请选择允许的文件格式上传';
            }
        }
        if (strcasecmp('fileNameSysWrite', $importMode) == 0) {
            $_tempFileName = date('Ymd,h,i,s') . \Tools\Auxi::randomNum() . $_fileExt;
        } else {
            $_tempFileName = strtolower($_FILES[$inputName]['name']);
        }
        if (is_file($this->normalFolder . $_tempFileName)) {
            $this->noneErr = false;
            return '此文件已存在，请重新上传';
        }
        if ($this->noneErr) {
            //扔入临时文件夹中
//            move_uploaded_file($_FILES[$inputName]['tmp_name']
//                    , ($this->uploadType == 0 ? TMP_PATH : $this->upFileFolder)
//                    . $_tempFileName);
//            return $_tempFileName;

            //先生成原图，没有水印
            $this->aliSaveFile($_FILES[$inputName]['tmp_name'], 'tmp/', 'org-' . $_tempFileName, '', '', '');


            if ($needMark) {
                //大图水印
                //\logger::debug($_FILES[$inputName]['tmp_name']);
                $_tmp = $this->imageWaterMark($_FILES[$inputName]['tmp_name'], WATER_POS
                    , $this->annexFolder . $this->largeWaterImg);
                //die(var_dump($this->annexFolder,111111));
            }

            $this->aliSaveFile($_FILES[$inputName]['tmp_name'], 'tmp/', $_tempFileName, '', '', '');
            return $_tempFileName;
        }
    }

    /**
     *  使用阿里云的当时创建图片
     */
    public function createImg($src, $markImg = MARK_IMG, $textMark = TEXT_MARK
        , $smallWidth = SMALL_WIDTH, $smallHeight = SMALL_HEIGHT) {
        $_srcPath = IMG_SERVER . 'tmp/' . $src;
        // TODO  需要截取小图
//        if ($markImg) { // 水印  TODO  无法使用!!
//            //大图水印
////            $_tmp = $this->imageWaterMark($this->largeFolder . $src, WATER_POS
////                    , $this->annexFolder . $this->largeWaterImg);
//            $_tmp = $this->aliImageWaterMark(IMG_SERVER . 'test/' . $src, WATER_POS
//                    , $this->annexFolder . $this->largeWaterImg);
//            if (!$this->noneErr) {
//                return $_tmp;
//            }
//        }
        //\logger::debug($src);
        //生成原图
        $this->aliCopyObject('tmp/org-' . $src, 'pics/l/org-' . $src);
        return $this->aliCopyObject('tmp/' . $src, 'pics/l/' . $src);
    }

    public function testMark($filepath = '') {
        $_tmp = $this->imageWaterMark($filepath, WATER_POS
            , $this->annexFolder . $this->largeWaterImg);
    }

    public function ori_createImg($src, $markImg = MARK_IMG, $textMark = TEXT_MARK
        , $smallWidth = SMALL_WIDTH, $smallHeight = SMALL_HEIGHT) {
        if ($src && is_file(TMP_PATH . $src)) {
            $_srcPath = TMP_PATH . $src;
            $_srcInfo = $this->_getInfo($_srcPath);
            //$_photo = $_srcPath; //获得图片源
            switch ($_srcInfo['type']) {
                case 1:
                    $_imgHandle = imagecreatefromgif($_srcPath);
                    break;
                case 2:
                    $_imgHandle = imagecreatefromjpeg($_srcPath);
                    break;
                case 3:
                    $_imgHandle = imagecreatefrompng($_srcPath);
                    imagesavealpha($_imgHandle, true); //保持透明
                    break;
                default:
                    $this->noneErr = false;
                    return '未知图片格式';
                    break;
            }

            $this->_createFolder('img');

            //创建800大图
            $_largeImg = $this->_createImg($_imgHandle, $this->largeFolder, $_srcInfo, 2000, 2000);
//            if (CREATE_NORMAL_IMG)
//                $_normalImg = $this->_createImg($_imgHandle, $this->normalFolder, $_srcInfo, 300, 300);
//            $_smallImg = $this->_createImg($_imgHandle, $this->smallFolder, $_srcInfo, $smallWidth, $smallHeight);

            imagedestroy($_imgHandle);

            //删除源图
            @unlink($_srcPath);
            if ($markImg) {
                if ($textMark) {
                    $this->imageWaterMark($this->largeFolder . $src, WATER_POS
                        , $this->siteName, false, 5, '#ff0000');
                } else {
                    //大图水印
                    $_tmp = $this->imageWaterMark($this->largeFolder . $src, WATER_POS
                        , $this->annexFolder . $this->largeWaterImg);

                    //中图水印
                    if (CREATE_NORMAL_IMG) {
                        $_tmp = $this->imageWaterMark($this->normalFolder . $src, WATER_POS
                            , $this->annexFolder . $this->normalWaterImg);
                    }
                    if (!$this->noneErr) {
                        return $_tmp;
                    }
                }
            }
            return true;
        }
        return false;
    }

    public function createSpecialImg($src, $markImg = MARK_IMG, $textMark = TEXT_MARK
        , $smallWidth = SMALL_WIDTH, $smallHeight = SMALL_HEIGHT, $special = 'tmp') {
        if ($src && is_file(TMP_PATH . $src)) {
            $_srcPath = TMP_PATH . $src;
            $_srcInfo = $this->_getInfo($_srcPath);
            //$_photo = $_srcPath; //获得图片源
            //\logger::debug($_srcInfo);
            //ini_set('memory_limit','512MB'); // 处理大图片,截取10M 的图片需要512M 左右
            switch ($_srcInfo['type']) {
                case 1:
                    $_imgHandle = imagecreatefromgif($_srcPath);
                    break;
                case 2:
                    $_imgHandle = imagecreatefromjpeg($_srcPath);
                    break;
                case 3:
                    $_imgHandle = imagecreatefrompng($_srcPath);
                    imagesavealpha($_imgHandle, true); //保持透明
                    break;
                default:
                    $this->noneErr = false;
                    return '未知图片格式';
                    break;
            }
            if ($special == 'tmp') {
                $_smallImg = $this->_createImg($_imgHandle, TMP_PATH, $_srcInfo, $smallWidth, $smallHeight);
                imagedestroy($_imgHandle);
                return;
            }
            $this->_createFolder('img');
            if ($special == 'small') {
                $_smallImg = $this->_createImg($_imgHandle, $this->smallFolder, $_srcInfo, $smallWidth, $smallHeight);
            } else {
                $_smallImg = $this->_createImg($_imgHandle, $this->largeFolder, $_srcInfo, $smallWidth, $smallHeight);
            }
            imagedestroy($_imgHandle);
            //删除源图
            @unlink($_srcPath);


//            if ($markImg) {
//                if ($textMark) {
//                    $this->imageWaterMark($this->largeFolder . $src, WATER_POS
//                            , $this->siteName, false, 5, '#ff0000');
//                } else {
//                    //大图水印
//                    $_tmp = $this->imageWaterMark($this->largeFolder . $src, WATER_POS
//                            , $this->annexFolder . $this->largeWaterImg);
//
//                    //中图水印
//                    if (CREATE_NORMAL_IMG) {
//                        $_tmp = $this->imageWaterMark($this->normalFolder . $src, WATER_POS
//                                , $this->annexFolder . $this->normalWaterImg);
//                    }
//                    if (!$this->noneErr) {
//                        return $_tmp;
//                    }
//                }
//            }
            return true;
        }
        return false;
    }

    public function userImg($inputName) {
        $_r = $this->upload($inputName);
        if ($this->noneErr) {
            $_tmp = $this->_createImg($_r);
            //会员图片出错情况下全部删除
            if (!$this->noneErr) {
                @unlink($this->largeFolder . $src);
                @unlink($this->normalFolder . $src);
                @unlink($this->smallFolder . $src);
                return $_tmp;
            }
        }
        return $_r;
    }

    /**
     *  远程图片添加水印
    @param string $imgSrc 背景图片，即需要加水印的图片，暂只支持GIF,JPG,PNG格式；
    @param type $waterPos 水印位置，有10种状态，0为随机位置；
     * 					      1为顶端居左，2为顶端居中，3为顶端居右；
     * 					      4为中部居左，5为中部居中，6为中部居右；
     * 				          7为底端居左，8为底端居中，9为底端居右；
    @param string $waterSrc 图片水印的图片源或者文字水印的文字 文字水印，即把文字作为为水印，支持ASCII码，不支持中文；
    @param type $isUseWaterImage 是否使用水印图片
    @param type $textFont 文字大小，值为1、2、3、4或5，默认为5；
    @param type $textColor 文字颜色，值为十六进制颜色值，默认为#ff0000(红色)；
    @return type
     */
    public function aliImageWaterMark($imgSrc, $waterPos = 5, $waterSrc = null, $isUseWaterImage = true
        , $textFont = 5, $textColor = '#ff0000') {

        //读取背景图片
        if (@fopen($imgSrc, 'r')) {  // 判断图片是否存在
            $_imgSrcInfo = getimagesize($imgSrc);
            $_groundW = $_imgSrcInfo[0]; //取得背景图片的宽
            $_groundH = $_imgSrcInfo[1]; //取得背景图片的高
            switch ($_imgSrcInfo[2]) { //取得背景图片的格式
                case 1 :
                    $_imgSrcIm = imagecreatefromgif($imgSrc);
                    break;
                case 2 :
                    $_imgSrcIm = imagecreatefromjpeg($imgSrc);
                    break;
                case 3 :
                    $_imgSrcIm = imagecreatefrompng($imgSrc);
                    imagesavealpha($_imgHandle, true);
                    break;
                default:
                    $this->noneErr = false;
                    return '背景图片格式未知';
                    break;
            }
        } else {
            $this->noneErr = false;
            return '需要加水印的图片不存在！';
        }
        //读取水印文件
        $_waterInfo = null;
        if (is_null($waterSrc)) {
            $waterSrc = $this->annexFolder . $this->normalWaterImg;
            $_waterInfo = getimagesize($waterSrc);
            $_waterW = $_waterInfo[0]; //取得水印图片的宽
            $_waterH = $_waterInfo[1]; //取得水印图片的高
            //如果图片比小水印宽高大两倍以上则使用大水印
            //一般为宽高600像素或者宽度持平但是高度大于500以上图片
            if (($_groundW > $_waterW * 5 && $_groundH > $_waterH * 5) || ($_groundW > $_waterW && $_groundH > $_waterW * 5)) {
                $waterSrc = $this->annexFolder . $this->largeWaterImg;
                unset($_waterInfo);
                $_waterInfo = null;
            }
        }
        if (is_file($waterSrc)) {
            if (is_null($_waterInfo)) {
                $_waterInfo = getimagesize($waterSrc);
                $_waterW = $_waterInfo[0];
                $_waterH = $_waterInfo[1];
            }
            switch ($_waterInfo[2]) { //取得水印图片的格式
                case 1 :
                    $_waterIm = imagecreatefromgif($waterSrc);
                    break;
                case 2 :
                    $_waterIm = imagecreatefromjpeg($waterSrc);
                    break;
                case 3 :
                    $_waterIm = imagecreatefrompng($waterSrc);
                    imagesavealpha($_waterIm, true);
                    break;
                default:
                    $this->noneErr = false;
                    return '水印图片格式未知';
                    break;
            }
        }
        //水印位置
        if ($isUseWaterImage) { //图片水印
            $_w = $_waterW;
            $_h = $_waterH;
            $_label = '图片的';
        } else {   //文字水印
            //取得使用 TrueType 字体的文本的范围
            $temp = imagettfbbox(ceil($textFont * 5.5), 0, $this->fontType, $waterSrc);
            $_w = $temp[2] - $temp[6];
            $_h = $temp[3] - $temp[7];
            unset($temp);
            $_label = '文字区域';
        }
        if ($_groundW < $_w || $_groundH < $_h) {
            $this->noneErr = false;
            return '图片的长宽比水印' . $_label . '还小，请上传宽度大于300像素的图片！';
        }
        switch ($waterPos) {
            case 0://随机
                $posX = rand(0, ($_groundW - $_w));
                $posY = rand(0, ($_groundH - $_h));
                break;
            case 1://1为顶端居左
                $posX = 0;
                $posY = 0;
                break;
            case 2://2为顶端居中
                $posX = ($_groundW - $_w) / 2;
                $posY = 0;
                break;
            case 3://3为顶端居右
                $posX = $_groundW - $_w;
                $posY = 0;
                break;
            case 4://4为中部居左
                $posX = 0;
                $posY = ($_groundH - $_h) / 2;
                break;
            case 5://5为中部居中
                $posX = ($_groundW - $_w) / 2;
                $posY = ($_groundH - $_h) / 2;
                break;
            case 6://6为中部居右
                $posX = $_groundW - $_w;
                $posY = ($_groundH - $_h) / 2;
                break;
            case 7://7为底端居左
                $posX = 0;
                $posY = $_groundH - $_h;
                break;
            case 8://8为底端居中
                $posX = ($_groundW - $_w) / 2;
                $posY = $_groundH - $_h;
                break;
            case 9://9为底端居右
                $posX = $_groundW - $_w;
                $posY = $_groundH - $_h;
                break;
            default://随机
                $posX = rand(0, ($_groundW - $_w));
                $posY = rand(0, ($_groundH - $_h));
                break;
        }
        //设定图像的混色模式
        imagealphablending($_imgSrcIm, true);
        if ($isUseWaterImage) { //图片水印
            imagecopy($_imgSrcIm, $_waterIm, $posX, $posY, 0, 0, $_waterW, $_waterH); //拷贝水印到目标文件
        } else {//文字水印
            if (!empty($textColor) && (strlen($textColor) == 7)) {
                $R = hexdec(substr($textColor, 1, 2));
                $G = hexdec(substr($textColor, 3, 2));
                $B = hexdec(substr($textColor, 5));
            } else {
                $this->noneErr = false;
                imagedestroy($_imgSrcIm);
                return '水印文字颜色格式不正确！';
            }
            imagestring($_imgSrcIm, $textFont, $posX, $posY, $waterSrc
                , imagecolorallocate($_imgSrcIm, $R, $G, $B));
        }
        //生成水印后的图片
        //@unlink($imgSrc);
        switch ($_imgSrcInfo[2]) { //取得背景图片的格式
            case 1 :
                imagegif($_imgSrcIm, $imgSrc);
                break;
            case 3 :
                imagepng($_imgSrcIm, $imgSrc);
                break;
            default:
                imagejpeg($_imgSrcIm, $imgSrc, 90); //统一生成jpg格式
                break;
        }
        //释放内存
        if (isset($_waterInfo))
            unset($_waterInfo);
        if (isset($_waterIm))
            imagedestroy($_waterIm);
        unset($_imgSrcInfo);

        imagedestroy($_imgSrcIm);
    }

    /**
     *
    @param string $imgSrc 背景图片，即需要加水印的图片，暂只支持GIF,JPG,PNG格式；
    @param type $waterPos 水印位置，有10种状态，0为随机位置；
     * 					      1为顶端居左，2为顶端居中，3为顶端居右；
     * 					      4为中部居左，5为中部居中，6为中部居右；
     * 				          7为底端居左，8为底端居中，9为底端居右；
    @param string $waterSrc 图片水印的图片源或者文字水印的文字 文字水印，即把文字作为为水印，支持ASCII码，不支持中文；
    @param type $isUseWaterImage 是否使用水印图片
    @param type $textFont 文字大小，值为1、2、3、4或5，默认为5；
    @param type $textColor 文字颜色，值为十六进制颜色值，默认为#ff0000(红色)；
    @return type
     */
    public function imageWaterMark($imgSrc, $waterPos = 5, $waterSrc = null, $isUseWaterImage = true
        , $textFont = 5, $textColor = '#ff0000') {

        //读取背景图片
        if (is_file($imgSrc)) {
            $_imgSrcInfo = getimagesize($imgSrc);
            $_groundW = $_imgSrcInfo[0]; //取得背景图片的宽
            $_groundH = $_imgSrcInfo[1]; //取得背景图片的高
            switch ($_imgSrcInfo[2]) { //取得背景图片的格式
                case 1 :
                    $_imgSrcIm = imagecreatefromgif($imgSrc);
                    break;
                case 2 :
                    $_imgSrcIm = imagecreatefromjpeg($imgSrc);
                    break;
                case 3 :
                    $_imgSrcIm = imagecreatefrompng($imgSrc);
                    imagesavealpha($_imgHandle, true);
                    break;
                default:
                    $this->noneErr = false;
                    return '背景图片格式未知';
                    break;
            }
        } else {
            $this->noneErr = false;
            return '需要加水印的图片不存在！';
        }
        //读取水印文件
        $_waterInfo = null;
        if (is_null($waterSrc)) {
            $waterSrc = $this->annexFolder . $this->normalWaterImg;
            $_waterInfo = getimagesize($waterSrc);
            $_waterW = $_waterInfo[0]; //取得水印图片的宽
            $_waterH = $_waterInfo[1]; //取得水印图片的高
            //如果图片比小水印宽高大两倍以上则使用大水印
            //一般为宽高600像素或者宽度持平但是高度大于500以上图片
            if (($_groundW > $_waterW * 5 && $_groundH > $_waterH * 5) || ($_groundW > $_waterW && $_groundH > $_waterW * 5)) {
                $waterSrc = $this->annexFolder . $this->largeWaterImg;
                unset($_waterInfo);
                $_waterInfo = null;
            }
        }
        if (is_file($waterSrc)) {
            if (is_null($_waterInfo)) {
                $_waterInfo = getimagesize($waterSrc);
                $_waterW = $_waterInfo[0];
                $_waterH = $_waterInfo[1];
            }
            switch ($_waterInfo[2]) { //取得水印图片的格式
                case 1 :
                    $_waterIm = imagecreatefromgif($waterSrc);
                    break;
                case 2 :
                    $_waterIm = imagecreatefromjpeg($waterSrc);
                    break;
                case 3 :
                    $_waterIm = imagecreatefrompng($waterSrc);
                    imagesavealpha($_waterIm, true);
                    break;
                default:
                    $this->noneErr = false;
                    return '水印图片格式未知';
                    break;
            }
        }
        //水印位置
        if ($isUseWaterImage) { //图片水印
            $_w = $_waterW;
            $_h = $_waterH;
            $_label = '图片的';
        } else {   //文字水印
            //取得使用 TrueType 字体的文本的范围
            $temp = imagettfbbox(ceil($textFont * 5.5), 0, $this->fontType, $waterSrc);
            $_w = $temp[2] - $temp[6];
            $_h = $temp[3] - $temp[7];
            unset($temp);
            $_label = '文字区域';
        }
        if ($_groundW < $_w || $_groundH < $_h) {
            $this->noneErr = false;
            return '图片的长宽比水印' . $_label . '还小，请上传宽度大于300像素的图片！';
        }
        switch ($waterPos) {
            case 0://随机
                $posX = rand(0, ($_groundW - $_w));
                $posY = rand(0, ($_groundH - $_h));
                break;
            case 1://1为顶端居左
                $posX = 0;
                $posY = 0;
                break;
            case 2://2为顶端居中
                $posX = ($_groundW - $_w) / 2;
                $posY = 0;
                break;
            case 3://3为顶端居右
                $posX = $_groundW - $_w;
                $posY = 0;
                break;
            case 4://4为中部居左
                $posX = 0;
                $posY = ($_groundH - $_h) / 2;
                break;
            case 5://5为中部居中
                $posX = ($_groundW - $_w) / 2;
                $posY = ($_groundH - $_h) / 2;
                break;
            case 6://6为中部居右
                $posX = $_groundW - $_w;
                $posY = ($_groundH - $_h) / 2;
                break;
            case 7://7为底端居左 , 改动偏移
                $posX = 20;
                $posY = $_groundH - $_h - 30;
                break;
            case 8://8为底端居中
                $posX = ($_groundW - $_w) / 2;
                $posY = $_groundH - $_h;
                break;
            case 9://9为底端居右
                $posX = $_groundW - $_w;
                $posY = $_groundH - $_h;
                break;
            default://随机
                $posX = rand(0, ($_groundW - $_w));
                $posY = rand(0, ($_groundH - $_h));
                break;
        }
        //设定图像的混色模式
        imagealphablending($_imgSrcIm, true);
        if ($isUseWaterImage) { //图片水印
            imagecopy($_imgSrcIm, $_waterIm, $posX, $posY, 0, 0, $_waterW, $_waterH); //拷贝水印到目标文件
        } else {//文字水印
            if (!empty($textColor) && (strlen($textColor) == 7)) {
                $R = hexdec(substr($textColor, 1, 2));
                $G = hexdec(substr($textColor, 3, 2));
                $B = hexdec(substr($textColor, 5));
            } else {
                $this->noneErr = false;
                imagedestroy($_imgSrcIm);
                return '水印文字颜色格式不正确！';
            }
            imagestring($_imgSrcIm, $textFont, $posX, $posY, $waterSrc
                , imagecolorallocate($_imgSrcIm, $R, $G, $B));
        }
        //生成水印后的图片
        @unlink($imgSrc);
        switch ($_imgSrcInfo[2]) { //取得背景图片的格式
            case 1 :
                imagegif($_imgSrcIm, $imgSrc);
                break;
            case 3 :
                imagepng($_imgSrcIm, $imgSrc);
                break;
            default:
                imagejpeg($_imgSrcIm, $imgSrc, 90); //统一生成jpg格式
                break;
        }
        //释放内存
        if (isset($_waterInfo))
            unset($_waterInfo);
        if (isset($_waterIm))
            imagedestroy($_waterIm);
        unset($_imgSrcInfo);

        imagedestroy($_imgSrcIm);
    }

    public function ori_imageWaterMark($imgSrc, $waterPos = 5, $waterSrc = null, $isUseWaterImage = true
        , $textFont = 5, $textColor = '#ff0000') {

        //读取背景图片
        if (is_file($imgSrc)) {
            $_imgSrcInfo = getimagesize($imgSrc);
            $_groundW = $_imgSrcInfo[0]; //取得背景图片的宽
            $_groundH = $_imgSrcInfo[1]; //取得背景图片的高
            switch ($_imgSrcInfo[2]) { //取得背景图片的格式
                case 1 :
                    $_imgSrcIm = imagecreatefromgif($imgSrc);
                    break;
                case 2 :
                    $_imgSrcIm = imagecreatefromjpeg($imgSrc);
                    break;
                case 3 :
                    $_imgSrcIm = imagecreatefrompng($imgSrc);
                    imagesavealpha($_imgHandle, true);
                    break;
                default:
                    $this->noneErr = false;
                    return '背景图片格式未知';
                    break;
            }
        } else {
            $this->noneErr = false;
            return '需要加水印的图片不存在！';
        }
        //读取水印文件
        $_waterInfo = null;
        if (is_null($waterSrc)) {
            $waterSrc = $this->annexFolder . $this->normalWaterImg;
            $_waterInfo = getimagesize($waterSrc);
            $_waterW = $_waterInfo[0]; //取得水印图片的宽
            $_waterH = $_waterInfo[1]; //取得水印图片的高
            //如果图片比小水印宽高大两倍以上则使用大水印
            //一般为宽高600像素或者宽度持平但是高度大于500以上图片
            if (($_groundW > $_waterW * 5 && $_groundH > $_waterH * 5) || ($_groundW > $_waterW && $_groundH > $_waterW * 5)) {
                $waterSrc = $this->annexFolder . $this->largeWaterImg;
                unset($_waterInfo);
                $_waterInfo = null;
            }
        }
        if (is_file($waterSrc)) {
            if (is_null($_waterInfo)) {
                $_waterInfo = getimagesize($waterSrc);
                $_waterW = $_waterInfo[0];
                $_waterH = $_waterInfo[1];
            }
            switch ($_waterInfo[2]) { //取得水印图片的格式
                case 1 :
                    $_waterIm = imagecreatefromgif($waterSrc);
                    break;
                case 2 :
                    $_waterIm = imagecreatefromjpeg($waterSrc);
                    break;
                case 3 :
                    $_waterIm = imagecreatefrompng($waterSrc);
                    imagesavealpha($_waterIm, true);
                    break;
                default:
                    $this->noneErr = false;
                    return '水印图片格式未知';
                    break;
            }
        }
        //水印位置
        if ($isUseWaterImage) { //图片水印
            $_w = $_waterW;
            $_h = $_waterH;
            $_label = '图片的';
        } else {   //文字水印
            //取得使用 TrueType 字体的文本的范围
            $temp = imagettfbbox(ceil($textFont * 5.5), 0, $this->fontType, $waterSrc);
            $_w = $temp[2] - $temp[6];
            $_h = $temp[3] - $temp[7];
            unset($temp);
            $_label = '文字区域';
        }
        if ($_groundW < $_w || $_groundH < $_h) {
            $this->noneErr = false;
            return '图片的长宽比水印' . $_label . '还小，请上传宽度大于300像素的图片！';
        }
        switch ($waterPos) {
            case 0://随机
                $posX = rand(0, ($_groundW - $_w));
                $posY = rand(0, ($_groundH - $_h));
                break;
            case 1://1为顶端居左
                $posX = 0;
                $posY = 0;
                break;
            case 2://2为顶端居中
                $posX = ($_groundW - $_w) / 2;
                $posY = 0;
                break;
            case 3://3为顶端居右
                $posX = $_groundW - $_w;
                $posY = 0;
                break;
            case 4://4为中部居左
                $posX = 0;
                $posY = ($_groundH - $_h) / 2;
                break;
            case 5://5为中部居中
                $posX = ($_groundW - $_w) / 2;
                $posY = ($_groundH - $_h) / 2;
                break;
            case 6://6为中部居右
                $posX = $_groundW - $_w;
                $posY = ($_groundH - $_h) / 2;
                break;
            case 7://7为底端居左
                $posX = 0;
                $posY = $_groundH - $_h;
                break;
            case 8://8为底端居中
                $posX = ($_groundW - $_w) / 2;
                $posY = $_groundH - $_h;
                break;
            case 9://9为底端居右
                $posX = $_groundW - $_w;
                $posY = $_groundH - $_h;
                break;
            default://随机
                $posX = rand(0, ($_groundW - $_w));
                $posY = rand(0, ($_groundH - $_h));
                break;
        }
        //设定图像的混色模式
        imagealphablending($_imgSrcIm, true);
        if ($isUseWaterImage) { //图片水印
            imagecopy($_imgSrcIm, $_waterIm, $posX, $posY, 0, 0, $_waterW, $_waterH); //拷贝水印到目标文件
        } else {//文字水印
            if (!empty($textColor) && (strlen($textColor) == 7)) {
                $R = hexdec(substr($textColor, 1, 2));
                $G = hexdec(substr($textColor, 3, 2));
                $B = hexdec(substr($textColor, 5));
            } else {
                $this->noneErr = false;
                imagedestroy($_imgSrcIm);
                return '水印文字颜色格式不正确！';
            }
            imagestring($_imgSrcIm, $textFont, $posX, $posY, $waterSrc
                , imagecolorallocate($_imgSrcIm, $R, $G, $B));
        }
        //生成水印后的图片
        @unlink($imgSrc);
        switch ($_imgSrcInfo[2]) { //取得背景图片的格式
            case 1 :
                imagegif($_imgSrcIm, $imgSrc);
                break;
            case 3 :
                imagepng($_imgSrcIm, $imgSrc);
                break;
            default:
                imagejpeg($_imgSrcIm, $imgSrc, 90); //统一生成jpg格式
                break;
        }
        //释放内存
        if (isset($_waterInfo))
            unset($_waterInfo);
        if (isset($_waterIm))
            imagedestroy($_waterIm);
        unset($_imgSrcInfo);

        imagedestroy($_imgSrcIm);
    }

    public static function deleteFile($fileName, $uploadType = 'img', $uploadPath = array('pics', 'files')) {

        require_once CORE_PATH . 'Vendors/Ali/sdk.class.php';
        // 删除ali oss 上的临时目录文件
        self::aliDelteObject('tmp/' . $fileName, null);
        self::aliDelteObject('pics/l/' . $fileName, null);
        self::aliDelteObject('pics/s/' . $fileName, null);
        self::aliDelteObject('pics/l/' . 'org-' . $fileName, null); //删除原图


        return true;

        $_delFilePath = ROOT_PATH . UPLOAD_FOLDER . DIRECTORY_SEPARATOR;
        $_tempPath = '';
        if (strcasecmp('img', $uploadType) == 0) { //如果是图片
            if (is_file(TMP_PATH . $fileName)) {
                @unlink(TMP_PATH . $fileName);
            }
            $_tempPath = $_delFilePath . str_replace('/', DIRECTORY_SEPARATOR, $uploadPath[0])
                . DIRECTORY_SEPARATOR;
            if (is_file($_tempPath . 's' . DIRECTORY_SEPARATOR . $fileName)) {
                @unlink($_tempPath . 'l' . DIRECTORY_SEPARATOR . $fileName);
                if (CREATE_NORMAL_IMG)
                    @unlink($_tempPath . 'n' . DIRECTORY_SEPARATOR . $fileName);
                @unlink($_tempPath . 's' . DIRECTORY_SEPARATOR . $fileName);
            }
        } else {
            if (is_file($_delFilePath . $uploadPath[1] . DIRECTORY_SEPARATOR . $fileName))
                @unlink($_delFilePath . $uploadPath[1] . DIRECTORY_SEPARATOR . $fileName);
        }
        return true;
    }

    /**
     * 获取上传的图片的信息放入数组中
     * @param type $src
     * @return type
     */
    private function _getInfo($src) {
        $_imgInfo = getimagesize($src);
        $_aryInfo = array();
        $_aryInfo['src'] = $src;
        $_aryInfo['width'] = $_imgInfo[0];
        $_aryInfo['height'] = $_imgInfo[1];
        $_aryInfo['type'] = $_imgInfo[2];
        $_aryInfo['name'] = basename($src);
        return $_aryInfo;
    }

    /**
     * 将获取的上传图片转成指定大小的缩略图
     * @param type $imgHandle
     * @param type $path
     * @param type $srcInfo
     * @param type $width
     * @param type $height
     * @return type
     */
    private function _createImg($imgHandle, $path, $srcInfo, $width, $height) {
        //$_srcName = $srcInfo['name']; //缩略图片名称
        $_srcW = $srcInfo['width'];
        $_srcH = $srcInfo['height'];
        // $srcInfo['name'] = str_replace('tmp_', '', $srcInfo['name']);
        if ($_srcW < $width && $_srcH < $height) {
            copy($srcInfo['src'], $path . $srcInfo['name']);
        } else {
            $_width = ($width > $_srcW) ? $_srcW : $width;
            $_height = ($height > $_srcH) ? $_srcH : $height;
            if ($_srcW * $_width > $_srcH * $_height) {
                $_height = round($_srcH * $_width / $_srcW);
            } else {
                $_width = round($_srcW * $_height / $_srcH);
            }
            $_tempImg = null;
            if (function_exists('imagecreatetruecolor')) {
                $_tempImg = imagecreatetruecolor($_width, $_height);
                imagealphablending($_tempImg, false);
                imagesavealpha($_tempImg, true);
                imagecopyresampled($_tempImg, $imgHandle, 0, 0, 0, 0, $_width, $_height, $_srcW, $_srcH);
            } else {
                $_tempImg = imagecreate($_width, $_height);
                imagecopyresized($_tempImg, $imgHandle, 0, 0, 0, 0, $_width, $_height, $_srcW, $_srcH);
            }

            if (is_file($path . $srcInfo['name']))
                @unlink($path . $srcInfo['name']);

            switch ($srcInfo['type']) { //取得背景图片的格式
                case 1 :
                    imagegif($_tempImg, $path . $srcInfo['name']);
                    break;
                case 3 :
                    imagepng($_tempImg, $path . $srcInfo['name']);
                    break;
                default:
                    imagejpeg($_tempImg, $path . $srcInfo['name'], 90);
                    break;
            }
            imagedestroy($_tempImg);
        }

        return $srcInfo['name'];
    }

    /**
     *   ali
     * @param type $img
     * @param type $saveName
     * @param type $isBase64
     * @param type $width
     * @param type $height
     * @return type
     */
    public function saveUrlImg($img, $saveName, $isBase64 = false, $width = 0, $height = 0) {

        $_path = ROOT_PATH . 'uploads/pics/l/' . $saveName;
        if ($isBase64 == true) {

            $oss_sdk_service = new \Vendors\Ali\ALIOSS();

            // $response2 = $oss_sdk_service->upload_file_by_content(ALI_BUCKET,$saveName , array('content' => base64_decode($img), 'length' => '60000'));
            $this->aliSaveFile(base64_decode($img), 'pics/l/', $saveName, true);

            return;
        } else {
            // TODO 这里上传 微信 qq 用户的URL头像,需要裁剪!!
            $this->aliSaveFile($img, 'pics/l/', $saveName, false, true);
            return;
        }
    }

    public function ori_saveUrlImg($img, $saveName, $isBase64 = false, $width = 0, $height = 0) {

        $_path = ROOT_PATH . 'uploads/pics/l/' . $saveName;
        if ($isBase64 == true) {
            @file_put_contents($_path, base64_decode($img));
            return;
        }

        $_rs = @file_get_contents($img);
        // 剪切图片
        if ($width && $height) {

            @file_put_contents(TMP_PATH . $saveName, $_rs);

            $this->createSpecialImg($saveName, false, '', $width, $height, 'large');
            //@file_put_contents($_path, $_rs)
            //\logger::debug($_fileInfo);
            return;
        }

//       $fp = fopen($_url, 'r');
//        $res = '';
//        while (!feof($fp)) {
//            $res .= fread($fp, 1024);
//        }
//        @!file_put_contents(ROOT_PATH . UPLOAD_FOLDER_L .$_tmpImgName , $res);
//        fclose($fp);
        // @file_put_contents($_path, $_rs);
    }

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

        $oss_sdk_service = new \Vendors\Ali\ALIOSS();

        $object = $savePath . $saveName; // 保存的路径和文件名

        if ($isContentSave || $isUrlSave) {  // 通过内容上传
            $upload_file_options = array(
                'content' => $isUrlSave ? file_get_contents($fileName) : $fileName,
                'length' => strlen($fileName),
                \Vendors\Ali\ALIOSS::OSS_HEADERS => array(
                    'Expires' => '2015-01-01 08:00:00',
                ),
            );
            $response = $oss_sdk_service->upload_file_by_content(ALI_BUCKET, $object, $upload_file_options);
        } else {  // 通过本地路径上传
            $file_path = $filePath . $fileName;  // 本地的文件路径名称
//        $object = 'test1';
//        $file_path = 'http://su.bdimg.com/static/superplus/img/logo_white_ee663702.png';  // url 无法上传??
            $response = $oss_sdk_service->upload_file_by_file(ALI_BUCKET, $object, $file_path);
        }
        return $response;
    }

    public function aliCopyObject($from_object, $to_object) {
        //copy object
        $from_bucket = $to_bucket = ALI_BUCKET;

        $options = array(
            'content-type' => 'application/json',
        );
        $oss_sdk_service = new \Vendors\Ali\ALIOSS();

        $response = $oss_sdk_service->copy_object($from_bucket, $from_object, $to_bucket, $to_object, $options);
        // 创建完删除图片
        self::aliDelteObject($from_object, '');
        //\logger::debug($response);
        return $response;
    }

    public static function aliDelteObject($fileName, $savePath = '') {

        $oss_sdk_service = new \Vendors\Ali\ALIOSS();
        $object = $savePath . $fileName; // 保存的路径和文件名
        $response = $oss_sdk_service->delete_object(ALI_BUCKET, $object);

        return;
    }

    public function __get($name) {
        return $this->$name;
    }

    public function __set($name, $value) {
        $this->$name = $value;
    }

}
