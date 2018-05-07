<?php

namespace app\tools;

/**
 * Class Auxi
 * @package Tools
 */
class Auxi {

    /**
     * 数据库保留数据
     * @param $id
     * @param $needId
     * @return int|string
     */
    public static function databaseNeedId($id, $needId) {
        if (strpos($id, ',') === false) {
            return intval($id);
        } else {
            $ary = explode(',', $id);
            if (!in_array($needId, $ary))
                return $id;
            for ($i = 0; $i < count($ary); $i++) {
                if (intval($ary[$i]) == $needId)
                    unset($ary[$i]);
            }
            return implode(',', $ary);
        }
    }

    /**
     * 验证必须字段
     * @param $mustFields
     * @param $request
     */
    public static function checkMustField($mustFields, $request) {
        $ary = array();
        foreach ($mustFields as $field) {
            if (!isset($request[$field])) {
                array_push($ary, $field);
            }
        }
        if (!empty($ary)) {
            $message = implode(',', $ary) . '  参数缺失!';
            return $message;
        }
    }

    /**
     * 允许的文件类型
     * @param $uploadType
     * @param $picExtName
     * @param $fileExtName
     * @return string
     */
    public static function allowType($uploadType, $picExtName, $fileExtName) {
        return strcasecmp('img', $uploadType) == 0 ? implode(' ', $picExtName) : implode(' ', $fileExtName);
    }

    /**
     * 过滤特殊字符
     * @param $str
     * @return mixed|string
     */
    public static function getSafeStr($str) {
        if (isset($str)) {
            $_temp = addslashes(trim($str));
            $_temp = str_replace('_', '\_', $_temp);
            $_temp = str_replace('%', '\%', $_temp);
            return $_temp;
        }
    }

    /**
     * @param $timestamp
     * @return bool|string
     */
    public static function getTime($timestamp) {
        if ($timestamp)
            return date('Y-m-d H:i:s', $timestamp);
    }

    /**
     * @param $timestamp
     * @return bool|string
     */
    public static function getShortTime($timestamp) {
        if ($timestamp)
            return date('Y-m-d', $timestamp);
    }

    /**
     * @param $timestamp
     * @return bool|string
     */
    public static function getShortTimeEnd($timestamp) {
        if ($timestamp)
            return date('H:i:s', $timestamp);
    }


    /**
     * 是否启用代理ip访问
     * @return boolean
     */
    public static function isProxyIp() {
        if ($_SERVER['HTTP_X_FORWARDED_FOR'] ||
            $_SERVER['HTTP_X_FORWARDED'] ||
            $_SERVER['HTTP_FORWARDED_FOR'] ||
            $_SERVER['HTTP_CLIENT_IP'] ||
            $_SERVER['HTTP_VIA'] ||
            in_array($_SERVER['REMOTE_PORT'], array(8080, 80, 6588, 8000, 3128, 553, 554)) ||
            @fsockopen($_SERVER['REMOTE_ADDR'], 80, $errno, $errstr, 30)) {
            return true; //caught
        }
        return false;
    }

