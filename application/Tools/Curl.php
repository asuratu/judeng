<?php

namespace App\Tools;


class Curl {

    public static final function http($url, $data = null) {
        $_ch = curl_init();
        curl_setopt($_ch, CURLOPT_URL, $url);
        if (!is_null($data)) {
            curl_setopt($_ch, CURLOPT_PORT, 1);
            curl_setopt($_ch, CURLOPT_POSTFIELDS, $data);
        }
        curl_setopt($_ch, CURLOPT_RETURNTRANSFER, 1);
        $_output = curl_exec($_ch);
        curl_close($_ch);
        return $_output;
    }

    public static final function https($url, $data = null) {
        $_ch = curl_init();
        curl_setopt($_ch, CURLOPT_URL, $url);
        curl_setopt($_ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($_ch, CURLOPT_SSL_VERIFYHOST, false);
        if (!is_null($data)) {
            curl_setopt($_ch, CURLOPT_PORT, 1);
            curl_setopt($_ch, CURLOPT_POSTFIELDS, $data);
        }
        curl_setopt($_ch, CURLOPT_RETURNTRANSFER, 1);
        $_output = curl_exec($_ch);
        curl_close($_ch);
        return $_output;
    }

    public static final function httpPostXml($url, $xmlData) {
        $_ch = curl_init();
        $_header[] = 'Content-type: text/xml'; //����content-typeΪxml
        curl_setopt($_ch, CURLOPT_URL, $url); //������ύ��ַ
        curl_setopt($_ch, CURLOPT_POST, 1);   //�����ύ���� 1��POST ��0��GET
        curl_setopt($_ch, CURLOPT_HEADER, 1); //�����Ƿ���ʾ״̬ͷ 1����ʾ �� 0������ʾ
        curl_setopt($_ch, CURLOPT_HTTPHEADER, $_header);//������������
        curl_setopt($_ch, CURLOPT_RETURNTRANSFER, 0);//�����Ƿ�ֱ�����������
        curl_setopt($_ch, CURLOPT_POSTFIELDS, $xmlData); //�����ύ�����ݣ�������XML�ļ�
        $_output = curl_exec($_ch);
        curl_close($_ch);//�ر�
        return $_output;
    }

}
