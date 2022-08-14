;;; init-sdcv.el --- Configuration file for sdcv.el
(require 'sdcv)

(setq sdcv-say-word-p t)                ;say word after search

(setq sdcv-dictionary-data-dir (concat sweet-emacs-root-dir "/sdcv-dict")) ;设置星际译王本地词典的目录

(setq sdcv-dictionary-simple-list    ;星际译王屏幕取词词典, 简单, 快速
      '("懒虫简明英汉词典"
        "懒虫简明汉英词典"
        "KDic11万英汉词典"))

(setq sdcv-dictionary-complete-list     ;星际译王的词典, 完全, 详细
      '(
        "懒虫简明英汉词典"
        "英汉汉英专业词典"
        "XDICT英汉辞典"
        "stardict1.3英汉辞典"
        "WordNet"
        "XDICT汉英辞典"
        "Jargon"
        "懒虫简明汉英词典"
        "FOLDOC"
        "新世纪英汉科技大词典"
        "KDic11万英汉词典"
        "朗道汉英字典5.0"
        "CDICT5英汉辞典"
        "新世纪汉英科技大词典"
        "牛津英汉双解美化版"
        "21世纪双语科技词典"
        "quick_eng-zh_CN"
        ))


(provide 'init-sdcv)
;;; init-sdcv.el ends here

