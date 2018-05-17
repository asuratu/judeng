<?php
namespace app\home\controller;
use app\tools\Html;
use think\Db;

class Question extends Common
{
    /**
     * 问题列表
     */
    public function findQuestionList()
    {
        if ($this->request->isPost()) {

            $question = Db::field('t.`type_id`, t.`type_name`, q.`question_id`, q.`question_title`')
                ->table('jd_question_type t, jd_question q')
                ->where("t.`type_id` = q.`type_id` and q.`is_display` = 1")
                ->order('t.sort ASC, t.type_id ASC, q.sort', 'DESC')
                ->select();
            $question_type = $this->leftSort($question);
            ajaxReturn(array('code' => 1, 'info' => 'ok', 'data' => $question_type));
        }
    }

    public function leftSort($question) {
        $question_type = array();
        $question_id = '';
        $question_key = 0;
        $question_title = 0;
        $i = 0;
        foreach ($question as $val) {
            if ($question_id != $val['type_id']) {
                $question_type[$i]['type_id'] = $val['type_id'];
                $question_type[$i]['type_name'] = $val['type_name'];
                $question_key = $i;
                $question_title = 0;
                $i++;
            } else {
                $question_title++;
            }
            $question_id = $val['type_id'];
            $question_type[$question_key]['question'][$question_title]['question_id'] = $val['question_id'];
            $question_type[$question_key]['question'][$question_title]['question_title'] = $val['question_title'];
            $question_type[$question_key]['question'][$question_title]['question_url'] = $this->view->setting['base_host'] . '/' . $val['question_id'];;
        }
        return $question_type;
    }


}