    /**
     * 获取真实IP
     * @return string
     */
    public static function getIP() {
        if (isset($_SERVER)) {
            if (isset($_SERVER['HTTP_CLIENT_IP'])) {
                $_realIp = $_SERVER['HTTP_CLIENT_IP'];
            } else if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
                $_realIp = $_SERVER['HTTP_X_FORWARDED_FOR'];
            } else {
                $_realIp = $_SERVER['REMOTE_ADDR'];
            }
        } else {
            if (getenv('HTTP_CLIENT_IP')) {
                $_realIp = getenv('HTTP_CLIENT_IP');
            } else if (getenv('HTTP_X_FORWARDED_FOR')) {
                $_realIp = getenv('HTTP_X_FORWARDED_FOR');
            } else {
                $_realIp = getenv('REMOTE_ADDR');
            }
        }
        if (strcmp('::1', $_realIp) == 0 || !$_realIp) {
            $_realIp = '127.0.0.1';
        }
        return $_realIp;
    }

    /**
     * @param $text
     * @param $array
     * @return string|void
     */
    public static function getArrayContent($text, $array) {
        if (!$text)
            return;
        $temp = explode(',', $text);
        $return = '';
        foreach ($temp as $v) {
            $return .= $array[intval($v)] . '　';
        }
        return $return;
    }

    /**
     * 随机构造密码或编号
     * @param $length
     * @return string
     */
    public static function randomCode($length) {
        $_hash = '';
        $_chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
        $_max = strlen($_chars) - 1;
        mt_srand((double) microtime() * 1000000);
        for ($i = 0; $i < $length; $i++) {
            $_hash .= $_chars[mt_rand(0, $_max)];
        }
        return $_hash;
    }

    /**
     * @return int
     */
    public static function randomNumPassword() {
        mt_srand((double) microtime() * 1000000);
        return intval(90000000 * (mt_rand(0, 10000000) / 10000000)) + 10000000;
    }

    /**
     * @param int $min
     * @param int $max
     * @return int
     */
    public static function randomNum($min = 1, $max = 4) {
        mt_srand((double) microtime() * 1000000);
        return intval(mt_rand($min, $max));
    }

    /**
     * @return float
     */
    public static function getMicroTime() {
        list($_usec, $_sec) = explode(' ', microtime());
        return ((float) $_usec + (float) $_sec);
    }

    /**
     * uuid
     * @return string
     */
    public static function guid() {
        $_uuid = '';
        if (function_exists('com_create_guid')) {
            $_uuid = com_create_guid();
        } else {
            //mt_srand((double) microtime() * 10000); //optional for php 4.2.0 and up.
            $_charid = strtoupper(md5(uniqid(rand(), true)));
            $_hyphen = chr(45); // "-"
            $_uuid = chr(123)// "{"
                . substr($_charid, 0, 8) . $_hyphen
                . substr($_charid, 8, 4) . $_hyphen
                . substr($_charid, 12, 4) . $_hyphen
                . substr($_charid, 16, 4) . $_hyphen
                . substr($_charid, 20, 12)
                . chr(125); // "}"
        }
        return strtolower(trim($_uuid, '{}'));
    }

    /**
     * 获取生成文档列表页面的名称
     * @param $i 是否为第一个，命名为index
     * @param $categoryId
     * @param $list_dir 自定义的页面名称
     * @param bool $showIndex
     * @return string
     */
    public static function getArchivesListName($i, $categoryId, $list_dir, $showIndex = true) {
        $_temp = '';
        if ($i == 0) {
            $_temp = ($showIndex ? 'index.html' : '');
        } else {
            $_temp = ($list_dir ? $list_dir : 'list_' . intval($categoryId)) . '.html';
        }
        return $_temp;
    }

    /**
     * 打招呼
     * @return string
     */
    public static function sayHi() {
        $_hiHour = date('H', time());
        if ($_hiHour >= 0 && $_hiHour < 6)
            return '现在都凌晨啦，该休息了^.^';
        else if ($_hiHour >= 6 && $_hiHour < 9)
            return '早上好';
        else if ($_hiHour >= 9 && $_hiHour < 12)
            return '上午好';
        else if ($_hiHour >= 12 && $_hiHour < 13)
            return '中午好';
        else if ($_hiHour >= 13 && $_hiHour < 17)
            return '下午好';
        else if ($_hiHour >= 17 && $_hiHour < 19)
            return '傍晚好';
        else if ($_hiHour >= 19 && $_hiHour < 22)
            return '晚上好';
        else
            return '很晚了，早点睡吧';
    }

    /**
     * 输出level的颜色区分
     * @param $intLevel
     * @return string
     */
    public static function getDeepColor($intLevel) {
        $_temp = '';
        switch (intval($intLevel)) {
            case 1:
                $_temp = ' style="color:#01B468;"';
                break;
            case 2:
                $_temp = ' style="color:#0080FF;"';
                break;
            case 3:
                $_temp = ' style="color:#408080;"';
                break;
            case 4:
                $_temp = ' style="color:#8E8E8E;"';
                break;
            case 5:
                $_temp = ' style="color:#4F4F4F;"';
                break;
            case 6:
                $_temp = ' style="color:#FF8040;"';
                break;
            case 7:
                $_temp = ' style="color:#ba40e3;"';
                break;
            default:
                $_temp = ' style="color:#CE0000;"';
                break;
        }
        return $_temp;
    }

    public static function getColorLevel(& $ary, $value) {
        $value = intval($value);
        return '<span' . self::getDeepColor($value) . '>' . $ary[$value] . '</span>';
    }

    /**
     * 来自PHPMailer::ValidateAddress
     * @param $email
     * @return bool|int
     */
    public static function isValidEmail($email) {
        if (function_exists('filter_var')) { //Introduced in PHP 5.2
            if (filter_var($email, FILTER_VALIDATE_EMAIL) === FALSE) {
                return false;
            } else {
                return true;
            }
        } else {
            return preg_match('/^(?:[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+\.)*'
                . '[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+@(?:(?:(?:[a-zA-Z0-9_]'
                . '(?:[a-zA-Z0-9_\-](?!\.)){0,61}[a-zA-Z0-9_-]?\.)+[a-zA-Z0-9_]'
                . '(?:[a-zA-Z0-9_\-](?!$)){0,61}[a-zA-Z0-9_]?)|'
                . '(?:\[(?:(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\.){3}'
                . '(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\]))$/', $email);
        }
    }

    /**
     * @param $ip
     * @return string
     */
    public static function getKillIp($ip) {
        $_tempIp = explode('.', $ip);
        return $_tempIp[0] . '.' . $_tempIp[1];
    }

    /**
     * 获取分页传值
     * @param $currentPage
     * @return int
     */
    public static function getCurrentPage($currentPage) {
        $currentPage = intval($currentPage);
        return $currentPage == 0 ? 1 : $currentPage;
    }

    /**
     * 比较数字是否相等，然后着色
     * @param $obj1
     * @param $obj2
     * @param string $className
     * @param string $hold 保留样式
     * @return string
     */
    public static function compareSelect($obj1, $obj2, $className = 'current', $hold = '') {
        $obj1 = '|' . trim($obj1, '|') . '|';
        $obj2 = '|' . $obj2 . '|';
        return self::comparePath($obj1, $obj2, $className, $hold);
    }

    /**
     * 比较路径，如果包含指定则着色
     * @param $obj1
     * @param $obj2
     * @param string $className
     * @param string $hold 保留样式
     * @return string
     */
    public static function comparePath($obj1, $obj2, $className = 'current', $hold = '') {
        return strpos($obj1, $obj2) !== false ? ' class="' . $className
            . ($hold != '' ? ' ' . $hold : '') . '"' : ($hold != '' ? ' class="' . $hold . '"' : '');
    }

    /**
     * 比较bool值，为真则着色
     * @param $bool
     * @param string $className
     * @param string $hold
     * @return string
     */
    public static function compareBool($bool, $className = 'current', $hold = '') {
        return $bool ? ' class="' . $className
            . ($hold != '' ? ' ' . $hold : '') . '"' : ($hold != '' ? ' class="' . $hold . '"' : '');
    }

    /**
     * 递归获取显示id及list_dir
     * @param $value
     * @param $categoryId
     * @return array
     */
    public static function getChildTypeIdListDir(& $value, $categoryId) {
        if (self::typeHasChild($value) && $value['is_part'] == 0) {//自身是列表页但含有子栏目，则显示第一个子栏目
            $categoryId = key($value);
            return self::getChildTypeIdListDir($value[$categoryId], $categoryId);
        }
        return array($categoryId, $value['list_dir']);
    }

    /**
     * 获取动态页面的现实id
     * @param $aryChannelTypeMapping
     * @param $package
     * @param $value
     * @param $categoryId
     * @return string
     */
    public static function getDynamicListName(& $aryChannelTypeMapping,
                                              & $package, & $value, $categoryId) {
        if (self::typeHasChild($value) && $value['is_part'] == 0) {
            $categoryId = key($value);
            return self::getDynamicListName($aryChannelTypeMapping, $package, $value[$categoryId], $categoryId);
        }
        if ($value['list_dir'] != '')
            return $value['list_dir'] . '/';
        else
            return $aryChannelTypeMapping[$package][$value['channel_type']][1]
                . '/' . $categoryId;
    }

    /**
     * 判断类别数组视图中某一项是否含有子类
     * @param $ary
     * @return bool
     */
    public static function typeHasChild(& $ary) {
        if (!is_array($ary))
            return false;
        reset($ary);
        return is_array(current($ary));
    }

    /**
     * 判断第一项的id号，用于无限级分类目录中第一项是否使用index命名
     * @param $ary
     * @param $id
     * @param int $limit
     * @return bool
     */
    public static function isDataViewIndexId($ary, $id, $limit = 3) {
        if (!is_array($ary) || count($ary) <= 0)
            return false;
        //从level = 2开始，实际上是level - 1级，即上一级可获取到第一项id
        reset($ary);
        for ($_i = 2; $_i < $limit; $_i++) {
            while (list(, $_value) = each($ary)) {
                if ($_value['is_part'] < 2) {
                    $ary = $_value;
                    break;
                }
            }
            if (is_array($ary) && count($ary) > 0)
                reset($ary);
        }
        return (is_array($ary) ? key($ary) : 0) == $id;
    }

    public static function isIE6() {
        return strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE 6.0') !== false ? true : false;
    }

    public static function thumb($thumb, $wh = 200) {
        if ($thumb) {
            return preg_replace('/(\.\w+)$/', 'x' . $wh . '$1', $thumb);
        }
        if ($wh == 200) {
            return 'no_img.png';
        }
        return 'no_img_big.png';
    }

    public static function pathInfo($filePath) {
        $pathParts = array();
        $pathParts['DIRNAME'] = rtrim(substr($filePath, 0, strrpos($filePath, '/')), '/') . '/';
        $pathParts['BASENAME'] = ltrim(substr($filePath, strrpos($filePath, '/')), '/');
        $pathParts['EXTENSION'] = substr(strrchr($filePath, '.'), 1);
        $pathParts['FILENAME'] = ltrim(substr($pathParts['BASENAME'], 0, strrpos($pathParts['BASENAME'], '.')), '/');
        return $pathParts;
    }

    public static function age($birthday, $currentTime = null) {
        if ($birthday > 0) {
            $currentTime = is_null($currentTime) ? time() : $currentTime;
            return date('Y', $currentTime) - date('Y', $birthday);
        }
        return '-';
    }

    public static function readJsonVersion($type = 'framework') {
        $_path =  array(
            'framework' => 'vendor/phoenix/framework/composer.json',
            'cms' => 'composer.json'
        );
        return json_decode(file_get_contents(ROOT_PATH . $_path[$type]), true);
    }

    /**
     *  验证手机号
     */
    public static function isValidMobile($mobile = '') {

        return preg_match('/^1\d{10}$/', $mobile);
    }

    public static function array_sort($arr, $keys, $type='asc'){
        $keysValue = $new_array = array();
        foreach ($arr as $k => $v) {
            $keysValue[$k] = $v[$keys];
        }
        if ($type == 'asc'){
            asort($keysValue);
        } else {
            arsort($keysValue);
        }
        reset($keysValue);
        foreach ($keysValue as $k => $v){
            $new_array[$k] = $arr[$k];
        }
        return $new_array;
    }

    // 获取地址的经纬度
    public static function getCoordinate($place) {
        $place = trim($place);
        $lat = '';
        $lng = '';

        if ($place) {
            $ak = 'mZ3Wyrss6YU5G0bObFCBPRKZXGNa70ce';
            $url = "http://api.map.baidu.com/geocoder/v2/?address={$place}&output=json&ak={$ak}";
            $response = file_get_contents($url);
            $r = json_decode($response);
            if ($r->status == 0) {
                $lat = round($r->result->location->lat, 6);
                $lng = round($r->result->location->lng, 6);
            }
        }
        return array('lat' => $lat, 'lng' => $lng);
    }

    /**
     * 计算两点地理坐标之间的距离
     * @param  Decimal $longitude1 起点经度 121
     * @param  Decimal $latitude1  起点纬度 31
     * @param  Decimal $longitude2 终点经度 121
     * @param  Decimal $latitude2  终点纬度 31
     * @param  Int     $unit       单位 1:米 2:公里
     * @param  Int     $decimal    精度 保留小数位数
     * @return Decimal
     */
    public static function getDistance($longitude1, $latitude1, $longitude2, $latitude2, $unit=1, $decimal=2){

        $EARTH_RADIUS = 6370.996; // 地球半径系数
        $PI = 3.1415926;

        $radLat1 = $latitude1 * $PI / 180.0;
        $radLat2 = $latitude2 * $PI / 180.0;

        $radLng1 = $longitude1 * $PI / 180.0;
        $radLng2 = $longitude2 * $PI /180.0;

        $a = $radLat1 - $radLat2;
        $b = $radLng1 - $radLng2;

        $distance = 2 * asin(sqrt(pow(sin($a/2),2) + cos($radLat1) * cos($radLat2) * pow(sin($b/2),2)));
        $distance = $distance * $EARTH_RADIUS * 1000;

        if($unit==2){
            $distance = $distance / 1000;
        }

        return round($distance, $decimal);

    }

}
