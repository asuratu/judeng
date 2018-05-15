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
                $upPaperInfo = [];
                foreach ($_FILES as $key => $val) {
                    $file = request()->file($key);
                    $path = ROOT_PATH . 'uploads/notice/';
                    $result = $file->move($path);
                    $upPaperInfo[]= array('src' => '/uploads/notice/' . $result->getSaveName(), 'src_size' => $_FILES[$key]['size']);
                }

                foreach ($upPaperInfo as $val) {
                    $notice_attach = array(
                        'notice_id' => $noticeId,
                        'src' => $val['src'],
                        'src_size' => $val['src_size'],
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
                $upPaperInfo = [];
                foreach ($_FILES as $key => $val) {
                    $file = request()->file($key);
                    $path = ROOT_PATH . 'uploads/notice/';
                    $result = $file->move($path);
                    $upPaperInfo[]= array('src' => '/uploads/notice/' . $result->getSaveName(), 'src_size' => $_FILES[$key]['size']);
                }

                foreach ($upPaperInfo as $val) {
                    $notice_attach = array(
                        'notice_id' => $data['notice_id'],
                        'src' => $val['src'],
                        'src_size' => $val['src_size'],
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

    // 删除功能
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

}
