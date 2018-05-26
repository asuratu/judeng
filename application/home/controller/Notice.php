<?php
namespace app\home\controller;
use app\tools\Html;
use think\Db;

class Notice extends Common
{
    /**
     * 添加公告
     */
    public function addNotice()
    {
        if ($this->request->isPost()) {
            try {
                Db::startTrans();
                $data = input('post.');
                if ($data['doctor_id'] == ''||$data['notice_name'] == ''||$data['content'] == '') {
                    ajaxReturn(array('code' => 0, 'info' => '参数不完整', 'data' => []));
                }
                $notice = array();
                $notice['notice_name'] = isset($data['notice_name']) ?  Html::getTextToHtml($data['notice_name'], 250) : '';
                $notice['content'] = isset($data['content']) ?  Html::getTextToHtml($data['content']) : '';
                $notice['doctor_id'] = $data['doctor_id'];
                $notice['add_date'] = time();
                $notice['release_date'] = $notice['add_date'];

                $noticeId = db('notice')->insertGetId($notice);

                //保存图片数据流
                foreach ($_FILES as $key => $val) {
                    $upPaperSize[$key]= array('src_size' => $_FILES[$key]['size']);
                }

                $upPaperInfo = json_decode(Model('Oss')->upPic('uploads/notice'), true);
                foreach ($upPaperInfo as $key1=>$val1) {
                    $notice_attach = array(
                        'notice_id' => $noticeId,
                        'src' => $val1,
                        'src_size' => $upPaperSize[$key1]['src_size'],
                    );
                    db('notice_attach')->insert($notice_attach);
                }

                if ($noticeId) {
                    Db::commit();
                    ajaxReturn(array('code' => 1, 'info' => 'ok'));
                } else {
                    Db::rollback();
                    ajaxReturn(array('code' => 0, 'info' => '系统繁忙, 稍后再试!'));
                }
            } catch (\Exception $e) {
                Db::rollback();
                return false;
            }
        }
    }

    // 修改功能
    public function editNotice()
    {
        if ($this->request->isPost()) {
            try {
                Db::startTrans();
                $data = input('post.');
                if ($data['notice_id'] == ''||$data['doctor_id'] == ''||$data['notice_name'] == ''||$data['content'] == '') {
                    ajaxReturn(array('code' => 0, 'info' => '参数不完整', 'data' => []));
                }
                $notice = array();
                $notice['notice_name'] = isset($data['notice_name']) ?  Html::getTextToHtml($data['notice_name'], 250) : '';
                $notice['content'] = isset($data['content']) ?  Html::getTextToHtml($data['content']) : '';
                $notice['release_date'] = time();

                $noticeId = db('notice')->where("notice_id = {$data['notice_id']} and doctor_id = {$data['doctor_id']}")->update($notice);

                // 删除已有的图片路径
                db('notice_attach')->where("notice_id = {$data['notice_id']}")->delete();

                //保存图片数据流
                foreach ($_FILES as $key => $val) {
                    $upPaperSize[$key]= array('src_size' => $_FILES[$key]['size']);
                }

                $upPaperInfo = json_decode(Model('Oss')->upPic('uploads/notice'), true);

                foreach ($upPaperInfo as $key1=>$val1) {
                    $notice_attach = array(
                        'notice_id' => $data['notice_id'],
                        'src' => $val1,
                        'src_size' => $upPaperSize[$key1]['src_size'],
                    );
                    db('notice_attach')->insert($notice_attach);
                }

                if ($noticeId) {
                    Db::commit();
                    ajaxReturn(array('code' => 1, 'info' => 'ok'));
                } else {
                    Db::rollback();
                    ajaxReturn(array('code' => 0, 'info' => '系统繁忙, 稍后再试!'));
                }
            } catch (\Exception $e) {
                Db::rollback();
                return false;
            }
        }
    }

    // 删除公告功能
    public function deleteNotice()
    {
        if ($this->request->isPost()) {
            try {
                Db::startTrans();
                $data = input('post.');
                if ($data['notice_id'] == ''||$data['doctor_id'] == '') {
                    ajaxReturn(array('code' => 0, 'info' => '参数不完整', 'data' => []));
                }

                $notice = db('notice')->where("notice_id = {$data['notice_id']} and doctor_id = {$data['doctor_id']}")->delete();

                db('notice_attach')->where("notice_id = {$data['notice_id']}")->delete();

                if ($notice) {
                    Db::commit();
                    ajaxReturn(array('code' => 1, 'info' => 'ok'));
                } else {
                    Db::rollback();
                    ajaxReturn(array('code' => 0, 'info' => '删除失败, 稍后再试!'));
                }
            } catch (\Exception $e) {
                Db::rollback();
                return false;
            }
        }
    }

    // 公告列表接口
    public function noticeList() {
        if ($this->request->isPost()) {
            $data = input('post.');
            if ($data['doctor_id'] == '') {
                ajaxReturn(array('code' => 0, 'info' => '参数不完整', 'data' => []));
            }
            if (!isset($data['page'])) {
                $data['page'] = 1;
            }
            if (!isset($data['pageSize'])) {
                $data['pageSize'] = 10;
            }
            $data['pageCount'] = ($data['page'] - 1) * $data['pageSize'];
            $doctorNotice = db('notice')->where("doctor_id = {$data['doctor_id']}")
                ->field('notice_id, notice_name, add_date')
                ->order('release_date', 'DESC')
                ->limit($data['pageCount'],$data['pageCount'])
                ->select();
            $notice = array();
            foreach ($doctorNotice as $key => $val) {
                array_push($notice, $val);
                $notice[$key]['notice_name'] = $val['notice_name'];
                $notice[$key]['add_date'] = date('Y-m-d', $val['add_date']);
            }

            ajaxReturn(array('code' => 1, 'info' => 'ok', 'data' => $notice));
        }
    }

    // 公告详情查询
    public function findNotice()
    {
        if ($this->request->isPost()) {
            $data = input('post.');
            if ($data['notice_id'] == '') {
                ajaxReturn(array('code' => 0, 'info' => '参数不完整', 'data' => []));
            }

            $notice = db('notice')->where("notice_id = {$data['notice_id']}")->field('notice_id, doctor_id, notice_name, content, release_date')->find();
            $notice['release_date'] = date('Y-m-d', $notice['release_date']);
            $notice_attach = db('notice_attach')->where("notice_id = {$data['notice_id']}")->select();
            $attach = array();
            foreach ($notice_attach as $key => $val) {
                array_push($attach, $val);
            }
            $notice['attach'] = $attach;

            if ($notice) {
                ajaxReturn(array('code' => 1, 'info' => 'ok', 'data' => $notice));
            } else {
                ajaxReturn(array('code' => 0, 'info' => '公告内容不存在，请刷新后再试!'));
            }
        }
    }

}
